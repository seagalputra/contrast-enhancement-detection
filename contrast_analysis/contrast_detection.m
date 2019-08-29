function F = contrast_detection(img, c, pinch_size)

if nargin < 3
    c = 112;
    pinch_size = 4;
end

double_img = im2double(img);
% create histogram image
hist_image = hist(double_img(:), linspace(0,1,256));

gx = pinch_off(hist_image, pinch_size);
% DFT of histogram image
Gx = fft(gx, 256);
Gx = abs(Gx);
% calculate energy for high frequency component
beta = ones(1, size(Gx,2));
idx = find(beta);
loc_idx = idx >= c & idx <= 128;
F = sum(Gx(loc_idx)) / size(img(:),1);

end