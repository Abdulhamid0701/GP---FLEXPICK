clc;clear;
%% Define circular trajectory parameters
radius = 180; % Radius of the circle
center = [0, 0, -250]; % Center of the circle
duration = 5; % Duration of the motion

%% Generate circular trajectory
theta = linspace(0, 4*pi, 1000);
X = center(1) + radius * cos(theta);
Y = center(2) + radius * sin(theta);
Z = center(3) * ones(size(X));

%% Define simulation sample time and duration
duration = 9;
T_sample = 0.1;
end_time = duration/T_sample;
time = 0:T_sample:duration;

%% Perform CSPI on XYZs
cs_th1 = spline(1:numel(X), X);
cs_th2 = spline(1:numel(Y), Y);
cs_th3 = spline(1:numel(Z), Z);

Xvals = ppval(cs_th1, linspace(1, numel(X), numel(time)));
Yvals = ppval(cs_th2, linspace(1, numel(Y), numel(time)));
Zvals = ppval(cs_th3, linspace(1, numel(Z), numel(time)));

%% Save results as a timeseries to be used by simulink 
ts_X = timeseries(Xvals',time);
ts_Y = timeseries(Yvals',time);
ts_Z = timeseries(Zvals',time);
