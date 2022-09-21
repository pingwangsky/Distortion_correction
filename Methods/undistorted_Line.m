%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/
function Line_u=undistorted_Line(XY_d,x0,y0,lam)
% ���ò���������Ļָ���δ�����ֱ��
    X_d=XY_d(1,:);
    Y_d=XY_d(2,:);
    x1=X_d-x0*ones(1,length(X_d));
    y1=Y_d-y0*ones(1,length(Y_d));
    r2=x1.^2+y1.^2;
    % �õ��ǻ���ͼ��
    x2=x1./(1+lam*r2);
    y2=y1./(1+lam*r2);
    X_u=x2+x0*ones(1,length(x2));
    Y_u=y2+y0*ones(1,length(y2));
    Line_u=[X_u;Y_u];
end