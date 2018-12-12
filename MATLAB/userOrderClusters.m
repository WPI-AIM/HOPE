%% userOrderClusters
% This function takes in a cell array and prompts the user to order them
% based on a provided diagram, then returns the ordered centroids of the
% clusters.
function [orderedCentroidList] = userOrderClusters(ptCloudCell, plot, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Grab the number of point clouds in the cell array:
numClouds = size(ptCloudCell,1);
%%
% Initialize the ordered cell array:
% Note: each row is of the form: {point cloud}, {label}, {boxed volume}, {centroid}
orderedPtCloudCell = cell(0,4);
%%
% Itererate through each cluster, requesting the user to identify the
% cluster as a dot (numbered 1-9) or as an extraneous feature (number 0):
for i = 1:numClouds
   %%
   % Plot the ith cloud in blue and every other cloud in black:
   name = sprintf('Detected Markers (%d/%d)',i,numClouds);
   colored = i;
   diagram = true;
   plotClusters(ptCloudCell, name, colored, diagram, plot, timer);
   %%
   % Prompt the user to enter the identification number based on the
   % diagram:
   promptText = sprintf('Label the dot shown in blue (1-9). Not a marker? Enter 0.');
   prompt = {promptText};
   title = 'ID Each Marker';
   dimensions = [1, 60];
   defaultInput = {'0'};
   id = inputdlg(prompt, title, dimensions, defaultInput);
   %%
   % Convert answer from the dialog into a number:
   id = str2num(id{1,1});
   
  
end
%%
% End timer:
if timer
    toc;
end
end