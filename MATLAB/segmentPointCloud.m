%% segmentPointCloud
% This function takes in a point cloud and groups the points into
% clusters that are seperated by the given minimum distance. This function
% can also plot the clusters.
function [labels, numClusters] = segmentPointCloud(ptCloud, minDistance, print, plot, timer)
%%
% Segment the point cloud data:
[labels,numClusters] = pcsegdist(ptCloud,minDistance);
%%
% Prints the number of clusters:
if print
    fprintf('Number of Clusters: %d.\n', numClusters);
end
%% 
% Plots the clusters
if plot
    name = 'Point Cloud Clusters';
    figure('Name',name);
    hold on;
    pcshow(ptCloud.Location,labels);
    colormap(hsv(numClusters));
    title(name);
end

end