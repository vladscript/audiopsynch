%% SETUP NEUROSKY #################################################
% For Windows:
% Go to Bluetooth Settings and find  More Bluetooth options link
% Set the COMX number for the MindWave Mobile 'Dev A'
COMportNumber=4;
comPortName1 = sprintf('\\\\.\\COM%d', COMportNumber);
% Baud rate for use with TG_Connect() and TG_SetBaudrate().
TG_BAUD_57600 =      57600;
% TG_BAUD_1200         1200
% TG_BAUD_2400         2400
% TG_BAUD_4800         4800
% TG_BAUD_9600         9600
% TG_BAUD_57600       57600
% TG_BAUD_115200     115200
% Data format for use with TG_Connect() and TG_SetDataFormat().
TG_STREAM_PACKETS =  0;
% TG_STREAM_PACKETS      0
% TG_STREAM_5VRAW        1
% TG_STREAM_FILE_PACKETS 2

% Data type that can be requested from TG_GetValue().
TG_DATA_RAW =         4;
% TG_DATA_BATTERY             0
% TG_DATA_POOR_SIGNAL         1
% TG_DATA_ATTENTION           2
% TG_DATA_MEDITATION          3
% TG_DATA_RAW                 4
% TG_DATA_DELTA               5
% TG_DATA_THETA               6
% TG_DATA_ALPHA1              7
% TG_DATA_ALPHA2              8
% TG_DATA_BETA1               9
% TG_DATA_BETA2              10
% TG_DATA_GAMMA1             11
% TG_DATA_GAMMA2             12
% TG_DATA_BLINK_STRENGTH     37

