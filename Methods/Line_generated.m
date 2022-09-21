%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/

function  Line_undistorted=Line_generated(n)
% 产生n条没有畸变的直线
% n为直线的条数
    Line=cell(1,n);
    Line_undistorted=cell(1,n);
    i=1;
    while i<n+1
        %随机生成两个点
        P1=[xrand(1,1,[0,640]);xrand(1,1,[0,480])];
        P2=[xrand(1,1,[0,640]);xrand(1,1,[0,480])];
        % 两个点之间距离大于规定值;
        len=norm(P1-P2);
        if len>200 && norm(P2(1)-P1(1))>100 && norm(P2(2)-P1(2))>100
           Line{i}.XY=[P1,P2];
           i=i+1;
        end
    end
    for i=1:length(Line)
        XY=Line{i}.XY;
        P1=XY(:,1);
        P2=XY(:,2); 
%         line([P1(1),P2(1)],[P1(2),P2(2)],'color','m','LineWidth',2);
        % 计算直线参数
        x1=P1(1);
        y1=P1(2);
        x2=P2(1);
        y2=P2(2);
        K=(y2-y1)/(x2-x1);
        B=(x1*y2-x2*y1)/(x1-x2);
        if P1(1)<P2(1)
           x=P1(1):1:P2(1);
        else
           x=P1(1):-1:P2(1); 
        end    
        y=K*x+B*ones(1,length(x));
        % 未畸变的直线
        Line_undistorted{i}.XY=[x;y];
    %     plot(x,y,'r+');
    end    
end