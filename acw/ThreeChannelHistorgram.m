function [r,g,b] = ThreeChannelHistorgram(img)
%figure
%subplot(2,2,1);
%imshow(img);
%title("Original Image");
%subplot(2,2,2);
r = histogram(img(:,:,1)).BinCounts;
%histogram(img(:,:,1));
%title("Channel One");
%subplot(2,2,3);
g = histogram(img(:,:,2)).BinCounts;
%histogram(img(:,:,2));
%title("Channel Two");
%subplot(2,2,4);
b = histogram(img(:,:,3)).BinCounts;
%histogram(img(:,:,3));
%title("Channel Three");



end

