function recorddata()

CTRLrec=figure('numbertitle','off',...
    'name','Data Recorder ','MenuBar','none',...
    'NumberTitle','off','ToolBar','none',...
    'Position',[830 400 270 190],'Color',[0,0,0]);

EEGlabel=uicontrol('Style','Text',...
'String','EEG',...
'Units','normalized',...
'Position',[0.1 0.75 0.25 0.2]);

StartButt=uicontrol('Style','PushButton',...
'String','Stop',...
'Units','normalized',...
'Callback','delete(gcbo)',...
'Position',[0.1 0.6 0.25 0.2]);

while ishandle(StartButt)
  disp(datestr(now, 0));
  pause(0.25);
end

end