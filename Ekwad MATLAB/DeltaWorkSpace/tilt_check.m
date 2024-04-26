function betas = tilt_check(th1,th2,th3,x,y,z)
%% Define Maximum Tilt Angle 
max = deg2rad(30);
th1 = deg2rad(th1);
th2 = deg2rad(th2);
th3 = deg2rad(th3);
%% Unit Vectors 
constants;
u1 = [1 0 0];
u2 = [-0.5 0.5*sqrt(3) 0];
u3 = [-0.5 -0.5*sqrt(3) 0];
%% Direction of Passive Arms 
vec_l1 = double([x (y+L*cos(th1)+a) (z+L*sin(th1))]);
vec_l2 = double([(x - 0.5*sqrt(3)*L*cos(th2) + b) (y - 0.5*L*cos(th2) + c) (z + L*sin(th2))]);
vec_l3 = double([(x + 0.5*sqrt(3)*L*cos(th3) - b) (y - 0.5*L*cos(th3) + c) (z + L*sin(th3))]);
%% Getting the Unit Vectors of the Driven Links (l):
unitVect_l1 = vec_l1 / norm(vec_l1);
unitVect_l2 = vec_l2 / norm(vec_l2);
unitVect_l3 = vec_l3 / norm(vec_l3);
%% Getting the Tilt Angles
beta1 = 0.5 * pi - acos(abs(dot(u1, unitVect_l1)));
beta2 = 0.5 * pi - acos(abs(dot(u2, unitVect_l2)));
beta3 = 0.5 * pi - acos(abs(dot(u3, unitVect_l3)));
%% Check Tilt Angle Condition 
if ( beta1>max || beta2>max || beta3>max)
    betas = 0;
else 
    betas = 1;
end 
