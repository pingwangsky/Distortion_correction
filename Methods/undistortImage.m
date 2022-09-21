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
    % �ӷǻ���������ӳ�䣬�������ܱ�֤��ȷ
    % ���õõ��Ĳ�����������ͼ��
    [height,width,~]=size(Img);
    undistorted_img=uint8(zeros(height,width,3));

    for y=1:height
        for x=1:width
            %���Ļ����õ�����ͼ������
            x1=x-Cx;
            y1=y-Cy;
            r2=x1^2+y1^2;


            x2=2*x1/(1+sqrt(1-4*lam*r2));
            y2=2*y1/(1+sqrt(1-4*lam*r2));

            x_distorted=x2+Cx;
            y_distorted=y2+Cy;

            % �ҵ��˻���ͼ���Ӧ������ͼ���,ʹ������ٲ�ֵ��
            if(x_distorted >1 && y_distorted>1 && x_distorted <width && y_distorted<height) %��ֹԽ��
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