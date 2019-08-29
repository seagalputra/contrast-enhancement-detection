function ce = iscontrast_enhancement(F, thresh)

if nargin < 2
    thresh = 0.5;
end

if (F < thresh)
    ce = 0;
    % disp('image is not contrast enhancement');
elseif (F >= thresh)
    ce = 1;
    % disp('image is contrast enhancement');
end

end