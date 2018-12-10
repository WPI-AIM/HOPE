%% findCentroid
% This function takes in a point cloud and finds the centroid of the
% points.
function [centroid] = findCentroid(ptCloud, timer)
%%
% Start timer:
if timer
    tic
end
%% 
% Initialize the centroid variable:
centroid = zeros(1,6);
%%
% grab the vertices of the point cloud:
vertices = [ptCloud.Location, ptCloud.Color];
%% 
% Output the centroid and average color value of the point cloud:
for i = 1:6
    centroid(1,i) = mean(vertices(:,i));
end
%%
% End timer:
if timer
    toc
end