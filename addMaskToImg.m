function [imgWithMask] = addMaskToImg(img, mask, maskCoords)
% The function overlays a given mask on the original image. If the original image
% is in grayscale, it is expanded to include two additional dimensions.
% Mask pixels are highlighted by setting the red component, while the others are set to zero.
% img - original image
% mask - cropped image with a binary mask
% maskCoords - coordinates defining the position of the top-left and bottom-right
% corners of the mask in the original image [Y1,X1,Y2,X2]
%---
% imgWithMask - original image (expanded to 3 channels) with the mask highlighted in red
    imgWithMask = img;
    if(size(imgWithMask, 3) == 1)
        imgWithMask = repmat(imgWithMask, [1, 1, 3]);
    end
    coordsX = maskCoords(2):maskCoords(4);
    coordsY = maskCoords(1):maskCoords(3);
    counterX = 1;
    for i=coordsX
        counterY = 1;
        for j=coordsY
            
            if(mask(counterY, counterX) == 1)
                imgWithMask(j,i,1) = 1;
                imgWithMask(j,i,2:3) = 0;
            end
            counterY = counterY + 1;
        end
        counterX = counterX + 1;
    end
end

