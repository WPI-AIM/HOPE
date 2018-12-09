%% filterPointCloudSize
% This function takes in a point cloud and a list of labels and filters out
% the clusters that are too big or too small this function returns a point
% cloud, a list of labels, and the number of clusters.
function [labels, newPtCloud, numClusters, boxedVolume] = filterPointCloudSize(ptCloud, labels, numClusters, volumeLimit, time)
%%
% Start timer:
tic
%%
% Initialize the matrix of cluster volumes and centroids:
boxedVolume = zeros(numClusters, 1);
centroids = zeros(numClusters, 1);
%%
% Iterates through each cluster:
for i = 1:numClusters
    %%
    % Set the current cluster number:
    clusterNumber = i
    %%
    % Isolate the cluster from the rest of the point cloud:
    cluster = seperatePointCloud(ptCloud, labels, clusterNumber, time);
    %%
    % Find the boxed volume of the individual cluster:
    boxedVolume(i,1) = findVolume(cluster, time);
    %%
    % Find the centroid of the individual cluster:
    centroids(i,1) = findCentroid(cluster, time);
    
    %%
    % Check to see if the volume of the cluster is within the limits:
    if boxedVolume > volumeLimit(1,1) && boxedVolume < volumeLimit(1,2)
        %%
        %
        
end

%%
% End timer:
if timer
    toc
else 
    toc;
end
end