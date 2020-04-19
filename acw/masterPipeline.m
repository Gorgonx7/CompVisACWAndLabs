function [boundingBoxes,NoStarfish] = masterPipeline(fileLocation)

[mask, original] = pipeline1(fileLocation);

%texAnalysis(mask, original);
bw =  mask - bwareaopen(mask,2500);
bw = bwareaopen(bw, 200);
bw = activecontour(original,bw,200);

figure
imshow(bw);
title("Final Mask");

figure
imshow(bw);




title("Final Mask");
[fullStat, boundingBoxes, NoStarfish] = MSERRegionAnalysis(bw, original);
sizeOfBoudingBox = size(boundingBoxes);
if(sizeOfBoudingBox(1) == 0)
    [fullStat, boundingBoxes, NoStarfish] = MSERRegionAnalysis2(bw, original);
    
end

end

