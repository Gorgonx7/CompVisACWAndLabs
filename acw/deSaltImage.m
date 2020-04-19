function out = deSaltImage(inputImage)
OriginalImage = inputImage;
    [r,g,b] = ThreeChannelHistorgram(OriginalImage);
red = OriginalImage(:,:,1);
green = OriginalImage(:,:,2);
blue = OriginalImage(:,:,3);
if r(length(r)) > mean(r) || r(1) > mean(r)
    disp("red Channel salt and pepper noise");
    % Add forloop until above condition is fixed?
    red = SingleChannelConvolve(OriginalImage(:,:,1), 1/(4 * 4) * ones(4));
end
if g(length(g)) > mean(g) || g(1) > mean(g)
    disp("Green Channel Salt and Pepper Noise");
    green = SingleChannelConvolve(OriginalImage(:,:,2), 1/(4 * 4) * ones(4));
end
if b(length(b)) > mean(b) || b(1) > mean(b)
    disp("Blue Channel Salt and Pepper Noise")
    blue = SingleChannelConvolve(OriginalImage(:,:,3), 1/(4 * 4) * ones(4));
end
DeSaltedImage = cat(3,red, green, blue);
% figure
% subplot(1,2,1);
% imshow(OriginalImage);
% title("Original Image");
% subplot(1,2,2);
% imshow(DeSaltedImage);
% title("DeSalted Image");
out = DeSaltedImage;
end

