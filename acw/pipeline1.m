function [mask, original] = pipeline1(FileName)
disp("Section 1.1.0 - Load image");
Comparison = LoadImage(FileName);
title("Original Input");
disp("Section 1.2.0 - Median Filter");
Comparison = MedianFilter(Comparison);
disp("Section 1.2.1 - Mean filter on salty channels");
Comparison = deSaltImage(Comparison);
disp("Section 1.3.0 - Convert to HSV for analysis of saturation, hue and values");
hsvComparitor = rgb2hsv(Comparison);

ThreeChannelHistorgram(hsvComparitor);


disp("Section 1.4.0 - Saturize the image, drawing lots of contrast between the bright and dark colours");
hsvTest = cat(3, (hsvComparitor(:,:,1)), hsvComparitor(:,:,2) * 4, hsvComparitor(:,:,3));
hsvTest = hsv2rgb(hsvTest);
hsvTest = uint8(hsvTest * 255);
figure
imshow(hsvTest);
title("image after boosting the saturation by four");

disp("Section 1.5.0 - unsharp the image");
hsvTest = unSharpen(hsvTest, 2, .5);
figure
imshow(hsvTest);
title("Image after unsharp filter is applied");

disp("Section 1.6.0 -  Gather the bin counts of each channel after saturation");
%% we gather the bin counts for further analysis, remember that the more 
%none zero values in the channel, the worse that channel is for
%segmentation
figure
title("Comparining the histograms of each channel");
subplot(1,2,1);
g = histogram(hsvTest(:,:,2)).BinCounts;
histogram(hsvTest(:,:,2));
title("G channel");
subplot(1,2,2);
b = histogram(hsvTest(:,:,3)).BinCounts;
histogram(hsvTest(:,:,3));
r = histogram(hsvTest(:,:,1)).BinCounts;
title("B channel");



figure
title("Each Channel as an image");
imshow((hsvTest));
title("New Image")
figure
subplot(2,2,1);
imshow(hsvTest(:,:,1));
title("R");
subplot(2,2,2);
imshow(hsvTest(:,:,2));
title("G");
subplot(2,2,3);
imshow(hsvTest(:,:,3));
title("B");
%% Get channel with least amount of noise
disp("Section 1.6.1 - comparing the chanels for thier noise");
if b(1) > g(1) && b(1) > r(1)
     disp("Taking Blue Channel");
    output = double(hsvTest(:,:,3));
elseif g(1) > b(1) && g(1) > r(1)
     disp("Taking Green Channel");
output = double(hsvTest(:,:,2));
else
    if mean(b) > mean(g)
        disp("Taking Blue Channel");
        output = double(hsvTest(:,:,3)); %- double(hsvTest(:,:,3));
    else
        disp("Taking Green Channel");
        output = double(hsvTest(:,:,2));
    end
end

output = uint8(output * 255);
output = imbinarize(output);
figure
imshow(output);
title("Channel Mask Selected before getting the complement");

meanTest = output + 1;
disp("Section 1.6.2 - Take the complement if the number of positive values in the binary mask is greater then the number of zeros");
mn = round(mean2(meanTest));
if mn == 2
    disp("Getting the complement")
    output = imcomplement(output);
end
%%Definition of the SEs for morphology
cross = [0,1,0,1,1,1,0,1,0];
circle = strel('disk', 3);
output = imclose(output, cross);
disp("Section 1.7.0 - Morphology");

figure
subplot(1,3,1);
imshow(output);
title("After first close");
output = imerode(output, circle);

subplot(1,3,2);
imshow(output);
title("After first erode");
output = imclose(output, circle);

subplot(1,3,3);
imshow(output);
title("Close again");

mask = output;
original = Comparison;
end

