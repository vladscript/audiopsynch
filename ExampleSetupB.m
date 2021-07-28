%% Example Experiment for setup B
% Setup B: all sensors in one PC
% 1) Choose and verify if devices are plugged.
% 2) Start acquire data
% 3) TimeStamps Zero for each device and experiment;
% 3) Run Test
%% Setup
Import_AudioPsynch;
clc; clear; sca;

%% Select Devices
Devices=DevicesGUI();
% Devices(1);     % NeuroSky
% Devices(2);     % GazePoint
% Devices(3);     % Microphone
% Devices(4);     % Camera
% Verify devices status (plugged)
[NSs,GPTs,AUs,CAMs]=LaunchSetupB(Devices(1),Devices(2),Devices(3),Devices(4));
% Console messages & reminders
if NSs
    fprintf('>See MindWaveSettings to see data options from EEG\n')
end
if GPTs
    fprintf('\n>Use SendMsgToGP3 function to mark times of events in your PTB code\n')
end
%% Start Acquisition
if sum([NSs,GPTs,AUs,CAMs])>0
    % Directory
    FileDirSave=getDir2Save();
    FileDirSave=[FileDirSave,'Data\'];
    %Prefix to save data
    ExpDataName=dataexpid(clock);
    % Create Folder:
    if ~isdir(FileDirSave)
        fprintf('New folder [%s]\n',FileDirSave)
        mkdir(FileDirSave);
    end
%     % Saves data (and the day)
%     save([FileDirSave,ExpDataName,'.mat'],'ExpDataName');
%     fprintf('>>Raw Fluorescence Data from %s: SAVED \n',ExpDataName)
end
% Camera
if CAMs
    Camera=getcamid();
    % Start GUI
    rgbImage = snapshot(Camera);
end
% Microphone
if AUs
    Microphone=loadmic();
    % Start GUI
    Taud=cputime;
    record(Microphone);
end
% EEG ####################################################################
if NSs
    global NeuroskyData;
    NeuroskyData.EEG=[];
    NeuroskyData.Battery=0;
    NeuroskyData.PoorSignal=0;
    NeuroskyData.Record=true;
    NeuroskyData.Tzero=cputime;
    NeuroskyData.Toff=0;
    gatherEEGdata();
end

%% Save Data
% Epxeriment Workspace with TimeZeros












