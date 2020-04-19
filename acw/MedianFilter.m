function output = MedianFilter(Image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    r = Image(:,:,1);
    g = Image(:,:,2);
    b = Image(:,:,3);
    output = cat(3,medfilt2(r), medfilt2(g), medfilt2(b));
end

