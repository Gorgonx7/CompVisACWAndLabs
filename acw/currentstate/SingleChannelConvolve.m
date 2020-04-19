function out = SingleChannelConvolve(Channel,Filter)
%Takes in a single image channel, and outputs a mean filter of that channel
figure
subplot(1,2,1);
histogram(Channel);
title("Original Histogram");
out = conv2(Channel, Filter, 'same');
out = uint8(out);
subplot(1,2,2);
histogram(out);
title("Convolved Channel");

end

