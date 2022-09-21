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
addpath data;
addpath Methods;

Img=imread('input_6.jpeg');

figure(1);
hold on;
imshow(Img)

Img1=rgb2gray(Img);
contour=edge(Img1,'Canny'); %canny边缘检测

figure(2);
imshow(contour,'Border','tight');
hold on;

% 获取联通轮廓
[B,L]=bwboundaries(contour,'noholes');

% 边缘长度小于200的过滤掉
j=1;
for k=1:length(B)
    if length(B{k})>500 && length(B{k})<700
        BB{j,:}=B{k};
        j=j+1;
    end 
end


for i=1:length(BB)
    boundary=BB{i};
    plot(boundary(:,2),boundary(:,1),'r-');
end
boundary1=BB{39}(1:330,:)';
% plot(boundary1(60:250,2),boundary1(60:250,1),'r-');
plot(boundary1(2,:),boundary1(1,:),'b-','LineWidth',8);
% 
boundary2=BB{33}(1:230,:)';
% plot(boundary1(60:250,2),boundary1(60:250,1),'r-');
plot(boundary2(2,:),boundary2(1,:),'b-','LineWidth',8);
% 
% %利用两条直线进行畸变系数矫正
XY1=[boundary1(2,:);boundary1(1,:)];
XY2=[boundary2(2,:);boundary2(1,:)];
% % XY1=[boundary1(1,:);boundary1(2,:)];
% % XY2=[boundary2(1,:);boundary2(2,:)];
% % plot(XY1(1,:),XY1(2,:),'b-','LineWidth',2);
% % plot(XY2(1,:),XY2(2,:),'b-','LineWidth',2);

[~,width,~]=size(Img);
Cx=round(0.5*width);
accurate=0.01;      %精度设置
[Cx,Cy,lam]=distortion_coefficient(XY1,XY2,accurate,Cx)

% % 矫正直线
XY_u1=undistorted_Line(XY1,Cx,Cy,lam); 
XY_u2=undistorted_Line(XY2,Cx,Cy,lam); 

undistorted_img= undistortImage(Img, Cx,Cy, lam);

figure(4);
imshow(undistorted_img,'Border','tight');
hold on;
plot(XY_u1(1,:),XY_u1(2,:),'g-','LineWidth',8);
plot(XY_u2(1,:),XY_u2(2,:),'g-','LineWidth',8);