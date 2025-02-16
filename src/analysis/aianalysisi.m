function [mean1, med1, var1, mean2, med2, var2] = aianalysisi(originalSignal, filtred)
% Function to analyze EMG signals and compute various characteristics

% Step 1: Compute and plot mean for original signal
mean1 = mean(originalSignal);

% Step 2: Compute and plot median for original signal
med1 = median(originalSignal);

% Step 3: Compute and plot variance for original signal
var1 = var(originalSignal);

% Step 4: Compute and plot spectral characteristics for original signal
fs = 1000;                % Sampling frequency (modify according to your signal)
window_size = 1024;       % Window size for FFT
overlap = 0.5;            % Overlap between consecutive windows (50%)
noverlap = window_size * overlap;    % Number of samples overlapped
nfft = 2 * window_size;   % Number of FFT points

[Pxx, f] = pwelch(originalSignal, window_size, noverlap, nfft, fs);

% Step 5: Detect abnormalities in original signal
abnormal_threshold = 10;  % Define the abnormality threshold in dB

% Find indices where power exceeds the threshold
abnormal_indices = find(10 * log10(Pxx) > abnormal_threshold);

if ~isempty(abnormal_indices)
    disp('Abnormalities detected in original signal at frequencies:');
    disp(f(abnormal_indices));
else
    disp('No abnormalities detected in original signal.');
end

% Plot the power spectrum of original signal
subplot(2, 2, 1);
plot(f, 10 * log10(Pxx));
xlabel('Frequency (Hz)');
ylabel('Power Spectrum (dB)');
title('Power Spectrum of Original Signal');

% Compute and plot spectral characteristics for filtered signal
[Pxx_filt, f_filt] = pwelch(filtred, window_size, noverlap, nfft, fs);

% Detect abnormalities in filtered signal
abnormal_indices_filt = find(10 * log10(Pxx_filt) > abnormal_threshold);

if ~isempty(abnormal_indices_filt)
    disp('Abnormalities detected in filtered signal at frequencies:');
    disp(f_filt(abnormal_indices_filt));
else
    disp('No abnormalities detected in filtered signal.');
end

% Plot the power spectrum of filtered signal
subplot(2, 2, 2);
plot(f_filt, 10 * log10(Pxx_filt));
xlabel('Frequency (Hz)');
ylabel('Power Spectrum (dB)');
title('Power Spectrum of Filtered Signal');

% Compute and plot mean, median, and modified variance for original signal
var2 = var1 * power(10, -5);
X = categorical({'Mean', 'Median', 'Variance'});
X = reordercats(X, {'Mean', 'Median', 'Variance'});
Y = [mean1, med1, var2];

subplot(2, 2, 3);
bar(X, Y);
title('Characteristics - Original Signal');

% Compute and plot mean, median, and variance for filtered signal
mean2 = mean(filtred);
med2 = median(filtred);
var2 = var(filtred);
var2 = var2 * power(10, -3);
X_filt = categorical({'Mean', 'Median', 'Variance'});
X_filt = reordercats(X_filt, {'Mean', 'Median', 'Variance'});
Y_filt = [mean2, med2, var2];

subplot(2, 2, 4);
bar(X_filt, Y_filt);
title('Characteristics - Filtered Signal');

end
