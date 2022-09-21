%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/
function inliers=ransac_inliers(XY1,sigma)
%     sigma=20;
    pretotal=0;
    number=length(XY1);
    iter=300;

    for j=1:iter
        idx=randperm(number,3); %随机生成三个点
        sample=XY1(:,idx);  %取样三个点数据
        H=Calculate_efg(sample);    %利用取样点计算系数e,f和g

        % 求每个点到拟合方程的误差
        for i=1:number
            xd=XY1(1,i);
            yd=XY1(2,i);
            mask(i)=(xd^2+yd^2+xd*H(1)+yd*H(2)+H(3))^2;    
        end
        total=sum(mask<sigma);
        if total>pretotal            %找到符合拟合方程数据最多的方程
           pretotal=total;
           bestH=H;          %找到最好的拟合边缘
        end  
    end

    % 取出符合最佳拟合的数据
    mask=zeros(1,number);
    for i=1:number
        xd=XY1(1,i);
        yd=XY1(2,i);
        error=(xd^2+yd^2+xd*bestH(1)+yd*bestH(2)+bestH(3))^2; 
        if error<sigma
            mask(i)=1;
        end
    end
    k=1;
    for i=1:length(mask)
        if mask(i)
            inliers(:,k)=XY1(:,i);
            k=k+1;
        end
    end
end