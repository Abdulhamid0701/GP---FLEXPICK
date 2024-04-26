function [theta1,theta2,theta3] = IKINEM(x,y,z)
%% Defining the robot kinematic constants & dimensions
%Some delta robot dimensions & constants
SP = 86.14;    % platform side length
SP = SP*0.5;
SB = 384.14;    % base  side length
L  = 230;    % driver link length
l  = 436;    % driven link length

wB = (SB*sqrt(3))/(6);
uB = (SB*sqrt(3))/(3);
wP = (SP*sqrt(3))/(6);
uP = (SP*sqrt(3))/(3);

a = wB-uP;
b = (SP-sqrt(3)*wB)/2;
c = wP-0.5*wB;

F  = 2*z*L;
% Getting theta 1:
    E_1 = 2*L*(y+a);
    G_1 = x*x + y*y + z*z + a*a + L*L + 2*y*a - l*l;
t_plus1 = (-F + sqrt(((E_1)^2)+((F)^2)-((G_1)^2)))/(G_1-E_1);
t_minus1 = (-F - sqrt(((E_1)^2)+((F)^2)-((G_1)^2)))/(G_1-E_1);
if (abs(t_plus1)>abs(t_minus1))
  t1=t_minus1;
else
  t1=t_plus1;
end
theta1 = 2*atan(t1);
%theta1 = -theta1+pi/2;
% Getting theta 2:
    E_2 = -L*(sqrt(3)*(x+b)+y+c);
    G_2 = x*x + y*y + z*z + b*b + c*c + L*L + 2*(x*b + y*c) - l*l;
t_plus2 = (-F + sqrt(((E_2)^2)+((F)^2)-((G_2)^2)))/(G_2-E_2);
t_minus2 = (-F - sqrt(((E_2)^2)+((F)^2)-((G_2)^2)))/(G_2-E_2);
if (abs(t_plus2)>abs(t_minus2))
  t2=t_minus2;
else
  t2=t_plus2;
end
theta2 = 2*atan(t2);
%%theta2 = -theta2 + pi/2;
% Getting theta 3:
    E_3 = L*(sqrt(3)*(x-b)-y-c);
    G_3 = x*x + y*y + z*z + b*b + c*c + L*L + 2*(-x*b + y*c) - l*l;
t_plus3 = (-F + sqrt(((E_3)^2)+((F)^2)-((G_3)^2)))/(G_3-E_3);
t_minus3 = (-F - sqrt(((E_3)^2)+((F)^2)-((G_3)^2)))/(G_3-E_3);
if (abs(t_plus3)>abs(t_minus3))
  t3=t_minus3;
else
  t3=t_plus3;
end
theta3 = 2*atan(t3);
%theta3 = -theta3 + pi/2;
end

