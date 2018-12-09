%% filterPointCloudSize
% This function takes in a point cloud and a list of labels and filters out
% the clusters that are too big or too small this function returns a cell
% array of size Nx4. N is the number of clusters remaining and the each row
% is of the form:  {point cloud}, {label}, {boxed volume}, {centroid}
function [PtCloudCell] = filterPointCloudSize(ptCloud, labels, numClusters, volumeLimit, timer)
%%
% Start timer:
tic
%%
% Initialize the matrix of cluster volumes and centroids:
boxedVolume = zeros(numClusters, 1);
centroids = zeros(numClusters, 1);
%%
% Initialize cell matrix to hold point clouds:
% Note: each row is of the form: {point cloud}, {label}, {boxed volume}, {centroid}
PtCloudCell = cell(0,4);
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
    centroids(i,1) = findCentroid(cluster, timer);
    %%
    % Check to see if the volume of the cluster is within the limits:
    if boxedVolume > volumeLimit(1,1) && boxedVolume < volumeLimit(1,2)
        %%
        % Stores the cluster in a cell array:
        cellCluster = {cluster, clusterNumber, boxedVolume, centroids};
        %%
        % Check if the matrix of clusters is empty:
        if isempty(ptCloudCell)
            %%
            % Set the matrix of clusters equal to the first cell array:
            ptCloudCell = cellCLuster;
        else
            %%
            % Append the matrix of clusters:
            ptCloudCell = {ptCloudCell; cellCluster};
        end
    end    
end
%%
% End timer:
if timer
    toc
else 
    toc;
end
end