% Clear the workspace and the screen
sca;
close all;
clearvars;
%% Settings
% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);
screens = Screen('Screens');
screenNumber = max(screens);
% Open an on screen window using PsychImaging and color it grey.
[window, ~] = PsychImaging('OpenWindow', screenNumber, 0);
%% Start Up: check display
% It selects External Monitor if there is one
MonitorMetaData=StartUpMonitor(screenNumber,window);
%% Working Tests
% Image, Audio, Keyboard Testing
% Loading Animation
% WorkingTests(window,MonitorMetaData)
%% CLOSING
% Clear the screen.
sca;