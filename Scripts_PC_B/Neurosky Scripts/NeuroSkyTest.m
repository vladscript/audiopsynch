%% Minimal Script to read Raw EEG data from Neurosky
% See details in Stream SDK for PC:Development Guide from Neurosky
% Settings in MindWaveSettings
%% Setup #################################################################
% clear; close all;
% COM POrt and Rate Settings:
MindWaveSettings;
% Warning
% myicon = imread('Figures/connected_v1.png');
% h=msgbox(['Make sure Neurosky is paired and Connected on the COM',num2str(COMportNumber),' port in MindWaveSettings'],'Bluetooth Connection','custom',myicon);
% waitfor(h);

% Recording settings in SECONDS:
fs_eeg=512;
Nseconds=15; % Total recording
WindowSizeEEG=1; % Size of the buffer, data viewer and data save
data = zeros(1,round(WindowSizeEEG*fs_eeg));    %preallocate buffer
%load thinkgear dll
loadlibrary('thinkgear64.dll','thinkgear64.h');
fprintf('thinkgear64.dll loaded\n');

% See Functions:
% libfunctionsview thinkgear64

% dll version from Tier 1:  Call anytime
dllVersion = calllib('thinkgear64', 'TG_GetDriverVersion');
fprintf('ThinkGear DLL version: %d\n', dllVersion );

%% Get a connection ID handle to ThinkGear ################################
connectionId1 = calllib('thinkgear64', 'TG_GetNewConnectionId');
% The Connection is used to perform all other operations of this API, 
% so the ID handle is passed as the ?rst argument to all functions of this API.
% When the ThinkGear Connection is no longer needed, be sure to call TG_FreeConnection() on the
% ID handle to free its resourcesDeviceOK=False;
if ( connectionId1 < 0 )
    error('ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1);
    % -1 if too many Connections have been created without being freed by TG_FreeConnection().
    % -2 if there is not enough free memory to allocate to a new ThinkGear Connection.
else
    % LOG FILES FOR DEBUGGIN PURPOSES *************************************
    %     % Set/open stream (raw bytes) log file for connection
%     errCode = calllib('thinkgear64', 'TG_SetStreamLog', connectionId1, 'streamLog.txt' );
%     if( errCode < 0 )
%         error( sprintf( 'ERROR: TG_SetStreamLog() returned %d.\n', errCode ) );
%     end;
% 
%     % Set/open data (ThinkGear values) log file for connection
%     errCode = calllib('thinkgear64', 'TG_SetDataLog', connectionId1, 'dataLog.txt' );
%     if( errCode < 0 )
%         error( sprintf( 'ERROR: TG_SetDataLog() returned %d.\n', errCode ) );
%     end;% Attempt to connect the connection ID handle to serial port COM
    
    % MAKE CONNECTION *****************************************************
    errCode = calllib('thinkgear64', 'TG_Connect',  connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS );
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
        % Ready to read Data
    end
end;


%% DATA STREAMING  ########################################################
if DeviceOK
    % Create ViewerFigure
    EEGFigure=figure('NumberTitle','off','Position',[700 340 640 320],...
        'ToolBar','none','Name','Neurosky Data Viewer','MenuBar','none');
    EEGaxis=subplot(1,1,1);
    grid(EEGaxis,'on');
    WindowSignal=plot(EEGaxis,zeros(round(WindowSizeEEG*fs_eeg),1),'k','LineWidth',2);
    EEGaxis.XLim=[0,round(WindowSizeEEG*fs_eeg)];
    EEGaxis.YLim=[-1000,1000];
    EEGaxis.YLabel.FontSize=8;
    EEGaxis.XLabel.FontSize=8;
    EEGaxis.XTick=linspace(0,WindowSizeEEG*fs_eeg,5);
    EEGaxis.XTickLabel=1000*linspace(0,WindowSizeEEG,5);
    EEGaxis.YLabel.String='EEG Data';
    EEGaxis.XLabel.String='ms';
    drawnow;
    winPcn=0;
    % Read Data
    fprintf( 'Connected.  Reading Packets...\n' );
    j = 0; % windows size counter
    i = 0; % sample counter
    wincnt=1;
    while (i < round(Nseconds*fs_eeg))  
        % if a packet was read...
        if (calllib('thinkgear64','TG_ReadPackets',connectionId1,1) == 1)   
            % if RAW has been updated 
            if (calllib('thinkgear64','TG_GetValueStatus',connectionId1,TG_DATA_RAW) ~= 0)   
                j = j + 1;
                i = i + 1;
                data(j) = calllib('thinkgear64','TG_GetValue',connectionId1,TG_DATA_RAW);
            end
        end
        if (j == round(WindowSizeEEG*fs_eeg))
            % plot the data
%             plot(EEGaxis,data,'LineWidth',2); 
            drawnow;
%             winPcn=j/(WindowSizeEEG*fs_eeg);
            EEGaxis.Title.String=sprintf('Testing: %i %%',round(100*wincnt/(Nseconds/WindowSizeEEG)));
            WindowSignal.YData=data;
            j = 0;
            wincnt=wincnt+1;
        end
    end
    %% Disconnect             
    calllib('thinkgear64', 'TG_FreeConnection', connectionId1 );
    fprintf( 'Finished\n' );
end
%% END OF THE WORLD ########################################################