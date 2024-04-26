clear
clc
X_current = -200;
X_next = 200;
X_int = 0.1*abs(X_next - X_current);
X_dummy = X_current - X_int;

for (i = 1:1:11)
    X_3ars(i) = X_dummy + X_int;
    X_dummy = X_3ars(i);
end 

Y = zeros(1,numel(X_3ars));
Z = -400*ones(1,numel(X_3ars));

time_3ars = [0 0.1 0.15 0.20 0.25 0.30 0.35 0.4 0.45 0.5 0.6];

for (i = 1:1:numel(X_3ars))
    [th1(i),th2(i),th3(i)] = IKINEM(X_3ars(i),Y(i),Z(i));
end 

time = 0:0.1:0.6;

cs_th1 = spline(time_3ars,th1);
cs_th2 = spline(time_3ars,th2);
cs_th3 = spline(time_3ars,th3);

th1vals = ppval(cs_th1, time);
th2vals = ppval(cs_th2, time);
th3vals = ppval(cs_th3, time);

ts_th1 = timeseries(th1vals',time);
ts_th2 = timeseries(th2vals',time);
ts_th3 = timeseries(th3vals',time);

for (i = 1:1:numel(th1vals))
[x(i),y(i),z(i)] = FKINEM(th1vals(i),th2vals(i),th3vals(i));
end