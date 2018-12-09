%% findVolume
% This function takes in a point cloud and finds the volume of the
% coordinate box that contains the points that belong to the specified
% cluster.
function [volume] = findVolume(ptCloud, time)
%%%
% Start timer:
tic
%%
% Extract the box dimensions of the point cloud:
x = ptCloud.XLimits(1,2) - ptCloud.XLimits(1,1)
y = ptCloud.YLimits(1,2) - ptCloud.YLimits(1,1)
z = ptCloud.ZLimits(1,2) - ptCloud.ZLimits(1,1)
%%
% Calculate volume of the box:
volume = x*y*z
%%
% End timer:
if timer
    toc
else 
    toc;
end
end