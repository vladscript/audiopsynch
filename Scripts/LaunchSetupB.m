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
%% Initialize Status
NSs=false; GPTs=false; AUs=false; CAMs=false;
%% Neurosky
if NS
    % Test Script: plot data N seconds
    try
        NeuroSkyTest;
        NSs=true;
    catch
        fprintf('\n');
        warning('Check Neurosky device is NOT connected/paired or COM port.');
    end
else
    fprintf('\n>>No EEG required')
end
%% GazePoint
if GPT
    % Test Script: plot data X seconds
    GazePointTest;
else
    fprintf('\n>>No Eye Tracking required')
end
%% Microphone
if AU
    try
        MicrophoneTest;
        AUs=true;
    catch
        fprintf('\n');
        warning('Check microphone settings.');
    end
else
    fprintf('\n>>No audio input required')
end
%% Video
if CAM
    % Camera Test
    CameraTest;
else
    fprintf('\n>>No video input required')
end

