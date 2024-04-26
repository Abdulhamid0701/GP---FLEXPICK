clc;clear;

X_cycle = [  0  -180 -180 -180  -90   0   90 180  180  180  180  0];
Y_cycle = zeros(1,12);
Z_cycle = [-300 -300 -400 -300 -300 -300 -300 -300 -300 -400 -300 -300];

X_meshwar = zeros(1,2);
Y_meshwar = zeros(1,2);
Z_meshwar = zeros(1,2);

time_mashaweer = [1 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 1];

time_meshwar_tot = 0;
time_cycle_total = sum(time_mashaweer);
T_sample = 0.1;
time = 0:T_sample:time_cycle_total;

index_last = 1;
index_next = 0;

for (i = 1:1:numel(X_cycle) - 1)
    X_meshwar = [X_cycle(i) X_cycle(i+1)];
    Y_meshwar = [Y_cycle(i) Y_cycle(i+1)];
    Z_meshwar = [Z_cycle(i) Z_cycle(i+1)];


    cs_x = spline(1:numel(X_meshwar), X_meshwar);
    cs_y = spline(1:numel(Y_meshwar), Y_meshwar);
    cs_z = spline(1:numel(Z_meshwar), Z_meshwar);

    time_meshwar_tot = time_mashaweer(i);
    time_meshwar_arr = 0:T_sample:time_meshwar_tot;

    index_next = index_last + numel(time_meshwar_arr) - 1;

    Xvals(index_last : index_next) = ppval(cs_x, linspace(1, numel(X_meshwar), numel(time_meshwar_arr)));
    Yvals(index_last : index_next) = ppval(cs_y, linspace(1, numel(Y_meshwar), numel(time_meshwar_arr)));
    Zvals(index_last : index_next) = ppval(cs_z, linspace(1, numel(Z_meshwar), numel(time_meshwar_arr)));
    
    index_last = index_next;
end
% Save results as a timeseries to be used by simulink 
ts_X = timeseries(Xvals',time);
ts_Y = timeseries(Yvals',time);
ts_Z = timeseries(Zvals',time);


