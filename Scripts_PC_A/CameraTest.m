%% Setting Camera test
CAM=readtable('CamSetts.csv');
CamName=CAM.Camera{1};
Resolution=CAM.Resolution{1};
clear CAM;
%% Is connected:
ListCams=webcamlist;
if sum(strcmp(ListCams,CamName))>0
    fprintf('\n>Camera: %s found with %s resolution.\n',CamName,Resolution)
    % Preview
    Camera=webcam(CamName);
    Camera.Resolution=Resolution;
    CAMs=true;
    preview(Camera)
    n=0;
    while n<=10
        pause(1)
        n=n+1;
    end
    closePreview(Camera)
%     clear('Props')
else
    fprintf('\n>Camera: %s NOT found.',CamName)
    if numel(ListCams)>0
        fprintf('\n>Run CameraFinder to setup an select:')
        for n=1:numel(ListCams)
            fprintf('%s\n',ListCams{n});
        end
    else
        fprintf('\n>No Cameras found.')
    end
end
