function gatherEEGdata()
global NeuroskyData
% Load Settings
MindWaveSettings;
% Recording settings in SECONDS:
fs_eeg=512; % sampling frequency
WindowSizeEEG=1; % Size of the buffer
% dataBuff = zeros(1,round(WindowSizeEEG*fs_eeg)); % preallocate buffer
%load thinkgear dll
loadlibrary('thinkgear64.dll','thinkgear64.h');
fprintf('thinkgear64.dll loaded\n');
% See Functions:
% libfunctionsview thinkgear64
%% Get a connection ID handle to ThinkGear ################################
connectionId1 = calllib('thinkgear64', 'TG_GetNewConnectionId');
% When the ThinkGear Connection is no longer needed, be sure to call TG_FreeConnection() on the
% ID handle to free its resourcesDeviceOK=False;
if ( connectionId1 < 0 )
    if connectionId1==-1
        calllib('thinkgear64', 'TG_FreeConnection',connectionId1);
        fprintf('\n>too many Connections have been created without being freed by TG_FreeConnection().');
    else
        fprintf('\nThere is not enough free memory to allocate to a new ThinkGear Connection.');
    end
    error('ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1);
else
    % STABLISH COMMUNICATION
    errCode = calllib('thinkgear64', 'TG_Connect',  connectionId1,...
        comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS);
    if ( errCode < 0 )
        switch errCode
            case -1 
                fprintf('\n@c connectionId does not refer to a valid ThinkGear Connection ID handle.')
            case -2
                fprintf('\n@c serialPortName could not be opened as a serial communication port for any reason. Check that the name is a valid COM port on your system.')
            case -3
                fprintf('\n@c serialBaudrate is not a valid TG_BAUD_* value.')
            case -4
                fprintf('\n@c serialDataFormat is not a valid TG_STREAM_* type.')
        end
        error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
    else
        DeviceOK=1;
        fprintf('\n>>Ready to read Data' )
    end
end;
%% DATA STREAMING  ########################################################
% Make GUI
ImGreen=imread('Figures\connected_v1.png');
ImRed=imread('Figures\nosignal_v1.png');
figure('Name','EEG ACQ','NumberTitle','off',...
        'Position',[435   345   220   200],'MenuBar','none','ToolBar','none')
% Create push button
Stopbtn = uicontrol('Style', 'togglebutton', 'String', 'STOP',...
        'Position', [70 170 50 20],'Min',0,'Max',1,'Value',0);
axes('Position',[0.3 0.11 0.38 0.4],'Units','normalized','XLim',[0.5 512.5],...
    'YLim',[0.5 512.5]);
imshow(ImGreen); drawnow;
j=1;
if DeviceOK
    while NeuroskyData.Record
        % if a packet was read...
        drawnow();     %give time for callback
        quitthis = get(Stopbtn, 'Value');
        if quitthis;
            break;
        end
        if (calllib('thinkgear64','TG_ReadPackets',connectionId1,1) == 1)   
            % if RAW has been updated 
            if (calllib('thinkgear64','TG_GetValueStatus',connectionId1,TG_DATA_RAW) ~= 0)   
                j = j + 1;
                NeuroskyData.EEG(j) = calllib('thinkgear64','TG_GetValue',connectionId1,TG_DATA_RAW);
                NeuroskyData.Battery = calllib('thinkgear64','TG_GetValue',connectionId1,0);
                NeuroskyData.PoorSignal = calllib('thinkgear64','TG_GetValue',connectionId1,1);
                fprintf('>Battery %i, Signal:&i',NeuroskyData.Battery,NeuroskyData.PoorSignal);
            end
%         else
%             %fprintf('\);
        end
    end
    %% Disconnect Bluetooth 
    imshow(ImRed); drawnow;
    calllib('thinkgear64', 'TG_FreeConnection', connectionId1 );
    NeuroskyData.Toff=cputime;
    fprintf( '\n>>Finished recording\n' );
end