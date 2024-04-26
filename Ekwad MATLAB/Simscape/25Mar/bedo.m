clc
clear
Q = 0:0.001:(300/3600);

Dd = 0.24765;
g = 9.81;
rho = 1000;
Pd = 250000;

last = numel(Q)*10 ;

%H_tot = zeros(1,301);

for (i = 1:1:84)
    H_tot(i) = 23 + 4 + (Pd/(rho*g)) + 0.015*((((Q(i))^2)/(2*g))* ((4/(pi*Dd*Dd))^2)*((51/Dd)+228));
    Q_m3hr(i) = Q(i)*3600;
end


hold on
plot(Q_m3hr,H_tot,"LineWidth",1.3)
ylabel("H $[m]$","FontSize",14,"Interpreter","Latex");
xlabel("Q $[m^3/hr]$","FontSize",14,"Interpreter","Latex")
title("H-Q Curve of Piping System","FontSize",16,"Interpreter","Latex")
%plot_darkmode
grid on