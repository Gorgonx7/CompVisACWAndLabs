function [numberOfFish, BoundingBox] = pipeline1(FileName)
figure
%FileName = "./notWorking/starfish_5.jpg"
Comparison = LoadImage(FileName);



hsvComparitor = rgb2hsv(Comparison);

%ThreeChannelHistorgram(hsvComparitor);

%figure
%subplot(2,2,1);
%histogram(hsvComparitor(:,:,2) * 0.5);
%subplot(2,2,2);
%histogram(hsvComparitor(:,:,2));
%subplot(2,2,3);


hsvTest = cat(3, (hsvComparitor(:,:,1)), hsvComparitor(:,:,2) * 4, hsvComparitor(:,:,3));
hsvTest = hsv2rgb(hsvTest);
hsvTest = uint8(hsvTest * 255)
hsvTest = unSharpen(hsvTest, 2, .5);


%figure
%imshow((hsvTest));
%title("New Image")
%figure
%subplot(2,2,1);
%imshow(hsvTest(:,:,1));
%title("R");
%subplot(2,2,2);
%imshow(hsvTest(:,:,2));
%title("G");
%subplot(2,2,3);
%imshow(hsvTest(:,:,3));
%title("B");
%figure
%title("Comparining the histograms of each channel");
%subplot(1,2,1);
g = histogram(hsvTest(:,:,2)).BinCounts;
%histogram(hsvTest(:,:,2));
%title("G channel");
%subplot(1,2,2);
b = histogram(hsvTest(:,:,3)).BinCounts;
%histogram(hsvTest(:,:,3));

%title("B channel");
if mean(b) > mean(g)
output = double(hsvTest(:,:,3)) %- double(hsvTest(:,:,3));
else
    output = double(hsvTest(:,:,2))
end

output = uint8(output * 255)
output = imbinarize(output);

meanTest = output + 1;
mn = round(mean2(meanTest));
if mn == 2
    disp("Getting the complement")
    output = imcomplement(output);
end
cross = [0,1,0,1,1,1,0,1,0];

circle = strel('disk', 3);

output = imclose(output, cross);
output = imerode(output, circle);


%output = output - bwareaopen(output, 1500)
figure
imshow(output);
title(FileName);
numberOfFish = 5;
BoundingBox = 5;
end

