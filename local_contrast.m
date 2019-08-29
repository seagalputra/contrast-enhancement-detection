% This algorithm is for detecting contrast enhancement locally
% clear; clc; close all;

addpath('contrast_analysis');

img = imread('cameraman.tif');

%% split image into several block
block_rows = 100;
block_cols = 100;
img_block = split_block(img, block_rows, block_cols);

%% create contrast enhancement
for i = 1:size(img_block,1)
    for j = 1:size(img_block,2)
        if i == 2 && j == 3
            img_block{i,j} = power_law(img_block{i,j}, 0.5);
        end
    end
end

%% calculate every block
% PARAMETER
threshold = 0.6;
c = 112;
pinch_size = 4;

for i = 1:size(img_block,1)
    for j = 1:size(img_block,2)
        disp(['detecting image block-',num2str(i),',',num2str(j)]);
        F = contrast_detection(img_block{i,j}, c, pinch_size);
        
        block_detected(i,j) = iscontrast_enhancement(F, threshold);
    end
end

%% create marker for image forgery localization
marker = cell(size(img_block));
[rows, cols] = find(block_detected);
for i = 1:size(marker,1)
    for j = 1:size(marker,2)
        
        marker{i,j} = zeros(size(img_block{i,j}));
        k = 1;
        while k <= size(rows,1)
            if (i == rows(k,:) && j == cols(k,:))
                marker{i,j} = ones(size(img_block{i,j}));
                break;
            end
            
            k = k + 1;
        end
    end
end
marker = cell2mat(marker);
subplot(121), imshow(marker), title('Detected Region');
subplot(122), imshow(img), title('Image');