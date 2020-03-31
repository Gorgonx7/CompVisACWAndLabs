function out = LogMSER(regions)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    for x = 1:size(regions)
        disp(x ... 
        + ": BoudningBox: " + " X: " + regions(x).BoundingBox(1) + " Y: " ...
        +  regions(x).BoundingBox(2) + " Eccentricity: " + regions(x).Eccentricity ...
        + " Solidity: " + regions(x).Solidity);
    end
    
end

