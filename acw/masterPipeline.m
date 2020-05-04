function [boundingBoxes,NoStarfish] = masterPipeline(fileLocation)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% This function is the main function for the algorithm %%%%%
%%%% Pass this function a file location and it will %%%%%%%%%%%
%%%% Attempt to find starfish %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Section 1.0.0 - initial pipeline entry");
[mask, original] = pipeline1(fileLocation);
disp("Section 2.0.0 - post pipeline cleanup");
disp("Section 2.1.0 - Remove huge and tiny objects");
bw =  mask - bwareaopen(mask,2500);
bw = bwareaopen(bw, 200);
figure
subplot(1,2,1);
imshow(mask);
title("Before fitlering for small and large objects");
subplot(1,2,2);
imshow(bw);
title("After filtering for small and large objects");

disp("Section 2.2.0 - Active Contouring");
figure
title("Before and after active contouring");
subplot(1,2,1);
imshow(bw);
title("No active Contoruing");
bw = activecontour(original,bw,200);
subplot(1,2,2);
imshow(bw);
title("After Active Contouring");

figure
imshow(bw);
title("Final Mask");
disp("Section 3.0.0 - MSER region analysis one");
[fullStat, boundingBoxes, NoStarfish] = MSERRegionAnalysis(bw, original);
sizeOfBoudingBox = size(boundingBoxes);
if(sizeOfBoudingBox(1) == 0)
    disp("Section 4.0.0 (Optional) - No Boudning boxes detected with strong pipeline, using softer variables")
    [fullStat, boundingBoxes, NoStarfish] = MSERRegionAnalysis2(bw, original);
    
end
end

