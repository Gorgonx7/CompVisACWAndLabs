function [blue, red, green] = ImageHistogram(Image)
%% Creates a figure with three histograms, for convinence in all functions
%% I use RGB as that makes sence to me, however this function would also
%% work with HSV
figure
title("Image Histograms");
subplot(3,1,1);
red = histogram(Image(:,:,1));
red;
title("Red Channel Histogram");
subplot(3,1,2);
green = histogram(Image(:,:,2));
green;
title("Green Channel Histogram");
subplot(3,1,3);
blue = histogram(Image(:,:,3));
blue;
title("Blue Channel Histogram");
end

