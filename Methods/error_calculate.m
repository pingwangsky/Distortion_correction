%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/

function error=error_calculate(XY1,XY2,x0,H,h1,h2) 
% 计算误差
    % 计算y0
    y0=h1*x0+h2;
    % 计算lam
%     lam=0;
%     for i=1:2
%         e=H(1,i);
%         f=H(2,i);
%         g=H(3,i);
%         lam=lam+1/(x0^2+y0^2+x0*e+y0*f+g);
%     end
%     lam=0.5*lam;
    lam=0.5*(1/(x0^2+y0^2+x0*H(1,1)+y0*H(2,1)+H(3,1))+1/(x0^2+y0^2+x0*H(1,2)+y0*H(2,2)+H(3,2)));
    % 利用x0,y0和lam将畸变图像转换到非畸变图像并计算误差
%     Line_u=cell(1,length(Line_distorted));
%     error=0;
%     for i=1:length(Line_distorted)
    XY_temp1=undistorted_Line(XY1,x0,y0,lam);
    XY_temp2=undistorted_Line(XY2,x0,y0,lam);
    X1=1:1:length(XY_temp1);
    D1=Calculate_D(X1,XY_temp1(1,:));
    D2=Calculate_D(X1,XY_temp1(2,:));
    X2=1:1:length(XY_temp2);
    D3=Calculate_D(X2,XY_temp2(1,:));
    D4=Calculate_D(X2,XY_temp2(2,:));
    
    e1=sum((D1(1)*X1+D1(2)-XY_temp1(1,:)).^2);
    e2=sum((D2(1)*X1+D2(2)-XY_temp1(2,:)).^2);
    e3=sum((D3(1)*X2+D3(2)-XY_temp2(1,:)).^2);
    e4=sum((D4(1)*X2+D4(2)-XY_temp2(2,:)).^2);
    error=e1+e2+e3+e4;
%     end   
end