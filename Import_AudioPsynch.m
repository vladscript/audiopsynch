% Call Directories where ALL scripts are
%% ADDING ALLSCRIPTS
fprintf('\n>>Importing Scripts: ')
if exist('BeepHeader.m','file')
    fprintf('already ')
else
    ActualDir=pwd;
    addpath(genpath([ActualDir,'\Scripts']))
    addpath(genpath([ActualDir,'\Scripts_PC_A']))
    addpath(genpath([ActualDir,'\Scripts_PC_B']))
end
fprintf('done.\n\n')