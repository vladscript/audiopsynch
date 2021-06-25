clc; clear;
%% Load Audio Object to Synch
fprintf('\n>>Loading Audio Synchronizer:')
Xmic=readtable('MicSetts.csv');
IDmic=Xmic.MidID;
Nchannels=Xmic.Nchannels;
% info=audiodevinfo;
%% MAKE RECORDER
InitializePsychSound(1);
% Open audio device 'device', 
% with mode 2 (== Only audio capture),
% and a required latencyclass of 1 == low-latency mode, 
% with the preferred default sampling frequency of the audio device, 
% and 2 sound channels for stereo capture. This returns a handle to the audio device:
pahandle = PsychPortAudio('Open', IDmic, 2, 1, [], Nchannels);
s = PsychPortAudio('GetStatus', pahandle);
fs_audio = s.SampleRate;
% Preallocate an internal audio recording  buffer with a capacity of 10 seconds:
PsychPortAudio('GetAudioData', pahandle, 10);
% Start audio capture immediately and wait for the capture to start.
% We set the number of 'repetitions' to zero,
% i.e. record until recording is manually stopped.

%% Record DATA
t=datetime;
t.Format='dd-MMM-uuuu HH:mm:ss.SSS';
tic;
% tfuture=t + seconds(30) to add timestamps
% TOC times are in SECONDS
% TstartA=toc;
TstartA = GetSecs;
TimeStart=PsychPortAudio('Start', pahandle, 0, 0, 1);
% TstartB=toc;
TstartB= GetSecs;
fprintf('Audio capture started, press any key for about 1 second to quit.\n');
% Start Recording and Time Zero
disp('>>Start recording.')
%% STOP DATA
% TendA=toc;
TendA= GetSecs;
% Stop capture:
[startTime endPositionSecs xruns estStopTime]=PsychPortAudio('Stop', pahandle);
% TendB=toc;
TendB= GetSecs;
% stopDATA(SynchrecObj); % Hypothetical Function
disp('>>End of Recording.');    
%% DATA SYNCH AND CLOSW
% Perform a last fetch operation to get all remaining data from the capture engine:
audiodata = PsychPortAudio('GetAudioData', pahandle);
PsychPortAudio('Close', pahandle);
disp('>>Data to vector: done.');    