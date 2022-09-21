%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/
function y= xrand(m,n,r)
%function description:
%������Χ��r(1)��r(2)֮���m�У�n�е������;
%generate random numbers ranging from r(1) to r(2);
y= r(1)+rand(m,n)*(r(2)-r(1));

return