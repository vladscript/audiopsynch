% Exmaples of Interesting functions @PTB

[window,windowRect]=PsychImaging('OpenWindow',...)
% Query stuff
Screen('WindowSize',window)
...
% TimeStamps:
Screen('Flip', window);
vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
% vbl:vertical blanking interval or the vertical sync signal, 
% vertical retrace is a measurement of time related to video 
% displays. It represents the amount of time between the end 
% of one frame being drawn, and the beginning of the next frame

% TEXT ##################################################
Screen('TextFont',window,'Arial')
Screen('TextSize', window, 50);
DrawFormattedText(window, 'Press any key:', 'center',...
    screenYpixels * 0.25, [1 0 1]);
% Text output of mouse position draw in the centre of the screenDrawFormattedText(window, textString, 'center', 'center', white);

% MOUSE ##################################################
SetMouse(round(rand * screenXpixels), round(rand * screenYpixels), window);
% Get the current position of the mouse
[x, y, buttons] = GetMouse(window);

% DRAWS ##################################################
Screen('DrawDots', window, [x y], 10, white, [], 2);