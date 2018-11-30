%% plotPointCloud
% This function takes in a point cloud and plots it with a given title.
function plotPointCloud(ptCloud, title, timer)
%%
% Start timer:
tic
%%
% Create figure:
figure('Name',title);
hold on;
%%
% Plot point cloud:
pcshow(ptCloud);
%%
% End timer:
if timer
    toc
else
    toc;
end
end