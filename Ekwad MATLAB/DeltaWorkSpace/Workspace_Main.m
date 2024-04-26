%% IntelligentPick Project | Delta Robot Workspace Formulation Program 
% Main program 
% Last update: 3/2/2024 
%                            
%                         |||| ||||
%                             |
%                             |
%                        |         |
%                         |       |
%                          |||||||

theta_min = -70; theta_max = 70;
n = 1;
h = 7; % Step size of angle increments 
A = zeros((140/h)^3, 3);
for th1 = theta_min: h : theta_max
    for th2 = theta_min : h : theta_max
        for th3 = theta_min : h : theta_max
            [X, Y, Z] = get_coords(th1, th2, th3);
            betas = tilt_check(th1,th2,th3,X,Y,Z);
            if (betas == 1)
               A(n, 1) = X;
               A(n, 2) = Y;
               A(n, 3) = Z;
               n = n+1;
            else 
               %disp("ana hena");
            end 
         end
    end
end
GrafSpace(A, n);
