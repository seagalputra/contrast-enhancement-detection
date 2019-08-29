function normalized_hist = pinch_off(hist, N)

if nargin < 2
    N = 4;
end

for i = 1:size(hist,2)
    if (i <= N)
        px = 0.5 - (0.5*cos(pi*i/N));
    elseif (i >= 255 - N)
        px = 0.5 + (0.5*cos(pi*(i - 255 + N)/N));
    else
        px = 1;
    end
    normalized_hist(i) = px*hist(i);
end
end