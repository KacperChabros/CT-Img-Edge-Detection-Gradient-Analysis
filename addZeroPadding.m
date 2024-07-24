function [zeroPaddedImg] = addZeroPadding(bboxImg, oneSideOffset)
% addZeroPadding - adds surrounding zeros so that the resulting image
% can have the same dimensions.
% bboxImg - image (cropped)
% oneSideOffset - number of pixels to add to each edge
% zeroPaddedImg - image with dimensions increased by zeroPadding
    width = size(bboxImg, 1);
    height = size(bboxImg, 2);
    offset = 2*oneSideOffset;
    zeroPaddedImg = zeros(width+offset, height+offset);
    actualImgCoordsX = 1+oneSideOffset:width+oneSideOffset;
    actualImgCoordsY = 1+oneSideOffset:height+oneSideOffset;
    zeroPaddedImg(actualImgCoordsX, actualImgCoordsY) = bboxImg;
end

