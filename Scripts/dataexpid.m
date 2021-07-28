function ExpDataName=dataexpid(clock)
TimeNow=fix(clock);
DT=[num2str(TimeNow(1)),'_',num2str(TimeNow(2)),'_',num2str(TimeNow(3)),...
    '_',num2str(TimeNow(4)),'-',num2str(TimeNow(5))];
ExpDataName=['Data_',DT];