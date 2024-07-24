function [imgRemovedPadding] = removeZeroPadding(img, oneSideOffset)
% removeZeroPadding - removes the surrounding zeros added by the
% addZeroPadding function. The resulting image has dimensions as before
% the zero padding was added.
% img - image with added zero padding
% oneSideOffset - width of the zero padding on one side
% imgRemovedPadding - image without zero padding.
    width = size(img, 1);
    height = size(img, 2);
    coordsX = 1+oneSideOffset:width-oneSideOffset;
    coordsY = 1+oneSideOffset:height-oneSideOffset;
    imgRemovedPadding = img(coordsX, coordsY);
end

