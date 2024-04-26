clc;clear;
duration = 9; % Duration of the motion
T_sample = 0.1;
end_time = duration/T_sample;
time = linspace(0, duration, end_time);

%% Define end effector's array of coordinates 
X = [0 -180 -180 -180 180 180 180 180 0];
Y = zeros(1,9);
Z = [-300 -300 -400 -300 -300 -300 -400 -300 -300];

%% Perform cublic spline interpolation to smoothen out linear transitions of end effector
cs_x = spline(1:numel(X), X);
cs_y = spline(1:numel(X), Y);
cs_z = spline(1:numel(X), Z);
 
xx = ppval(cs_x, linspace(1, numel(X), numel(time)));
yy = ppval(cs_y, linspace(1, numel(Y), numel(time)));
zz = ppval(cs_z, linspace(1, numel(Z), numel(time)));

f1 = figure;
sgtitle("Cubic Spline Poly. Interpolation for End Effector Positions in mm");
subplot(3,1,1)
plot(xx)
grid on
subplot(3,1,2)
plot(time,yy)
grid on 
subplot(3,1,3)
plot(time,zz)
grid on 


%% Using inverse kinematics to find equivelant angular positions
for i= 1:1:end_time
    [theta1(i),theta2(i),theta3(i)] = IKINEM(xx(i),yy(i),zz(i));
end 

f2 = figure;
sgtitle("Cubic Spline Poly. Interpolation for Actuator Angular Positions in Radians");
subplot(3,1,1)
plot(theta1)
grid on
subplot(3,1,2)
plot(theta2)
grid on 
subplot(3,1,3)
plot(theta3)
grid on 


% 
% current_pos = [200,0,-300];
% next_pos = [-200,0,-300];
% delta_t = 4;
% simOut = sim("Delta_Inshallah_15RAMADAN.slx", 'StopTime', num2str(4));
% %sim("Delta_Inshallah_15RAMADAN.slx")
% % open("Delta_Inshallah_15RAMADAN.slx")
% 
% % current_pos = [-180,0,-300];
% % next_pos = [-180,0,-400];
% % delta_t = 2;
% % sim("Delta_Inshallah_15RAMADAN.slx")
% % 
% % current_pos = [-180,0,-400];
% % next_pos = [-180,0,-300];
% % delta_t = 2;
% % sim("Delta_Inshallah_15RAMADAN.slx")
