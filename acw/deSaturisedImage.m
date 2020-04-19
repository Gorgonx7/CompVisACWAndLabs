function out = deSaturisedImage(OriginalImage)
    GrayImage = rgb2hsv(OriginalImage);
%     figure
%     subplot(2,2,1);
%     imshow(GrayImage);
%     subplot(2,2,2);
%     histogram(GrayImage(:,:,2));
%     subplot(2,2,3);
%    imshow(hsv2rgb(cat(3, (GrayImage(:,:,1)), histeq(GrayImage(:,:,2)), GrayImage(:,:,3))));
   % imshow(hsv2rgb(cat(3, histeq(GrayImage(:,:,1)), (GrayImage(:,:,2)), GrayImage(:,:,3))));
%     subplot(2,2,4);
%     histogram(histeq(GrayImage(:,:,1)));
   % out = hsv2rgb(cat(3, histeq(GrayImage(:,:,1)), (GrayImage(:,:,2)), GrayImage(:,:,3)));
    out = (cat(3, histeq(GrayImage(:,:,1)), hsv2rgb(GrayImage(:,:,2)), GrayImage(:,:,3)));
end

