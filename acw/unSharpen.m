function out = unSharpen(Image, sharpenLevel, portionOfSharpness)
BluredImage = MeanFilter(sharpenLevel, Image);

unSharpMask = Image;
figure
subplot(1,3,1);
imshow(BluredImage);
title("BluredImage");
subplot(1,3,2);
imshow(unSharpMask);
title("Original");
subplot(1,3,3);
out = unSharpMask + portionOfSharpness*(unSharpMask - BluredImage);
imshow(out);
title("UnSharped Image")
end

