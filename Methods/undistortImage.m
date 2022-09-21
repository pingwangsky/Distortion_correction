%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/
function undistorted_img= undistortImage(Img, Cx,Cy, lam)
    % 从非畸变往畸变映射，这样才能保证正确
    % 采用得到的参数矫正畸变图像
    [height,width,~]=size(Img);
    undistorted_img=uint8(zeros(height,width,3));

    for y=1:height
        for x=1:width
            %中心化并得到畸变图像坐标
            x1=x-Cx;
            y1=y-Cy;
            r2=x1^2+y1^2;


            x2=2*x1/(1+sqrt(1-4*lam*r2));
            y2=2*y1/(1+sqrt(1-4*lam*r2));

            x_distorted=x2+Cx;
            y_distorted=y2+Cy;

            % 找到了畸变图像对应的正常图像点,使用最近临插值法
            if(x_distorted >1 && y_distorted>1 && x_distorted <width && y_distorted<height) %防止越界
%                 round(y_distorted)
               undistorted_img(y,x,1)=Img(round(y_distorted),round(x_distorted),1); 
               undistorted_img(y,x,2)=Img(round(y_distorted),round(x_distorted),2); 
               undistorted_img(y,x,3)=Img(round(y_distorted),round(x_distorted),3); 
            else
               undistorted_img(y,x) =0;
            end
        end
    end
end