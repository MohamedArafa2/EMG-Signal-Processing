function y = firFilter(emg_signal)
% Function to perform Finite Impulse Response (FIR) filtering on an EMG signal

% Define the filter parameters
fs = 1000;             % Sampling frequency
fc_fir = 100;          % Cutoff frequency for FIR filter
filter_length = 51;    % Filter length for the FIR filter

% Design the FIR filter using the Parks-McClellan algorithm
b_fir = fir1(filter_length, fc_fir/(fs/2));

% Apply the FIR filter to the input signal
y = filter(b_fir, 1, emg_signal);

% Plotting the filtered signal
subplot(5, 1, 4);
plot(y);
title('Filtered FIR EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

end
