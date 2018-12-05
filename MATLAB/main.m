%script for processing obj files
%%
% Clean up before running anything:
clc, clear all, close all
%%
% Set the file name:
%file = 'sample_with_dots.obj';
%file = 'blue dots, top, linear rgb.obj';
%file = 'Alex, great scan, 9 blue dots, all dots showed up';
%%
% Options for output (true/false):
timer = true; % Display the time for a function to run
plot = true; % Display point cloud plots
print = true; % Displays print messages
%%
% Import the vertices:
vertices = importOBJ(file,timer);
%% 
%convert to point cloud and plot:
name = 'Original Colored Point Cloud';
ptCloud = plotVertices(vertices, plot , name, timer);
%%
% Set desired color range:
colorRange_Dark = [0.05, 0.5; ... %Red   min. and max.
                   0.1,  0.3; ... %Green min. and max.
                   0.1,  0.3];    %Blue  min. and max.
colorRange_Blue = [  0, 0.6; ... %Red   min. and max.
                     0, 0.125; ... %Green min. and max.
                     0.05, 1];    %Blue  min. and max.
% Filter out points that are not in the desured color range:
%vertices = filterColor(vertices, colorRange_Dark, timer);
vertices = filterColor(vertices, colorRange_Blue, print, timer);
%% 
%convert to point cloud and plot:
name = 'Filtered Point Cloud';
ptCloud = plotVertices(vertices, plot, name, timer);
%%
% Removes noise from point cloud:
ptCloud = filterNoise (ptCloud, print, timer);
%%
name = 'Filtered Point Cloud With Noise Removed';
plotPointCloud( ptCloud, name, timer);
%%
% Segment the point cloud into clusters:
%minDistance = 1;
%[labels,numClusters] = segmentPointCloud(ptCloud,minDistance,print,timer);
%%
% Filter out clusters of point clouds that are too big or too small:

