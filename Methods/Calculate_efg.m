%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/

function  H=Calculate_efg(XY)
% 计算拟合系数e,f和g;
n=length(XY);
M=[XY',ones(n,1)];
N=(-XY(1,:).^2-XY(2,:).^2)';
H=((M.'*M)\M.')*N;
end