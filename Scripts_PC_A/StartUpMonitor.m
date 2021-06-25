%% Module Start Up
% Initiates PsychToolBox
% Get Monitor Metadata
function MonitorMetaData=StartUpMonitor(screenNumber,window)
    
    % Get the size of the on screen window in pixels, these are the last two
    % numbers in "windowRect" and "rect"
    [screenXpixels, screenYpixels] = Screen('WindowSize', window);

    
    Screen('TextSize', window, 50);
    Screen('TextFont', window, 'Times');
    DrawFormattedText(window, 'Iniciando', 'center',...
    screenYpixels * 0.5, [1 0.5 0.75]);
    % Flip to the screen
    Screen('Flip', window);
    % Queries the display size in mm as reported by the operating system. Note
    % that there are some complexities here. See Screen DisplaySize? for
    % information. So always measure your screen size directly.
    [width, height] = Screen('DisplaySize', screenNumber);


    % Query the inter-frame-interval. This refers to the minimum possible time
    % between drawing to the screen
    ifi = Screen('GetFlipInterval', window);

    % We can also determine the refresh rate of our screen. The
    % relationship between the two is: ifi = 1 / hertz
    hertz = FrameRate(window);

    % Get the maximum coded luminance level (this should be 1)
    maxLum = Screen('ColorRange', window);

    % We can also query the "nominal" refresh rate of our screen. This is
    % the refresh rate as reported by the video card. This is rounded to the
    % nearest integer. In reality there can be small differences between
    % "hertz" and "nominalHertz"
    % This is nothing to worry about. See Screen FrameRate? and Screen
    % GetFlipInterval? for more information
    nominalHertz = Screen('NominalFrameRate', window);

    % Here we get the pixel size. This is not the physical size of the pixels
    % but the color depth of the pixel in bits
    ColorDepth = Screen('PixelSize', window);

    % OUTPUT
    DateID=datestr(datetime('now'));
    DateID(DateID==':')='_';
    DateID(DateID==' ')='-';
    MonitorMetaData.MonitorID=screenNumber;
    MonitorMetaData.Xpixels=screenXpixels;
    MonitorMetaData.Ypixels=screenYpixels;
    MonitorMetaData.Xmm=width;
    MonitorMetaData.Ymm=height;
    MonitorMetaData.IFI=ifi;
    MonitorMetaData.RefreshHz=hertz;
    MonitorMetaData.NominalHz=nominalHertz;
    MonitorMetaData.Date=DateID;
    MonitorMetaData.ColorDepth=ColorDepth;
    MonitorMetaData.MaxLum=maxLum;
    
    WaitSecs(2);
    % Clear the screen
%     sca;
end