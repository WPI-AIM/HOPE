%% findVolume
% This function takes in a point cloud and finds the volume of the
% coordinate box that contains the points that belong to the specified
% cluster. input units are milimeters, output units are cubic milimeters.
function [volume] = findVolume(ptCloud, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Extract the box dimensions of the point cloud:
% Note: A point-volume of 0.1mm has been added to each dimension to give
% lines and planar shapes volume.
x = abs(ptCloud.XLimits(1,2) - ptCloud.XLimits(1,1))+0.1;
y = abs(ptCloud.YLimits(1,2) - ptCloud.YLimits(1,1))+0.1;
z = abs(ptCloud.ZLimits(1,2) - ptCloud.ZLimits(1,1))+0.1;
%%
% Calculate volume of the box:
volume = x*y*z;
%%
% End timer:
if timer
    toc;
end
end