%% plotPointCloud
% This function takes in a point cloud and plots it with a given title.
function plotPointCloud(ptCloud, name, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Create figure:
figure('Name',name);
hold on;
%%
% Plot point cloud:
pcshow(ptCloud);
title(name);

%%
% End timer:
if timer
    toc;
end
end