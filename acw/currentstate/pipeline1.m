function [mask, original] = pipeline1(FileName)
% figure
%FileName = "./notWorking/starfish_5.jpg"
Comparison = LoadImage(FileName);
Comparison = deSaltImage(Comparison);

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
hsvTest = uint8(hsvTest * 255);
hsvTest = unSharpen(hsvTest, 2, .5);


% figure
% imshow((hsvTest));
% title("New Image")
% figure
% subplot(2,2,1);
% imshow(hsvTest(:,:,1));
% title("R");
% subplot(2,2,2);
% imshow(hsvTest(:,:,2));
% title("G");
% subplot(2,2,3);
% imshow(hsvTest(:,:,3));
% title("B");
% figure
% title("Comparining the histograms of each channel");
% subplot(1,2,1);
g = histogram(hsvTest(:,:,2)).BinCounts;
% histogram(hsvTest(:,:,2));
% title("G channel");
% subplot(1,2,2);
b = histogram(hsvTest(:,:,3)).BinCounts;
% histogram(hsvTest(:,:,3));
r = histogram(hsvTest(:,:,1)).BinCounts;
title("B channel");

%% Get channel with least amount of noise
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
% figure
% imshow(output);
%title(FileName);
mask = output;
original = Comparison;

%%%%%%%%%%%%%%%%%%%%%%%
%% Edge Detection %%%%%
%%%%%%%%%%%%%%%%%%%%%%%

% can = cannyEdgeDetection(original);
% figure
% subplot(1,2,1);
% imshow(can);
% title('canney');
% subplot(1,2,2);
% imshow(imfill(mask - can, 'holes'));
% title('final');
%  = mask - can;
% se = [0,1,0,1,1,1,0,1,0];
% mask = imerode(mask, se);
end

