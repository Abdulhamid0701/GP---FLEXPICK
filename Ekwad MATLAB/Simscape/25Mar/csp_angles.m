clc;clear
%% Define end effector's array of coordinates 
X = [0 -180 -180 -180 180 180 180 180 0];
Y = zeros(1,9);
Z = [-350 -350 -350 -350 -350 -350 -350 -350 -350];

%% Use IK to generate array of thetas
for i= 1:1:numel(X)
    [theta1(i),theta2(i),theta3(i)] = IKINEM(X(i),Y(i),Z(i));
end 

%% Use CSP to interpolate between generated angles with T_sample
duration = 9; % Duration of the motion
T_sample = 0.1;
end_time = duration/T_sample;
% time = linspace(0, duration, end_time);
time = 0:T_sample:duration;
tii = 1:T_sample:duration;

cs_th1 = spline(1:numel(theta1), theta1);
cs_th2 = spline(1:numel(theta1), theta2);
cs_th3 = spline(1:numel(theta1), theta3);

th1.time = time;
th2.time = time;
th3.time = time;

th1.values = ppval(cs_th1, linspace(1, numel(theta1), numel(time)));
th2.values = ppval(cs_th2, linspace(1, numel(theta2), numel(time)));
th3.values = ppval(cs_th3, linspace(1, numel(theta3), numel(time)));

ts_th1 = timeseries(th1.values',th1.time);
ts_th2 = timeseries(th2.values',th2.time);
ts_th3 = timeseries(th3.values',th3.time);

for i= 1:1:numel(time)-1
    [XX(i),YY(i),ZZ(i)] = FKINEM(th1.values(i),th2.values(i),th3.values(i));
end 