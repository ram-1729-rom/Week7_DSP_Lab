wc = pi/3;        
N = 21;           

rectangular_window = ones(1, N);  
rectangular_filter = fir1(N-1, wc/pi, rectangular_window);

blackman_window = blackman(N);  
blackman_filter = fir1(N-1, wc/pi, blackman_window);

% Impulse responses
figure;
subplot(2, 1, 1);
stem(rectangular_filter, 'filled');
title('Impulse Response of Rectangular Window Filter');
xlabel('Sample');
ylabel('Amplitude');

subplot(2, 1, 2);
stem(blackman_filter, 'filled');
title('Impulse Response of Blackman Window Filter');
xlabel('Sample');
ylabel('Amplitude');

% Bode plots (magnitude)
figure;
[h_rect, w_rect] = freqz(rectangular_filter, 1, 1024);
[h_black, w_black] = freqz(blackman_filter, 1, 1024);

subplot(2, 1, 1);
semilogx(w_rect, 20*log10(abs(h_rect)));
title('Bode Analysis of Rectangular Window Filter (Magnitude)');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude (dB)');
grid on;

subplot(2, 1, 2);
semilogx(w_black, 20*log10(abs(h_black)));
title('Bode Analysis of Blackman Window Filter (Magnitude)');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude (dB)');
grid on;

% Bode plots (phase)
[~, phi_rect] = freqz(rectangular_filter, 1, 1024, 'whole');
[~, phi_black] = freqz(blackman_filter, 1, 1024, 'whole');

figure;
subplot(2, 1, 1);
semilogx(w_rect, unwrap(angle(h_rect)));
title('Bode Analysis of Rectangular Window Filter (Phase)');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');
grid on;

subplot(2, 1, 2);
semilogx(w_black, unwrap(angle(h_black)));
title('Bode Analysis of Blackman Window Filter (Phase)');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');
grid on;
