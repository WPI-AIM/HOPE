%% filterColor
% This function takes in a matrix of colored vertices and a color range and
% outputs vertices that are within the specified range.
function [filteredV] = filterColor(vertices, colorRange, print, timer)
%%
% Start timer:
tic
%%
% Grab the number of points:
n = length(vertices);
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
    RED = colorRange(1,1) < vertices(i,4) && vertices(i,4) < colorRange(1,2);
    GREEN = colorRange(2,1) < vertices(i,5) && vertices(i,5) < colorRange(2,2);
    BLUE = colorRange(3,1) < vertices(i,6) && vertices(i,6) < colorRange(3,2);
    %%
    % Saves the colored vertex if it fits the color bounds:
    if RED && GREEN && BLUE
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
    toc
else 
    toc;
end
end