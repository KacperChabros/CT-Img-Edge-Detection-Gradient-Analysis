function [preprocessedImg] = preprocessImg(bboxImg, lowPassFilter, isMedian)
% The function preprocessImg performs preliminary processing of the image to
% assist with edge detection. The function applies a given low-pass filter
% to remove noise from the image.
%------------
% bboxImg - image to which the low-pass filter should be applied
% (preferably cropped to the area of interest).
% lowPassFilter - matrix defining the low-pass filter. The filter can be 
% either an averaging or median filter. The filter should be square with
% an odd length for its sides.
% isMedian - logical value indicating whether the filter is a median filter
% preprocessedImg - matrix representing the smoothed image with the same dimensions
% as the input image.
    lowPassOffset = floor(size(lowPassFilter, 1) / 2);
    zeroPaddedImg = addZeroPadding(bboxImg, lowPassOffset);
    preprocessedImg = applyFilter(zeroPaddedImg, lowPassFilter, isMedian);
    preprocessedImg = removeZeroPadding(preprocessedImg, lowPassOffset);
end

