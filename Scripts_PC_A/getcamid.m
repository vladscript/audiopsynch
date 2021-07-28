function Camera=getcamid()
fprintf('\n>Loading Camera:')
CAM=readtable('CamSetts.csv');
CamName=CAM.Camera{1};
Resolution=CAM.Resolution{1};
Camera=webcam(CamName);
Camera.Resolution=Resolution;
fprintf('done.\n')