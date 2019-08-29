function plot_angular(image_histogram)
N = 256;
X = fft(image_histogram, N);
plot(abs(X));
plot(abs(fftshift(X)));
w = 2*pi * (0:(N-1)) / N;
w2 = fftshift(w);
plot(w2);
w3 = unwrap(w2 - 2*pi);
plot(w3);
plot(w3, abs(fftshift(X)));
xlabel('radians');
plot(w3/pi, abs(fftshift(X)));
xlabel('radians / \pi');
end