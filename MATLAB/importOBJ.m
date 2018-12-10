%% importOBJ
% THis function takes in a file name and converts the .obj file into
% vertices in the format of: (x, y, z, R, G, B).
function [vertices] = importOBJ(file_name, timer)
%%
% Start timer:
if timer
    tic
end
%%
% Read in .obj data:
vertices = readObj(file_name);
%%
% End timer:
if timer
    toc
end
end