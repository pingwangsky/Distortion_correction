%******************************************************************************
% This programe is implemented via MATLAB 2018b.                             *
% Author :  Ping Wang                                                        *
% Contact:  pingwangsky@163.com                                              *
% License:  Copyright (c) 2022 Ping Wang, All rights reserved.               *
% Address:  College of Electrical and Information Engineering,               *
%           Lanzhou University of Technology                                 *
% My site:  https://sites.google.com/view/ping-wang-homepage                 *
%*****************************************************************************/
function x0_best=get_best_x0(XY1,XY2,LU,beta,H,h1,h2)
    % 选取最优的x0
    lower=LU(1);
    upper=LU(2);
    x0_domain=lower:beta:upper;
    error_min=Inf;
    for i=1:length(x0_domain)
        error=error_calculate(XY1,XY2,x0_domain(i),H,h1,h2);
         if error<error_min
            error_min=error;
            x0_best=x0_domain(i);
         end
    end
end