%% filterPointCloudSize
% This function takes in a point cloud and a list of labels and filters out
% the clusters that are too big or too small this function returns a cell
% array of size Nx4. N is the number of clusters remaining and the each row
% is of the form:  {point cloud}, {label}, {boxed volume}, {centroid}
function [ptCloudCell] = filterPointCloudSize(ptCloud, labels, numClusters, volumeLimit, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Initialize the matrix of cluster volumes and centroids:
boxedVolume = zeros(numClusters, 1);
centroids = zeros(numClusters, 6);
%%
% Initialize cell array to hold point clouds:
% Note: each row is of the form: {point cloud}, {label}, {boxed volume}, {centroid}
ptCloudCell = cell(0,4);
%%
% Initialize an iterator for filling in the cell array to hold the point
% clouds:
k = 1;
%%
% Iterates through each cluster:
for i = 1:numClusters
    %%
    % Set the current cluster number:
    clusterNumber = i;
    %%
    % Isolate the cluster from the rest of the point cloud:
    cluster = seperatePointCloud(ptCloud, labels, clusterNumber, timer);
    %%
    % Find the boxed volume of the individual cluster:
    boxedVolume(i,1) = findVolume(cluster, timer);
    %%
    % Find the centroid of the individual cluster:
    centroids(i,:) = findCentroid(cluster, timer);
    %%
    % Check to see if the volume of the cluster is within the limits:
    notTooSmall = boxedVolume(i,1) >= volumeLimit(1,1);
    notTooBig = boxedVolume(i,1) <= volumeLimit(1,2);
    if notTooSmall && notTooBig
        %%
        % Stores the cluster in a cell array:
        cellCluster = {cluster, clusterNumber, boxedVolume(i,:), centroids(i,:)};
        %%
        % Append the cell array of clusters:
        ptCloudCell(k,:) = cellCluster;
        k = k + 1;
    end    
end
%%
% End timer:
if timer
    toc;
end
end