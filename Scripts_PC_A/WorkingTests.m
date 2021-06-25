function WorkingTests(window,MonitorMetaData)

% Retreive the maximum priority number
topPriorityLevel = MaxPriority(window);
ifi=MonitorMetaData.IFI;
% Length of time and number of frames we will use for each drawing test
numSecs = 1;
numFrames = round(numSecs / ifi);
waitframes = 1;
Priority(topPriorityLevel);
vbl = Screen('Flip', window); A4=vbl;
for frame = 1:numFrames
    % Color the screen blue
    Screen('FillRect', window, [0 0 0.5]);

    % Tell PTB no more drawing commands will be issued until the next flip
    % Screen('DrawingFinished', window);
    % Xnoise=randn(1000,1);

    % Flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

end
B4=vbl;
disp(B4-A4)
Priority(0);