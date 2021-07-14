%% $\bf{AudioPsynch}$
% 
% *SOURCE* :
% <https://github.com/vladscript/audiopsynch.git>
% 
% |Installation and Use Guide|
% 
%% 0. Requirements
% 
% * MATLAB
% * PsychToolbox (PTB-3)
% * Enabled Microphone (Windows Settings) in PC B
% * Paired Neurosky (Bluetooth Settings) in PC B
% 
%% 1. General Settings
% 
% * Import functions:
% 
%           >>Import_AudioPsynch
% 
% * Neurosky (each time it's paired):        
% 
%           >>edit MindWaveSettings
% 
%               COMportNumber See in (W10):
%               WindowsSettings/Bluetooht and Other Devices/More Options
%               See Baud Rate
%               See Data Format & Type
% 
%           >>NeuroSkyTest
% 
% * Microphone (only for Laptop B in Setup B run once):      
% 
%           >>MicrophoneFinder
%               Sampling frequency
%               N bits
%               N channels
%               Seconds to record
% 
%% 2. Setup A [Audio Trigger]
% 
% * *PC A*
% 1- Connect audio splitter.
% 2- Set and edit >>BeepTrainBuilder
% Audio beep to be send
% * >>BeepHeader
% 
%% 3. Setup B [Single PC]
% 
% * *PC B*
% * >>LaunchSetupB
% 
%% 4. Experiment Test
% ACTUAL MODE: @ Original Coordiantes Order
% 
% * >>Experiment_Test
%
%% 5. Visualize Data Experiment Test
% ACTUAL MODE: @ Original Coordiantes Order
% 
% * >>Load_Experiment_Test
%
%% END