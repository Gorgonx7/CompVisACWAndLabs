function OutputImage = LoadImage(url)
    OutputImage = imread(url);
    figure 
    subplot(1,1,1);
    imshow(OutputImage);
end