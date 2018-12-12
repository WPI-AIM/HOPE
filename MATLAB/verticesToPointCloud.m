%% plotVertices
% This function takes in a matrix of colored vertices and creates a point
% cloud. This function can also plot the point cloud if requested.
function [ptCloud] = verticesToPointCloud (vertices, plot, title, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Extract the location points:
xyz = vertices(:,1:3);
%%
% Extract the color points:
RGB = vertices(:,4:6);
%%
% Create the point cloud:
ptCloud = pointCloud(xyz, 'color', RGB);
%%
%plot the point cloud:
if plot
    plotPointCloud(ptCloud,title,timer);
end
%%
% End timer:
if timer
    toc;
end
end