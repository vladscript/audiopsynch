%% Function to ask for sensors to use
% Launch GUI
function A=DevicesGUI()
%% Initialize
A=zeros(4,1);
%% GUI figure
FigGui=figure('Name','Devices','NumberTitle','off','Position',...
    [400   300   240   200],'MenuBar','none','DockControls','off',...
    'ToolBar','none');
% ,'CloseRequestFcn',@UpdateA
% EyeTracking
a = uicontrol('Style','checkbox',...
    'String',{'Neurosky'},'Callback', @checkbox1_Callback);
a.Position = [10 160 200 20];
% NeuroSky
b = uicontrol('Style','checkbox',...
    'String',{'GazePoint'},'Callback', @checkbox2_Callback);
b.Position = [10 120 200 20];
% Voice
c = uicontrol('Style','checkbox',...
    'String',{'Microphone'},'Callback', @checkbox3_Callback);
c.Position = [10 80 200 20];
% Video
d = uicontrol('Style','checkbox',...
    'String',{'Camera'},'Callback', @checkbox4_Callback);
d.Position = [10 40 200 20];
% A=[a.Value,b.Value,c.Value,d.Value];
waitfor(FigGui);
%% Nested Functions
function checkbox1_Callback(a, ~, ~)
% Hint: get(hObject,'Value') returns toggle state of checkbox1
    if (get(a,'Value') == get(a,'Max'))
        fprintf('\nDevice %s Selected',a.String{1});
        A(1)=1;
    else
        fprintf('\ndevice %s unselected',a.String{1});
        A(1)=0;
    end
end
function checkbox2_Callback(b, ~, ~)
    % Hint: get(hObject,'Value') returns toggle state of checkbox1
    if (get(b,'Value') == get(b,'Max'))
        fprintf('\nDevice %s Selected',b.String{1});
        A(2)=1;
    else
        fprintf('\ndevice %s unselected',b.String{1});
        A(2)=0;
    end
end

function checkbox3_Callback(c, ~, ~)
    % Hint: get(hObject,'Value') returns toggle state of checkbox1
    if (get(c,'Value') == get(c,'Max'))
        fprintf('\nDevice %s Selected',c.String{1});
        A(3)=1;
    else
        fprintf('\ndevice %s unselected',c.String{1});
        A(3)=0;
    end
end

function checkbox4_Callback(d, ~, ~)
% Hint: get(hObject,'Value') returns toggle state of checkbox1
    if (get(d,'Value') == get(d,'Max'))
        fprintf('\nDevice %s Selected',d.String{1});
        A(4)=1;
    else
        fprintf('\ndevice %s unselected',d.String{1});
        A(4)=0;
    end
end
end