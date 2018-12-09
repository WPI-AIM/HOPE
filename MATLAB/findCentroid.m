%% findCentroid
% This function takes in a point cloud and finds the centroid of the
% points.
function [centroid] = findCentroid(ptCloud, time)
%%
% Start timer:
tic
%% 
% Initialize the centroid variable:
centroid = zeros(1,3);
%%
% grab the vertices of the point cloud:
verticies = [ptCloud.Location, ptCloud.Color]
%% 
% Output the centroid and average color value of the point cloud:
for i = 1:6
    centroid(1,i) = mean(verticies(:,i));
end
%%
% End timer:
if timer
    toc
else 
    toc;
end
end