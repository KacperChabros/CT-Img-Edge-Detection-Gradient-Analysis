function [magnitude] = calculateGradientMagnitude(horizEdges, vertEdges)
% calculateGradientMagnitude - the function computes the gradient vector magnitude
% based on the square root of the sum of squares of the resulting gradient
% from the horizontal and vertical filters.
% horizEdges - matrix with gradient values obtained after applying
% the horizontal filter
% vertEdges - matrix with gradient values obtained after applying
% the vertical filter
% magnitude - matrix with values representing the magnitudes of the resulting
% gradient vectors.
    magnitude = sqrt(horizEdges .^ 2 + vertEdges .^ 2);
end

