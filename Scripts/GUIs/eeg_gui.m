function Output=eeg_gui()
    %% Setup Data Variable
    global NeuroskyData
    Output=1;
    %% GUI
    ImGreen=imread('Figures\connected_v1.png');
    ImRed=imread('Figures\nosignal_v1.png');
    figure('Name','EEG ACQ','NumberTitle','off',...
            'Position',[435   345   220   200],'MenuBar','none','ToolBar','none')
    % Create push button
    Stopbtn = uicontrol('Style', 'togglebutton', 'String', 'STOP',...
            'Position', [70 170 50 20],'Min',0,'Max',1,'Value',1,'Callback','break');
    axes('Position',[0.3 0.11 0.38 0.4],'Units','normalized','XLim',[0.5 512.5],...
        'YLim',[0.5 512.5]);
    imshow(ImGreen); drawnow;
    while Output==1
        if Stopbtn.Value==0
            return;
        else
            fprintf('%i *\n',Stopbtn.Value);
            NeuroskyData.EEG=[NeuroskyData.EEG;rand];
        end
    end
%% Nested function
    function stopeeg(source,callbackdata)
%         NeuroskyData.Record=false;
%         NeuroskyData.Toff=cputime;
        fprintf('%i *\n',source.Value);
%         while Output==1
%             if source.Value==0
%                 break;
%                 
%             else
%                 fprintf('%i *\n',source.Value);
%                 NeuroskyData.EEG=[NeuroskyData.EEG;rand];
%             end
%         end
        imshow(ImRed);
        disp('EEG stopped');
    end
end