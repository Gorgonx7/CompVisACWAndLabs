function out = deSaturisedImage(OriginalImage)
    GrayImage = rgb2gray(OriginalImage);
    figure
    subplot(2,2,1);
    imshow(GrayImage);
    subplot(2,2,2);
    histogram(GrayImage);
    subplot(2,2,3);
    imshow(histeq(GrayImage));
    subplot(2,2,4);
    histogram(histeq(GrayImage));
    out = histeq(GrayImage);
end

