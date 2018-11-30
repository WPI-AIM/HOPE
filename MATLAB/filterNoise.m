function [ptCloud] = filterNoise(ptCloud, print, timer)
%%
% Grabs current point cloud count:
currentCount = ptCloud.Count;
%%
% Removes noise from point cloud:
ptCloud = pcdenoise(ptCloud);
%%
% Grabs new point cloud count:
newCount = ptCloud.Count;
%%
% Prints the number and percent of points filtered out:
if print
    numberRemoved = currentCount - newCount;
    percentRemoved = 100*numberRemoved/currentCount;
    fprintf('Removed %d points (%0.2f percent).\n',numberRemoved, percentRemoved)
end
end
