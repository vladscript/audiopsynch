clc; clear;
%% Load Audio Object to Synch
% Settings [low-quallity]
fs_mic  =   48000; % Same as default Beep
Nbits   =   8;     % Ssave
Nchannels=  1;     % Save
Y={};
MICROS={};
Nsecrec=2;
%% Messages:
fprintf('\n>>Script to select Microphone to record audio trigger\n')
fprintf('\n>>Run this once\n')
fprintf('\n>>Make sure that there is an audio playing in the Laptop A to be recorded\n')
fprintf('\n Then Press any key\n')
pause;

%% Explore ID microphones
fprintf('\n>>Getting Microphones:')
info=audiodevinfo;
Ndevices = audiodevinfo(0);
fprintf(' %i found.\n',Ndevices)

for n=1:Ndevices
    IDdevice=info.input(n).ID;
    fprintf('>>Testing:\n %s\n',info.input(n).Name)
    SynchrecObj = audiorecorder(fs_mic,Nbits,Nchannels,n);
    fprintf('>>Recording %i seconds: ',Nsecrec)
    record(SynchrecObj,Nsecrec);
    fprintf('ready.\n')
    fprintf('>>Getting signal: ')
    pause(3);
    y=getaudiodata(SynchrecObj);
    Y{n}=y;
    fprintf('done.\n')
end
%         doc isrecording
%% Plotting Signals:
fprintf('>>Plotting recordings: ')
figure;
t=linspace(0,2,fs_mic*Nsecrec);
for n=1:Ndevices
    subplot(Ndevices,1,n);
    plot(t,Y{n})
    title(['Mic: ',info.input(n).Name])
    axis tight; grid on;
end
fprintf('done.\n')

%% Playing Recordings:
fprintf('>>Sound recordings: ')
for n=1:Ndevices
    sound(Y{n},fs_mic)
    MICROS{n}=info.input(n).Name;
    fprintf('\nMic: %s\n',MICROS{n})
    pause(2.5)
end
fprintf('done.\n')

%% Select Microphone to save it
% Display Menu
[indx,tf] = listdlg('PromptString',{'Select a microphone.',...
    'Only the one with the audio of Laptop A.',''},...
    'SelectionMode','single','ListSize',[300,300],'ListString',MICROS);
fprintf('>>Saving settings ') 
% MicrphoneDev=MICROS{};
MidID=info.input(indx).ID;
% Make table
T=table(MidID,Nbits,Nchannels,fs_mic);
writetable(T,'MicSetts.csv','Delimiter',',','QuoteStrings',true)
fprintf(' in file [MicSetts.csv]: done.\n')
%% END
clear; close all;