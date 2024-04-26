clc;
clear; 

X_init = 0;
Y_init = -180;
Z_init = -300;

X_next = 0;
Y_next = 180;
Z_next = -300;

[th1_i,th2_i,th3_i] = IKINEM(X_init,Y_init,Z_init);
[th1_n,th2_n,th3_n] = IKINEM(X_next,Y_next,Z_next);

duration = 2;

meshwar_th1 = th1_n - th1_i;
meshwar_th2 = th2_n - th2_i;
meshwar_th3 = th3_n - th3_i;

time = 0:0.001:duration;

alpha1 = 2*(meshwar_th1/2)/((duration/2)^2);
alpha2 = 2*(meshwar_th2/2)/((duration/2)^2);
alpha3 = 2*(meshwar_th3/2)/((duration/2)^2);

omega1 = zeros(1,numel(time));
omega1max = 0;

omega2 = zeros(1,numel(time));
omega2max = 0;

omega3 = zeros(1,numel(time));
omega3max = 0;

for i = 1:1: (duration*1000)+1
    t = time(i);
    if (t<=(duration/2))
        omega1(i) = alpha1*t;
        omega1max = omega1(i);

        omega2(i) = alpha2*t;
        omega2max = omega2(i);

        omega3(i) = alpha3*t;
        omega3max = omega3(i);
    else
        t_dec = t - (0.5)*duration;
        omega1(i) = omega1max - alpha1*t_dec;
        omega2(i) = omega2max - alpha2*t_dec;
        omega3(i) = omega3max - alpha3*t_dec; 
    end
end 

rpm1 = omega1*30/pi;
rpm2 = omega2*30/pi;
rpm3 = omega3*30/pi;

figure;
hold on
plot(time,omega1,"LineWidth",1.3)
plot(time,omega2,"LineWidth",1.3)
plot(time,omega3,"LineWidth",1.3)
ylabel("Angular Velocity $[Rad/s]$","FontSize",12,"Interpreter","Latex");
xlabel("Time $[s]$","FontSize",12,"Interpreter","Latex")
legend("Motor 1","Motor 2","Motor 3","FontSize",14,"Interpreter","Latex")
title("FlexPick Project $|$ Stepper motors trapezoidal velocity profiles","FontSize",16,"Interpreter","Latex")
plot_darkmode
grid on

