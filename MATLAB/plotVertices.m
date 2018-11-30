%% plotVertices
% This function takes in a matrix of colored vertices and creates a point
% cloud as well as plotting the point cloud.
function [ptCloud] = plotVertices (vertices, plot, timer)
%%
% Start timer:
tic
%%
% Extract the location points:
xyz = vertices(:,1:3);
%%
% Extract the color points:
RGB = vertices (:,4:6);
%%
% Create the point cloud:
if plot
    ptCloud = pointCloud(xyz, 'color', RGB)
end
%%
% End timer:
if timer
    toc
else 
    toc;
end