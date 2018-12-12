%% userOrderClusters
% This function takes in a cell array and the original hand scan and
% prompts the user to order the dots based on a provided diagram, then
% returns the ordered centroids of the markers.
function [orderedPtCloudCell] = userOrderClusters(ptCloudCell, original, plot, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Grab the number of point clouds in the cell array:
numClouds = size(ptCloudCell,1);
%%
% Initialize the ordered cell array assuming nine markers:
% Note: each row is of the form: {point cloud}, {label}, {boxed volume}, {centroid}
orderedPtCloudCell = cell(9,4);
%%
% Itererate through each cluster, requesting the user to identify the
% cluster as a dot (numbered 1-9) or as an extraneous feature (number 0):
for i = 1:numClouds
   %%
   % Plot the ith cloud in blue and every other cloud in black:
   name = sprintf('Detected Markers (%d/%d)',i,numClouds);
   colored = i;
   diagram = true;
   plotClusters(ptCloudCell, name, colored, original, diagram, plot, timer);
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
   %%
   % Check if the dot is actually a marker (number 1-9):
   if id <= 1 && id >= 9
       %%
       % Save the clusters in the order based on the user input:
       orderedPtCloudCell(id,:) = ptCloudCell(i,:);
   end
   %%
   % Close the current figure:
   close
end
%%
% End timer:
if timer
    toc;
end
end