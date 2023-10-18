N = 64;
alpha = 2; 

N_values = [100, 200, 300];
N_DFT = 1024;

freq_axis = (0:N_DFT-1) / N_DFT;

for N = N_values
    
    blackman_win = blackman(N);
   
    t = 0:1/N:(N-1)/N;
    signal = alpha * cos(2 * pi * 0.1 * t); 
   
    windowed_signal = signal .* hann_win;
   
    dft = fft(windowed_signal, N_DFT);
   
    normalized_magnitude = abs(dft) / N;
   
    plot(freq_axis, 20*log10(normalized_magnitude));
    hold on;
end

title('Magnitude Spectrum of Blackman-Windowed Signal');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
legend('N=100','N=200','N=300');

grid on;
hold off;

