function [filteredImg] = applyFilter(img, filter, isMedian)
% The function applies a given filter to an image by appropriately calculating
% the values of neighboring points. It returns the resulting image after applying
% the specified filter.
% img - image to which the filter needs to be applied
% filter - filter to apply (e.g., high-pass/low-pass)
% isMedian - logical value indicating whether the filter is a median or
% averaging filter
% -----
% filteredImg - image after applying the filter
    if( size(filter, 1) ~= size(filter, 2) && mod(size(filter, 1), 2) ~= 1)
        error("The filter should be square matrix and the size should be odd")
    end
    offset = floor(size(filter, 1) / 2);
    width = size(img, 1);
    height = size(img, 2);
    filteredImg = zeros(width, height);
    for i=1+offset:width-offset
        for j=1+offset:height-offset
            window = img(i-offset:i+offset, j-offset:j+offset);
            if(isMedian)
                value = median(window(:));
            else
                value = sum( window .* filter, "all");
            end
            filteredImg(i,j) = value;
        end
    end
end

