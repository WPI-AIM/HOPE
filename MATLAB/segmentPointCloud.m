%% segmentPointCloud
% This function takesi n a point cloud and groups the points into
% clusters that are seperated by the given minimum distance. This function
% can also plot the clusters.
function [labels,numClusters] = segmentPointCloud(ptCloud, minDistance, print, plot, timer)
%%
% Segment the point cloud data:
[labels,numClusters] = pcsegdist(ptCloud,minDistance);
%%
% Prints the number of clusters:
if print
    fprint('Number of Clusters: %d', numClusters);
end
%% 
% Plots the clusters
if plot
    title('Point Cloud Clusters')
    figure('name',title);
    hold on;
    pcshow(ptCloud.Location,labels);
    colormap(hsv(numClusters));
    title(title);
end

end