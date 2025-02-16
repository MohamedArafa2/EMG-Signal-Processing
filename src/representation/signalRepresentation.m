function [fourierTransform] = signalRepresentation(OriginalSignal)
% Function to perform signal representation

%% Step 1: Display time domain and plot
% Create a figure and subplot to display the time domain signal
subplot(2, 2, 1);
plot(OriginalSignal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time Domain Signal');

%% Step 2: Fourier transform
% Perform the Fourier transform on the original signal
fourierTransform = fft(OriginalSignal);

%% Step 3: Display frequency domain and plot
% Calculate the frequencies and amplitudes for the frequency domain plot
samplingFrequency = 1000;  % Set the sampling frequency
frequencies = linspace(0, samplingFrequency, length(OriginalSignal));
amplitudes = abs(fourierTransform) / length(OriginalSignal);

% Create a subplot to display the frequency domain signal
subplot(2, 2, 2);
plot(frequencies, amplitudes);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain Signal');

%% Step 4: Spectrogram
% Create a subplot to display the spectrogram of the original signal
subplot(2, 2, [3, 4]);
spectrogram(OriginalSignal, 128, 120, 128, samplingFrequency, 'yaxis');
title('Spectrogram');

end
