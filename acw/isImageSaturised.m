function out = isImageSaturised(OriginalImage)
   
    hsvImage = rgb2hsv(OriginalImage);
    figure
    subplot(2,2,1);
    histogram(hsvImage(:,:,1));
    title("Original Histo Hue Channel");
    subplot(2,2,2);
    histogram(hsvImage(:,:,2));
    title("Saturation");
    subplot(2,2,3);
    histogram(hsvImage(:,:,3));
    title("Value");
    if(true)
        out = true;
        disp("Image needs to be equalised")
        return
    end
    out = false
    return

end

