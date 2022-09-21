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
        idx=randperm(number,3); %�������������
        sample=XY1(:,idx);  %ȡ������������
        H=Calculate_efg(sample);    %����ȡ�������ϵ��e,f��g

        % ��ÿ���㵽��Ϸ��̵����
        for i=1:number
            xd=XY1(1,i);
            yd=XY1(2,i);
            mask(i)=(xd^2+yd^2+xd*H(1)+yd*H(2)+H(3))^2;    
        end
        total=sum(mask<sigma);
        if total>pretotal            %�ҵ�������Ϸ����������ķ���
           pretotal=total;
           bestH=H;          %�ҵ���õ���ϱ�Ե
        end  
    end

    % ȡ�����������ϵ�����
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