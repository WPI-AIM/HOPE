%% filterPointCloudSize
% This function takes in a point cloud and a list of labels and filters out
% the clusters that are too big or too small this function returns a point
% cloud, a list of labels, and the number of clusters.
function [labels, ptCloud, numClusters] = filterPointCloudSize(ptCloud, labels, NumClusters)
%%
% Initialize the matrix of cluster volumes:
boxedVolume = zeros(numClusters,1);

for i = 1:numCLusters
    boxedVolume(i,1) = findVolume(ptCloud, label);


end