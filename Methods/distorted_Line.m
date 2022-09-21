%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/

% 从未畸变的直线生成畸变的直线
function Line=distorted_Line(XY,k1,cx,cy)   
    X=XY(1,:);
    Y=XY(2,:);
    x1=X-cx*ones(1,length(X));
    y1=Y-cy*ones(1,length(Y));
    r2=x1.^2+y1.^2;
    % 得到畸变图像坐标
    x2=2*x1./(1+sqrt(1-4*k1*r2));
    y2=2*y1./(1+sqrt(1-4*k1*r2));
    % 得到畸变图像坐标
    X_distorted = x2+cx*ones(1,length(x2)); % 列
    Y_distorted = y2+cy*ones(1,length(y2)); % 行
    noise=0;
    Line=[X_distorted+noise*randn(1,length(X_distorted));Y_distorted+noise*randn(1,length(Y_distorted))];     % 添加噪声
%     Line=[X_distorted;Y_distorted];     % 未添加噪声
end