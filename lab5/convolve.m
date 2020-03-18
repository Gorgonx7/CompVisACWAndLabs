function outputImage = convolve(RawImage, filter, paddingType)
   [ConvHeight,ConvWidth] = size(filter);
    xOffset = 0;
    yOffset = 0;
    if(nargin < 2)
        paddingType = 1;
    end
    if(paddingType == 1)
        %Calculate padding offset
        % 1 1 1 
        % 1 x 1
        % 1 1 1
        xOffset = ConvWidth;
        yOffset = ConvHeight;
    end
    
    outputArray = [3];
    
    for channelValue = 1:3
        Channel = RawImage(:,:,channelValue);
        [imgHeight, imgWidth] = size(Channel);
        layerOutput = [size(Channel) - yOffset * 2, size(Channel) - xOffset * 2];
        for y = yOffset:(imgWidth - xOffset)
            for x = xOffset:(imgHeight - yOffset)
                View = [ Channel(x-1, y-1), Channel(x, y-1), Channel(x+1, y-1),
                         Channel(x-1, y), Channel(x, y), Channel(x+1, y),
                         Channel(x-1, y+1) Channel(x,y +1), Channel(x+1, y+1)];
                layerOutput(x - xOffset, y-yOffset) = (View * filter);      
            end
        end
        outputArray(channelValue) = layerOutput;
    end
    outputImage = cat(3,outputArray(1), outputArray(2), outputArray(3));


end