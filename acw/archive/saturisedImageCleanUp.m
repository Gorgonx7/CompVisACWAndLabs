function out = saturisedImageCleanUp(DeSaturisedImage)
     figure
    subplot(1,2,1);
    imshow(imcomplement(imbinarize(DeSaturisedImage)))
    GrayFilteredImage = imcomplement(imbinarize(DeSaturisedImage))
    GrayFilteredImage = bwareaopen(GrayFilteredImage, 700);
    circle = strel('octagon', 6);
    GrayFilteredImage = imopen(GrayFilteredImage, circle)
    GrayFilteredImage = GrayFilteredImage - bwareaopen(GrayFilteredImage, 4000);
    GrayFilteredImage = imclose(GrayFilteredImage, circle)
    subplot(1,2,2);
    imshow(GrayFilteredImage);
    out = GrayFilteredImage;
end

