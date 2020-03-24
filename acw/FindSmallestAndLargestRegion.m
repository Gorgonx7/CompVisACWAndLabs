function [Smallest, Largest] = FindSmallestAndLargestRegion(stats)
    Largest = 1;
    Smallest = 1;
    for i = 1:size(stats)
        if stats(i).Area < stats(Smallest).Area
            Smallest = i;
        elseif stats(i).Area > stats(Largest).Area
            Largest = i;
        end
    end
end

