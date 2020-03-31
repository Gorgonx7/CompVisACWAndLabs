function out = standardImageAnalysis(GrayFilteredImage, OriginalImage)
[mserRegions, mserConnComp] = detectMSERFeatures(GrayFilteredImage, 'RegionAreaRange',[700,8000]);
figure
imshow(OriginalImage);
title("MSER Regions");
hold on;
plot(mserRegions, 'showPixelList', true, 'showEllipses', false);
hold off;
mserStats = regionprops(mserConnComp, 'BoundingBox', 'Eccentricity', ...
     'Solidity', 'Image', 'Area');
LogMSER(mserStats);

 filterIdx = [mserStats.Eccentricity] > .8;

mserStats(filterIdx) = [];
mserRegions(filterIdx) = [];

figure
 imshow(OriginalImage)
 hold on
 plot(mserRegions, 'showPixelList', true,'showEllipses',false)
 title('After Removing Non-star fish Regions Based On Geometric Properties')
 hold off
end

