function filtered = notchFilter(emgSignal)
% Function to apply a notch filter to an EMG signal

% Define filter parameters
Fs = 1000;          % Sampling frequency
f0 = 50;            % Notch frequency
bw = 200 / Fs;      % Bandwidth of the notch, normalized

% Design the notch filter
wo = f0 / (Fs/2);   % Normalize the frequency
Q = wo / bw;        % Quality factor
[b, a] = iirnotch(wo, Q);  % Design an IIR notch filter

% Apply the notch filter to the EMG signal
filtered = filter(b, a, emgSignal);

% Plot the filtered signal
subplot(5, 1, 5);
plot(filtered);
xlabel('Time');
ylabel('Amplitude');
title('Filtered EMG Signal');
grid on;

% Display the filtered signal
disp('Filtered notch EMG Signal:');
disp(filtered);

end
