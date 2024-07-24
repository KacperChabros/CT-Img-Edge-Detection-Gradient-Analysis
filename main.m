clear
img = imread("CT.png");
img = img(:,:,1);
img = im2double(img);

leftKidneyCoords = [285, 204, 392, 308];
rightKidneyCoords = [314, 393, 403, 495];

leftKidneyBBox = cropToBBox(leftKidneyCoords(1), leftKidneyCoords(2), leftKidneyCoords(3), ...
    leftKidneyCoords(4), img);
rightKidneyBBox = cropToBBox(rightKidneyCoords(1), rightKidneyCoords(2), rightKidneyCoords(3), ...
     rightKidneyCoords(4), img);

leftLowPassF = 1/25 * ones(5,5);
rightLowPassF = ones(3,3);

leftKidneyBBoxProc = preprocessImg(leftKidneyBBox, leftLowPassF, false);
rightKidneyBBoxProc = preprocessImg(rightKidneyBBox, rightLowPassF, true); 

[horizEdgesLeft, vertEdgesLeft] = calculateGradient(leftKidneyBBoxProc);
[horizEdgesRight, vertEdgesRight] = calculateGradient(rightKidneyBBoxProc);

leftMagnit = calculateGradientMagnitude(horizEdgesLeft, vertEdgesLeft);
rightMagnit = calculateGradientMagnitude(horizEdgesRight, vertEdgesRight);
leftMagnit = rescale(leftMagnit, 0, 1);
rightMagnit = rescale(rightMagnit, 0, 1);
leftMagnit = leftMagnit > 0.3;
rightMagnit = rightMagnit > 0.26;

leftPostProcF = ones(5,5);
rightPostProcF = ones(3,3);
leftMagnit = applyFilter(leftMagnit, leftPostProcF, true);
rightMagnit = applyFilter(rightMagnit, rightPostProcF, true);
leftMagnit(end-11:end, end-11:end) = 0;

figure(1)
subplot(2,4,1)
imshow(leftKidneyBBox)
title("Cropped img of left kidney")
subplot(2,4,2)
imshow(rescale(abs(horizEdgesLeft), 0, 1))
title("Horizontal edges of left kidney")
subplot(2,4,3)
imshow(rescale(abs(vertEdgesLeft), 0, 1))
title("Vertical edges of left kidney")
subplot(2,4,4)
imshow(leftMagnit)
title("Combined edges of left kidney")

subplot(2,4,5)
imshow(rightKidneyBBox)
title("Cropped img of right kidney")
subplot(2,4,6)
imshow(rescale(abs(horizEdgesRight), 0, 1))
title("Horizontal edges of right kidney")
subplot(2,4,7)
imshow(rescale(abs(vertEdgesRight), 0, 1))
title("Vertical edges of right kidney")
subplot(2,4,8)
imshow(rightMagnit)
title("Combined edges of right kidney")

figure(2)
subplot(1,2,1)
x = 1:size(horizEdgesLeft,2);
y = 1:size(horizEdgesLeft,1);
contour(x,y,leftKidneyBBox)
hold on
quiver(x,y,vertEdgesLeft,horizEdgesLeft);
hold off
title("Visualisation of left kidney's gradients")

subplot(1,2,2)
x = 1:size(horizEdgesRight,2);
y = 1:size(horizEdgesRight,1);
contour(x,y,rightKidneyBBox)
hold on
quiver(x,y,vertEdgesRight,horizEdgesRight);
hold off
title("Visualisation of right kidney's gradients")

maskedImg = addMaskToImg(img,leftMagnit,leftKidneyCoords);
maskedImg = addMaskToImg(maskedImg, rightMagnit, rightKidneyCoords);
figure(3)
imshow(maskedImg)
title("Original image with masks of kidneys")


