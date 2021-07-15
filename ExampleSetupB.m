%% Example Experiment for setup B
% Setup B: all sensors in one PC
% 1) Choose and verify if devices are plugged.
% 2) Run Test
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
    fprintf('>See MindWaveSettings to retrieve more data from EEG\n')
end
if GPTs
    fprintf('\n>Use SendMsgToGP3 function to mark times of events in your PTB code\n')
end
%% Start Acquisition
%% Start Experiment
% Set Time Zero for each sensor [RECORDING]
% Set Time Zero for experiment
%% Save Data
% Epxeriment Workspace with TimeZeros












