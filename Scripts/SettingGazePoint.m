function SettingGazePoint(window,session1_client)

fprintf('\n>>Loading image:')
ImageLab = imresize( imread('Figures\HeaderLab.png'), 0.75 );
fprintf(' done.\n')

% Retreive the maximum priority number
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);
% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Screen('Flip', window);


% Make the image into a texture
imageTexture = Screen('MakeTexture', window, ImageLab);

% Draw the image to the screen
Screen('DrawTexture', window, imageTexture, [], [], 0);
% Flip to the screen
Screen('Flip', window);

%% Screen gray scale in 2s

%% Experiment (stimuli presentation) goes here SACCADES
for trial_num=1:3
    % Start of new trial here
    SendMsgToGP3(session1_client,['trial_start' num2str(trial_num)]); %send msg trigger for start of the trial
    pause(2);
    % Present a stimuli here
    SendMsgToGP3(session1_client,['stimuli' num2str(trial_num)]); %send msg trigger for onset of new stimuli
    pause(2);  
end

% Wait for two key pressed

KbStrokeWait; sca;
% KbWait;
% Priority(0);