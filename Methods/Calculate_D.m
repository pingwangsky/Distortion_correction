%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/

function D=Calculate_D(X,Y)
%����ֱ��ϵ��
% XΪ����
      M=[X',ones(length(Y),1)];
      N=Y';
    D=((M.'*M)\M.')*N;
end