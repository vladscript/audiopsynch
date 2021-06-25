%% Eye Tracking Testing
%  Using code from: https://github.com/RingoHHuang/gazepoint-matlab-toolbox
% 
%% Set-up Matlab to GP3 session1 socket
GP3connected=false;
try
    session1_client = ConnectToGP3;
    GP3connected=true;
catch
    warning('\n>>Check Gaze Point device is connected\n.');
end
%% Run TEST
if GP3connected
    %% Spawn a second Matlab session2 that records GP3 data to output file
    TimeNow=fix(clock);
    DT=[num2str(TimeNow(1)),'_',num2str(TimeNow(2)),'_',num2str(TimeNow(3)),...
        '_',num2str(TimeNow(4)),'-',num2str(TimeNow(5)),'-',num2str(TimeNow(6))];

    outputFileName = ['Test_',DT,'.csv'];
    % ExecuteRecordGP3Data(session1_client,outputFileName);
    % ExecuteRecordGP3Data(session1_client,outputFileName,'ENABLE_SEND_POG_BEST');
    ExecuteRecordGP3Data(session1_client,outputFileName,...
        'ENABLE_SEND_PUPIL_RIGHT','ENABLE_SEND_POG_BEST',...
        'ENABLE_SEND_POG_FIX','ENABLE_SEND_PUPIL_LEFT');
    %% Load Psychtoolbox Settings
    fprintf('\n>>Testing Eye Tracking:')
    sca; % close all; clearvars;
    PsychDefaultSetup(2);
    screens = Screen('Screens');        
    screenNumber = max(screens); % External if any
    [window, ~] = PsychImaging('OpenWindow', screenNumber, 0);
    MonitorMetaData=StartUpMonitor(screenNumber,window);
    SettingGazePoint(window,session1_client,MonitorMetaData);
    fprintf('tested\n')
    %% Stop collecting data in client2
    fprintf('Stop recording\n')
    SendMsgToGP3(session1_client,'STOP_EYETRACKER');
    %% Clean-up socket
    CleanUpSocket(session1_client);
    fclose all;
end