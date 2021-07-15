%% Load Audio Object to Synch
fprintf('\n>>Loading: ');
Xmic=readtable('MicSetts.csv');
fs_audio=Xmic.fs_mic;
IDmic=Xmic.MidID;
Nbits=Xmic.Nbits;
Nchannels=Xmic.Nchannels;
info=audiodevinfo;
clear Xmic;
fprintf('done.\n');
%% MAKE RECORDER
SynchrecObj = audiorecorder(fs_audio,Nbits,Nchannels,IDmic);
fprintf('>>Microphone:\n  %s\n',info.input(IDmic+1).Name);
fprintf('  fs=%i, %i Bits, %i channel\n',fs_audio,Nbits,Nchannels);
%% RECORD 5 seconds
record(SynchrecObj);
fprintf('\n>>Recording...')
pause(5)
stop(SynchrecObj);
fprintf('\n>>Recording stopped.\n')
%% Show data
y = getaudiodata(SynchrecObj);
t = linspace(0,numel(y)/fs_audio,numel(y));
plot(t,y)