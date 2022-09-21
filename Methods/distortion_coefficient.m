%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/

function [Cx,Cy,lam]=distortion_coefficient(XY1,XY2,accurate,Cx)
    % ���ϵ������
    H1=Calculate_efg(XY1);
    H2=Calculate_efg(XY2);
    
    % ����h1��h2
    H_temp=H1-H2;
    h1=-H_temp(1)/H_temp(2);
    h2=-H_temp(3)/H_temp(2);
    
%     % ������������
%     accurate=0.01;
    % �ɾ��ȵõ���Ҫ�����Ĵ���
    N=ceil(log10((1/accurate)))+1;    %����ȡ��
    % ��ʼ������Χ,����ͼ���С��h1,h2��ȷ��
%     Cx=128;
    LU=[Cx-50,Cx+50];
    for i=1:N
        beta=10/10^i;
        x0_best=get_best_x0(XY1,XY2,LU,beta,[H1,H2],h1,h2);
        LU=[x0_best-10/10^i,x0_best+10/10^i];
    end
    x0=x0_best;
    y0=h1*x0+h2;
    lam=0.5*(1/(x0^2+y0^2+x0*H1(1)+y0*H1(2)+H1(3))+1/(x0^2+y0^2+x0*H2(1)+y0*H2(2)+H2(3)));
    Cx=x0;
    Cy=y0;
end