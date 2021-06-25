clc; clear;
%% Load Audio Object to Synch
Xmic=readtable('MicSetts.csv');
fs_audio=Xmic.fs_mic;
IDmic=Xmic.MidID;
Nbits=Xmic.Nbits;
Nchannels=Xmic.Nchannels;
info=audiodevinfo;
%% MAKE RECORDER

SynchrecObj = audiorecorder(fs_audio,Nbits,Nchannels,IDmic);
fprintf('>>Microphone:\n  %s\n',info.input(IDmic+1).Name);
fprintf('  fs=%i, %i Bits, %i channel\n',fs_audio,Nbits,Nchannels);
%% Record DATA
t=datetime;
t.Format='dd-MMM-uuuu HH:mm:ss.SSS';
tic;
% tfuture=t + seconds(30) to add timestamps
% TOC times are in SECONDS

% Start Recording and Time Zero
disp('>>Start recording.')
% RECORD AUDIO SYNCH
TimeZeroA=toc;
record(SynchrecObj);
TimeZeroB=toc;
% ############################################################
%% STOP DATA
TimeEndA=toc;
stop(SynchrecObj);
TimeEndB=toc;
disp('>>End of Recording.');
%% DATA SYNCH
y = getaudiodata(SynchrecObj);
disp('>>Audio to vector.');    
% ydata=getdata