%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/
close all;
clc;
clear;
addpath methods;

% ��������ֱ��
n=2;    %ֱ������
Line_undistorted=Line_generated(n);

path_name='.\methods\';  %���ݱ���·��
file_name='Line_undistorted.mat';   %�����ļ�����
save([path_name,file_name],'Line_undistorted');

Line=load('.\methods\Line_undistorted.mat');

Line_undistorted=Line.Line_undistorted;

% ����ͼ��,����ʾֱ��
Img=ones(480,640)*255;
figure(1);
imshow(Img);
hold on;
title('����ֱ��ͼ��');
for i=1:length(Line_undistorted)
    XY=Line_undistorted{i}.XY;
    plot(XY(1,:),XY(2,:),'color','m','LineWidth',2);
end

% ���ɻ���ֱ��
% �������
lam=-5*10^(-6);
cx=311.05;
cy=240.02;

figure(2);
imshow(Img);
hold on;

Line_distorted=cell(1,length(Line_undistorted));
for i=1:length(Line_undistorted)
    Line_distorted{i}.XY=distorted_Line(Line_undistorted{i}.XY,lam,cx,cy);
    plot(Line_distorted{i}.XY(1,:),Line_distorted{i}.XY(2,:),'r-','LineWidth',2);   %��ʾ����ֱ��
end

XY1=Line_distorted{1}.XY;
XY2=Line_distorted{2}.XY;

H=zeros(3,2);
% ���ϵ������
H1=Calculate_efg(XY1);
H2=Calculate_efg(XY2);

% ����h1��h2
H_temp=H1-H2;
h1=-H_temp(1)/H_temp(2);
h2=-H_temp(3)/H_temp(2);

% ������������
accurate=0.01;
% �ɾ��ȵõ���Ҫ�����Ĵ���
N=ceil(log10((1/accurate)))+1;    %����ȡ��
% ��ʼ������Χ,����ͼ���С��h1,h2��ȷ��
Cx=320;
LU=[Cx-30,Cx+30];
for i=1:N
    beta=10/10^i;
    x0_best=get_best_x0(XY1,XY2,LU,beta,[H1,H2],h1,h2);
    LU=[x0_best-10/10^i,x0_best+10/10^i];
end
x0_best
% ͨ����������ָ�����ֱ��ͼ��
% �õ�x0_best�Ժ����lam
x0=x0_best;
y0=h1*x0+h2;
lam=0.5*(1/(x0^2+y0^2+x0*H1(1)+y0*H1(2)+H1(3))+1/(x0^2+y0^2+x0*H2(1)+y0*H2(2)+H2(3)));
XY1=undistorted_Line(XY1,x0,y0,lam); 
XY2=undistorted_Line(XY2,x0,y0,lam);
plot(XY1(1,:),XY1(2,:),'c-','LineWidth',2);   %��ʾ������ֱ��
plot(XY2(1,:),XY2(2,:),'y-','LineWidth',2);   %��ʾ������ֱ��
title('����ͽ�����ֱ��')




















