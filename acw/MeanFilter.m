function OutputImage = MeanFilter(matrixSize, image)
h = 1/(matrixSize * matrixSize) * ones(matrixSize);

imfiltRed = conv2(h,image(:,:,1));
imfiltGreen = conv2(h,image(:,:,2));
imfiltBlue = conv2(h,image(:,:,3));
imfiltBlue = uint8(imfiltBlue);
imfiltGreen = uint8(imfiltGreen);
imfiltRed = uint8(imfiltRed);
OutputImage = cat(3, imfiltRed, imfiltBlue, imfiltGreen);
end