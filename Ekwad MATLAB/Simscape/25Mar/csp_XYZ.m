clc;clear;

%% Generate XYZ position arrays
X = [0 -180 -180 -180 180 180 180 180 0];
Y = zeros(1,9);
Z = [-300 -300 -400 -300 -300 -300 -400 -300 -300];

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
