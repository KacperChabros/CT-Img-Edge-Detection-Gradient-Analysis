function [bboxImg] = cropToBBox(X1,Y1,X2,Y2, img)
% cropToBBox crops the image to a rectangle defined by the coordinates
% of the top-left and bottom-right corners.
% X1 - coordinate of the first dimension of the top-left corner
% Y1 - coordinate of the second dimension of the top-left corner
% X2 - coordinate of the first dimension of the bottom-right corner
% Y2 - coordinate of the second dimension of the bottom-right corner
% img - original image
% The function returns bboxImg - the original image cropped to the specified
% rectangle coordinates.
    bboxImg = img(X1:X2, Y1:Y2);
end

