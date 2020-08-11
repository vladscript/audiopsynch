%% SET Beep Train 
close all; clear;
%% Parameters ###########################################
Amplitude=1;
SamplingFreq=48000;
FreqBeep=555; % Hertz
Length=0.5; % seconds
IntPause=0.5; % secondsPause
Nreps=3;        % NUmber of repetititions
% #######################################################
% Build
tbeep=linspace(0,Length,round(Length*SamplingFreq));
Beep=Amplitude*sin(2*pi*FreqBeep*tbeep);
Pausee=zeros(1,round(IntPause*SamplingFreq));
TrainBeep=[];
for n=1:Nreps
    if n==1
        % Beep
        TrainBeep=[TrainBeep,Beep];
    else
        % Pause
        TrainBeep=[TrainBeep,Pausee,Beep];
    end
end
% Plot
plot([0:numel(TrainBeep)-1]/SamplingFreq,TrainBeep,'k')
xlabel('t [s]')
ylabel('Amplitude')
drawnow;
% Sound
sound(TrainBeep,SamplingFreq)
%% Ask for saving
okbutton = questdlg('Save Beep Train Parameters?');
switch okbutton
    case 'Yes'
        % save Stuff
        T=table(Amplitude,SamplingFreq,FreqBeep,Length,IntPause,Nreps);
        writetable(T,'BeepSettings.csv','Delimiter',',','QuoteStrings',true)
    otherwise
        % Dont save
end
