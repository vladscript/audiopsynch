%% Launch Sensors for Setup B
% Neurosky and GazePoint in the same PC
% Script to start Neurosky and/or GazePoint 3
% Before Testing:
% Pair Neurosky to Windows
% Connect & Callibrate Gaze Point
% Input: sensors required
%   NS:     NeuroSky logical index
%   GPT:    GazePoint logical index
%   AU:     Audio (microphone) logical index
%   CAM:    Camera (built-in or USB) logical index
% Output: detected and working status
%   NSs:     logical index
%   GPTs:    logical index
%   AUs:     logical index
%   CAMs:    logical index
function [NSs,GPTs,AUs,CAMs]=LaunchSetupB(NS,GPT,AU,CAM)
%% Setup
Import_AudioPsynch;
NSs=false; GPTs=false; AUs=false; CAMs=false;
%% Neurosky
if NS
    % Test Script: plot data 30 seconds
    try
        NeuroSkyTest;
        NSs=true;
    catch 
        warning('>>Check Neurosky device is connected/paired or COM port.');
    end
else
    fprintf('\n>>No EEG required\n')
end
%% GazePoint
if GPT
    % Test Script: plot data X seconds
    GazePointTest;
    GPTs=GP3connected;
else
    fprintf('\n>>No Eye Tracking required\n')
end
%% Microphone
if AU
    % Microphone Test
    AUs=true;
else
    fprintf('\n>>No audio input required\n')
end
%% Video
if CAM
    % Camera Test
    CAMs=true;
else
    fprintf('\n>>No video input required\n')
end



