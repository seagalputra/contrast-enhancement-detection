% This algorithm is for detecting image from globally contrast enhancement
clear; clc; close all;

addpath('contrast_analysis');

% load sample image
% img = imread('cameraman.tif');
img = imread('../data/authentic/exdark/01_AU_EXDARK_OUT.jpg');
double_img = im2double(img);
% create contrast image
img_contrast = power_law(img, 0.5);

F = contrast_detection(img_contrast);

ce = iscontrast_enhancement(F);
