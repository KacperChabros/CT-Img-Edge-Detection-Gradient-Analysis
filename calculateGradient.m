function [horizEdges, vertEdges] = calculateGradient(preprocessedImg)
% calculateGradient computes the gradient of an image using defined
% high-pass filters. The function returns the horizontal and vertical gradients.
% ------
% preprocessedImg - image from which the gradient is to be computed (preferably
% preprocessed with a low-pass filter)
% horizEdges - matrix with gradient values obtained after applying
% the filter for horizontal edges.
% vertEdges - matrix with gradient values obtained after applying
% the filter for vertical edges.
    sobelHorizFilter = [-1,-2,-1 ; 0,0,0 ; 1,2,1];
    sobelVertFilter = [-1,0,1 ; -2,0,2 ; -1,0,1];

    sobelOffset = floor(size(sobelHorizFilter, 1) / 2);

    preprocessedImg = addZeroPadding(preprocessedImg, sobelOffset);

    horizEdges = applyFilter(preprocessedImg, sobelHorizFilter, false);
    vertEdges = applyFilter(preprocessedImg, sobelVertFilter, false);
    
    horizEdges = removeZeroPadding(horizEdges, sobelOffset);
    vertEdges = removeZeroPadding(vertEdges, sobelOffset);

end

