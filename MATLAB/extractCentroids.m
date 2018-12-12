%%extractCentroids
% This function takes in a cell array and returns a matrix of the centroid
% locations of the markers.
function [centroids] = extractCentroids(orderedPtCloudCell, print, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Grab the number of markers in the cell array:
numMarkers = size(orderedPtCloudCell,1);
%%
% Initialize the centroid matrix:
centroids = zeros(numMarkers,6);
%%
% Iterate through the cell array, saving the centroid data:
for i = 1:numMarkers
   centroids(i,:) = orderedPtCloudCell{i,4};
end
%%
% Saves only the centroid x, y, z data, not the average RGB data of marker:
centroids = centroids(:,1:3);
%%
% Prints the centroids of the markers:
if print
    fprintf('The centroid locations for the nine markers are:\n');
    disp(centroids);
%%
% End timer:
if timer
    toc;
end
end
