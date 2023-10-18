N = 64;

rec_win = ones(1, N);
hamm_win = hamming(N);
hann_win = hanning(N);

window_length = 64;
rec_win = ones(1, window_length);

% Rectangular window
figure;
plot(rec_win);
title('Rectangular Window');
xlabel('Sample');
ylabel('Amplitude');

window_length = 64;
hamm_win = hamming(window_length);

% Hamming window
figure;
plot(hamm_win);
title('Hamming Window');
xlabel('Sample');
ylabel('Amplitude');

window_length = 64;
hann_win = hann(window_length);

% Hanning window
figure;
plot(hann_win);
title('Hanning Window');
xlabel('Sample');
ylabel('Amplitude');


% Frequency response 
figure;
freqz(rec_win, 1, 1024, 1);
title('Rectangular Window');

figure;
freqz(hamm_win, 1, 1024, 1);
title('Hamming Window');

figure;
freqz(hann_win, 1, 1024, 1);
title('Hanning Window');
