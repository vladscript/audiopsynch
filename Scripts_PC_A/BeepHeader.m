%% HEADER BEEP BEFORE EXPERIMENT
% This Scripts works as a block before experiment in order to record
% audio trigger in PC B as a train of beeps

%% Check if PTB-3 is installed
KeepSynch=false;
fprintf('\n>>Checking PTB-3: ')
if exist('PsychDefaultSetup.m','file')
    fprintf('installed.\n');
    KeepSynch=true;
else
    fprintf('not found.\n')
    fprintf('Install or add Folder in Set Path in ENVIRONENT toolstrip.\n')
end
% Continue;
if KeepSynch
    %% Make ADVERTS:
    
    myicon = imread('Figures/AudioSign.png');
    h=msgbox('Make sure volume Audio is 50% and Sensors are Connected','Setup','custom',myicon);
    waitfor(h);
    
    %% Build Beep
    % AUDIO SETUP
    fprintf('\n>>Loading audio:')
    % Initialize Sounddriver
    InitializePsychSound(1);
    % Beep Settings
    nrchannels = 2; 
    BeepFeatures =  readtable('BeepSettings.csv');
    Sampfreq=BeepFeatures.SamplingFreq;
    beepLengthSecs=BeepFeatures.Length;
    Beepfreq=BeepFeatures.FreqBeep;
    Nbeeps=BeepFeatures.Nreps;
    % Start immediately (0 = immediately)
    startCue = 0;
    % Should we wait for the device to really start (1 = yes)
    waitForDeviceStart = 1;
    pahandle = PsychPortAudio('Open', [], 1, 1, Sampfreq, nrchannels);

    PsychPortAudio('Volume', pahandle, 1);
    % Make a beep which we will play back to the user
    myBeep = MakeBeep(Beepfreq, beepLengthSecs, Sampfreq);
    % Fill the audio playback buffer with the audio data, doubled for stereo
    PsychPortAudio('FillBuffer', pahandle, [myBeep; myBeep]);
    fprintf('done.\n')
    % Setup PTB with some default values
    PsychDefaultSetup(2);
    screenNumber = max(Screen('Screens'));
    % Define black, white and grey
    black = BlackIndex(screenNumber);
    % Open the screen
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, black, [], 32, 2);
    [xCenter, yCenter] = RectCenter(windowRect);
    ifi = Screen('GetFlipInterval', window);
    Screen('TextSize', window, 40);
    topPriorityLevel = MaxPriority(window);
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
    isiTimeSecs = 1;
    isiTimeFrames = round(isiTimeSecs / ifi);
    % Numer of frames to wait before re-drawing
    waitframes = 1;
    % Start audio playback
    Priority(topPriorityLevel);
    vbl = Screen('Flip', window);
    % Nbeeps=4;
    TymeSynchs=zeros(Nbeeps,1);
    for i=1:Nbeeps
        % Beep 
        PsychPortAudio('Start', pahandle, repetitions, startCue, waitForDeviceStart);
        for j=1:beepLengthSecs*round(1/ifi)
            % Draw text
            DrawFormattedText(window, ['Synch BEEP #',num2str(i)], 'center', 'center', [1 0 0]);
            % Flip to the screen
            vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
        end
        % A,B,C TimeStamps to Synch
        TymeSynchs(i)=vbl;
        PsychPortAudio('Stop', pahandle);
        % Silence
        for j=1:beepPauseTime*round(1/ifi)
            % Draw text
            DrawFormattedText(window,'...', 'center', 'center', [1 0 0]);
            % Flip to the screen
            vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
        end
    end
    % Close the audio device
    PsychPortAudio('Close', pahandle);

    while ~KbCheck
        DrawFormattedText(window, 'Presiona cualquier tecla',...
        'center', 'center', [1 1 1]);
        vbl=Screen('Flip', window);
    end
    TimeStartExperiment=vbl;

    % NEXT: EXPERIMENT
    % CLEAR SCREEN: END 
    % sca;
end