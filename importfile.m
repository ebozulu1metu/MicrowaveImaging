function [CITIFILEA0100,VarName2] = importfile(filename, startRow, endRow)
%�MPORTF�LE Import numeric data from a text file as column vectors.
%   [CITIFILEA0100,VARNAME2] = �MPORTF�LE(FILENAME) Reads data from text
%   file FILENAME for the default selection.
%
%   [CITIFILEA0100,VARNAME2] = �MPORTF�LE(F�LENAME, STARTROW, ENDROW) Reads
%   data from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   [CITIFILEA0100,VarName2] = importfile('20deg.D1',10, 1610);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/02/14 13:46:25

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 10;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow(1)-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    textscan(fileID, '%[^\n\r]', startRow(block)-1, 'WhiteSpace', '', 'ReturnOnError', false);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
CITIFILEA0100 = dataArray{:, 1};
VarName2 = dataArray{:, 2};

