function out_img = power_law(img, gamma)
r = double(img)/255;
c = 1;
out_img = c*(r).^gamma;
end