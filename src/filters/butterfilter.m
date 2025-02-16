function y = butterfilter(emg_signal)
% Function to perform butterworth filtering on an EMG signal

% Define the filter parameters
fs = 1000;  % Sampling frequency
fc = 50;   % Cutoff frequency
n = 4;     % Filter order

% Design the filter
[b, a] = butter(n, fc/(fs/2));  % Compute the filter coefficients

% Filter the signal
y = filtfilt(b, a, emg_signal);  % Apply the filter to the signal using filtfilt

% Plotting the original and filtered signals
subplot(5, 1, 1);
plot(emg_signal);
title('Original EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 2);
plot(y);
title('Filtered butter EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

end
