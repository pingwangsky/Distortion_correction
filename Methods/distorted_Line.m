%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/

% ��δ�����ֱ�����ɻ����ֱ��
function Line=distorted_Line(XY,k1,cx,cy)   
    X=XY(1,:);
    Y=XY(2,:);
    x1=X-cx*ones(1,length(X));
    y1=Y-cy*ones(1,length(Y));
    r2=x1.^2+y1.^2;
    % �õ�����ͼ������
    x2=2*x1./(1+sqrt(1-4*k1*r2));
    y2=2*y1./(1+sqrt(1-4*k1*r2));
    % �õ�����ͼ������
    X_distorted = x2+cx*ones(1,length(x2)); % ��
    Y_distorted = y2+cy*ones(1,length(y2)); % ��
    noise=0;
    Line=[X_distorted+noise*randn(1,length(X_distorted));Y_distorted+noise*randn(1,length(Y_distorted))];     % �������
%     Line=[X_distorted;Y_distorted];     % δ�������
end