function [ptCloud] = filterNoise(ptCloud, print,plot, timer)
%%
% Start timer:
if timer
    tic;
end
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
%%
% Plot the point cloud if desired:
if plot
    name = 'Filtered Point Cloud With Noise Removed';
    plotPointCloud( ptCloud, name, timer);
end
%%
% End timer:
if timer
    toc;
end
end
