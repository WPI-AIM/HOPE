%% seperatePointCloud
% This function takes in a point cloud, a list of labels, and a desired
% cluster number and returns a smaller point cloud with just the colored
% points in the requested point cloud.
function [ptCloudCluster] = seperatePointCloud (ptCloud, labels, clusterNumber, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Grab the current number of points:
numberPoints = ptCloud.Count;
%%
% Initialize new point cloud vertices matrix:
vertices = zeros(numberPoints,6);
%%
% Initialize iterator for filling in the vertices matrix:
k = 1;
% Iterate through all of the points in the point cloud:
for i = 1:numberPoints
    %%
    % Check the point to see if it is a part of the cluster:
    if labels(i,1) == clusterNumber
        %%
        % Add the points to vertices matrix:
        vertices(k,1:3) = ptCloud.Location(i,:);
        vertices(k,4:6) = ptCloud.Color(i,:)/255;
        %%
        % Incriment the iterator:
        k = k + 1;
    end
end
%%
% Remove extra zeros from the vertices matrix:
vertices = vertices(any(vertices,2),:);
%%
% Create a new point cloud from the data in the new point cloud matricies:
ptCloudCluster = verticesToPointCloud(vertices, false, '', timer);   
%%
% End timer:
if timer
    toc;
end
end