%% Intelligent Gripper Project | Scenario Analysis Main Program 
% Last Updated on: 17/12/2023 by: Abdelhamid 
clc; clear;
P = readtable('Scenarios.xlsx');

%% Calculate thetas for different positions for the report inputs table  
% for i=1:1:9
%     x = P.X(i);
%     y = P.Y(i);
%     z = P.Z(i);
%     [t1,t2,t3] = get_thetas(x,y,z);
%     P.t1(i) = rad2deg(t1);
%     P.t2(i) = rad2deg(t2);
%     P.t3(i) = rad2deg(t3);
% end 
% %% Start Point A, End all other possibilities 
X_init = P.X(1);
Y_init = P.Y(1);
Z_init = P.Z(1);

for i = 2:1:9 %loop on each end point possibility 
    X_pos = P.X(i);
    Y_pos = P.Y(i);
    Z_pos = P.Z(i);
    %run the simulation program 
    sim("Scenario_Analysis_Simu.slx");
    omega1_max(i) = max(abs(ans.q1_dot));
    omega2_max(i) = max(abs(ans.q2_dot));
    omega3_max(i) = max(abs(ans.q3_dot));

    alpha1_max(i) = max(abs(ans.q1_dot_dot));
    alpha2_max(i) = max((ans.q2_dot_dot));
    alpha3_max(i) = max((ans.q3_dot_dot));
end 
omega1_max = omega1_max';
omega2_max = omega2_max';
omega3_max = omega3_max';

alpha1_max = alpha1_max';
alpha2_max = alpha2_max';
alpha3_max = alpha3_max';

%% Start Point E, End all other possibilities 

% X_init = P.X(4);
% 
% Y_init = P.Y(4);
% Z_init = P.Z(4);
% 
% for i = 1:1:3 %loop on each end point possibility 
%     X_pos = P.X(i);
%     Y_pos = P.Y(i);
%     Z_pos = P.Z(i);
%     %run the simulation program 
%     sim("Scenario_Analysis_Simu.slx");
%     omega1_max(i) = max(abs(ans.q1_dot));
%     omega2_max(i) = max(abs(ans.q2_dot));
%     omega3_max(i) = max(abs(ans.q3_dot));
% 
%     alpha1_max(i) = max(abs(ans.q1_dot_dot));
%     alpha2_max(i) = max((ans.q2_dot_dot));
%     alpha3_max(i) = max((ans.q3_dot_dot));
% end 
% 
% for i = 5:1:9 %loop on each end point possibility 
%     X_pos = P.X(i);
%     Y_pos = P.Y(i);
%     Z_pos = P.Z(i);
%     %run the simulation program 
%     sim("Scenario_Analysis_Simu.slx");
%     omega1_max(i) = max(abs(ans.q1_dot));
%     omega2_max(i) = max(abs(ans.q2_dot));
%     omega3_max(i) = max(abs(ans.q3_dot));
% 
%     alpha1_max(i) = max(abs(ans.q1_dot_dot));
%     alpha2_max(i) = max((ans.q2_dot_dot));
%     alpha3_max(i) = max((ans.q3_dot_dot));
% end 
% omega1_max = omega1_max';
% omega2_max = omega2_max';
% omega3_max = omega3_max';
% 
% alpha1_max = alpha1_max';
% alpha2_max = alpha2_max';
% alpha3_max = alpha3_max';

%% Startin Point H 
% %% Start Point E, End all other possibilities 
% X_init = P.X(7);
% Y_init = P.Y(7);
% Z_init = P.Z(7);
% 
% for i = 1:1:6 %loop on each end point possibility 
%     X_pos = P.X(i);
%     Y_pos = P.Y(i);
%     Z_pos = P.Z(i);
%     %run the simulation program 
%     sim("Scenario_Analysis_Simu.slx");
%     omega1_max(i) = max(abs(ans.q1_dot));
%     omega2_max(i) = max(abs(ans.q2_dot));
%     omega3_max(i) = max(abs(ans.q3_dot));
% 
%     alpha1_max(i) = max(abs(ans.q1_dot_dot));
%     alpha2_max(i) = max((ans.q2_dot_dot));
%     alpha3_max(i) = max((ans.q3_dot_dot));
% end 
% 
% for i = 8:1:9 %loop on each end point possibility 
%     X_pos = P.X(i);
%     Y_pos = P.Y(i);
%     Z_pos = P.Z(i);
%     %run the simulation program 
%     sim("Scenario_Analysis_Simu.slx");
%     omega1_max(i) = max(abs(ans.q1_dot));
%     omega2_max(i) = max(abs(ans.q2_dot));
%     omega3_max(i) = max(abs(ans.q3_dot));
% 
%     alpha1_max(i) = max(abs(ans.q1_dot_dot));
%     alpha2_max(i) = max((ans.q2_dot_dot));
%     alpha3_max(i) = max((ans.q3_dot_dot));
% end 
% omega1_max = omega1_max';
% omega2_max = omega2_max';
% omega3_max = omega3_max';
% 
% alpha1_max = alpha1_max';
% alpha2_max = alpha2_max';
% alpha3_max = alpha3_max';