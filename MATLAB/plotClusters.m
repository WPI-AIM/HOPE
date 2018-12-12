%% plotClusters
% This Function takes in a cell array of point clouds and plots them all on
% the same graph.
function plotClusters (ptCloudCell, name, plot, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Grab the number of point clouds in the cell array:
numClouds = size(ptCloudCell,1);
%%
%Change the color data to a new value
color = uint8(255*colormap(jet(numClouds)));
%%
% Plot the clusters:
if plot
    %%
    % Set title:
    title(name);
    %%
    % Create figure:
    figure('Name',name);
    hold on;
    %%
    % Iterate through all the point clouds, plotting them in different colors:
    for i = 1:numClouds
        %%
        % Grab the point cloud cluster from the cell array:
        cluster = ptCloudCell{i,1};
        %%
        % Change the color of the point cloud:
        for k = 1:cluster.Count
            cluster.Color(k,:) = color(i,:);
        end
        %%
        % Plot point cloud:
        pcshow(cluster);
    end
end
%%
% End timer:
if timer
    toc;
end
end