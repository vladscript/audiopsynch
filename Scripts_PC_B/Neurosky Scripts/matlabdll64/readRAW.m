% Minimal Script to read Raw EEG data from Neurosky

% make sure to change portnum1 to the appropriate COM port
% See details in Stream SDK for PC:Development Guide from Neurosky
%% Setup
clear; close all;
data = zeros(1,256);    %preallocate buffer
% COM POrt and Rate Settings:
MindWaveSettings;
%load thinkgear dll
loadlibrary('thinkgear64.dll','thinkgear64.h');
fprintf('thinkgear64.dll loaded\n');

% See Functions:
% libfunctionsview thinkgear64

% dll version from Tier 1:  Call anytime
dllVersion = calllib('thinkgear64', 'TG_GetDriverVersion');
fprintf('ThinkGear DLL version: %d\n', dllVersion );

%% Get a connection ID handle to ThinkGear
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
        error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
        % -1 if @c connectionId does not refer to a valid ThinkGear Connection ID handle.
        % -2 if @c serialPortName could not be opened as a serial communication port for any reason. Check
        % that the name is a valid COM port on your system.
        % -3 if @c serialBaudrate is not a valid TG_BAUD_* value.
        % -4 if @c serialDataFormat is not a valid TG_STREAM_* type.
    else
        DeviceOK=True;
    end
    
end;


%% DATA STREAMING 
if DeviceOK
    fprintf( 'Connected.  Reading Packets...\n' );
    j = 0;
    i = 0; % sample counter
    while (i < 10240*5)   %loop for 20 seconds
        % if a packet was read...
        if (calllib('thinkgear64','TG_ReadPackets',connectionId1,1) == 1)   
            % if RAW has been updated 
            if (calllib('thinkgear64','TG_GetValueStatus',connectionId1,TG_DATA_RAW) ~= 0)   
                j = j + 1;
                i = i + 1;
                data(j) = calllib('thinkgear64','TG_GetValue',connectionId1,TG_DATA_RAW);
            end
        end
        if (j == 256)
            plotRAW(data);            %plot the data, update every .5 seconds (256 points)
            drawnow;
            j = 0;
        end
    end
    %% Disconnect             
    calllib('thinkgear64', 'TG_FreeConnection', connectionId1 );
    fprintf( 'Finished\n' );
end




