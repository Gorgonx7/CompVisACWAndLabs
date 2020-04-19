function OutputImage = MeanFilter(matrixSize, image)
h = 1/(matrixSize * matrixSize) * ones(matrixSize);

imfiltRed = conv2(image(:,:,1),h, 'same');
imfiltGreen = conv2(image(:,:,2),h, 'same');
imfiltBlue = conv2(image(:,:,3),h, 'same');
imfiltBlue = uint8(imfiltBlue);
imfiltGreen = uint8(imfiltGreen);
imfiltRed = uint8(imfiltRed);
OutputImage = cat(3, imfiltRed, imfiltBlue, imfiltGreen);
end