%% filterColorHSV
% This function takes in a matrix of colored vertices and a color range and
% outputs vertices that are within the specified HSV range.
function [filteredV] = filterColorHSV(vertices, colorRange, print, timer)
%%
% Start timer:
if timer
    tic;
end
%%
% Grab the number of points:
n = length(vertices);
%%
% convert the RGB colors to the HSV color space:
hsv = rgb2hsv(vertices(:,4:6));
%%
% Initialize new matrix:
filteredV = zeros(n,6);
%%
% Initialize iterator for filling in new matrix:
k = 1;
%%
% Iterate through the given matrix and create the filtered matrix:
for i = 1:n
    %%
    % Checks to see if each point fits the given color bounds:
    HUE =        colorRange(1,1) <= hsv(i,1) && hsv(i,1) <= colorRange(1,2);
    SATURATION = colorRange(2,1) <= hsv(i,2) && hsv(i,2) <= colorRange(2,2);
    VALUE =      colorRange(3,1) <= hsv(i,3) && hsv(i,3) <= colorRange(3,2);
    %%
    % Saves the colored vertex if it fits the color bounds:
    if HUE && SATURATION && VALUE
        filteredV(k,:) = vertices(i,:);
        k = k + 1;
    end
end
%%
% Remove extra zeros:
filteredV = filteredV(any(filteredV,2),:);
%%
% Grabs the new number of points:
newN = length(filteredV);
% Prints the number and percent of points filtered out:
if print
    numberRemoved = n - newN;
    percentRemoved = 100*numberRemoved/n;
    fprintf('Removed %d points (%0.2f percent).\n',numberRemoved, percentRemoved)
end
%%
% End timer:
if timer
    toc;
end