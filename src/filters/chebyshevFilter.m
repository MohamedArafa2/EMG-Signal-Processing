function y = chebyshevFilter(emg_signal)
% Function to perform Chebyshev filtering on an EMG signal

% Define the filter parameters
fs = 1000;            % Sampling frequency
fc_cheby = 100;       % Cutoff frequency for Chebyshev filter
n_cheby = 5;          % Filter order for Chebyshev filter
ripple = 1;           % Passband ripple (in dB) for Chebyshev filter

% Design the Chebyshev filter
[b_cheby, a_cheby] = cheby1(n_cheby, ripple, fc_cheby/(fs/2));  % Compute the filter coefficients

% Apply the Chebyshev filter
y = filtfilt(b_cheby, a_cheby, emg_signal);  % Apply the filter to the signal using filtfilt

% Plotting the filtered signal
subplot(5, 1, 3);
plot(y);
title('Filtered Chebyshev EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

end
