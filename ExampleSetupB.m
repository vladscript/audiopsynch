%% Example Experiment for setup B
% Setup B: all sensors in one PC
% 1) Choose and verify if devices are plugged.
% 2) Run Test
%% Setup
Import_AudioPsynch;
clc; clear; sca;

%% Select Devices
Devices=DevicesGUI();
NS=Devices(1);      % NeuroSky
GPT=Devices(2);     % GazePoint
AU=Devices(3);      % Microphone
CAM=Devices(4);     % Camera
% Verify if devices are plug and working
[NSs,GPTs,AUs,CAMs]=LaunchSetupB(NS,GPT,AU,CAM);

%% Start Experiment












