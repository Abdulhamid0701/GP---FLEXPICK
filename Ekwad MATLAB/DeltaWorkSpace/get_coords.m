%% Getting coords using inverse kinematics
function [X,Y,Z] = get_coords(t1,t2,t3)
constants %including constants file
    theta1 = deg2rad(t1);
    theta2 = deg2rad(t2);
    theta3 = deg2rad(t3);
   % Calculating the Center of Sphere 1 (Point A1):
    X1 = 0;
    Y1 = -wB - L*cos(theta1) + uP;
    Z1 = -L*sin(theta1);

   % Calculating the Center of Sphere 2 (Point A2):
    X2 = 0.5*(sqrt(3)*(wB + L*cos(theta2)) - SP);
    Y2 = 0.5*(wB + L*cos(theta2)) - wP;
    Z2 = -L*sin(theta2);

   % Calculating the Center of Sphere 3 (Point A3):
    X3 = -0.5*(sqrt(3)*(wB + L*cos(theta3)) - SP);
    Y3 = 0.5*(wB + L*cos(theta3)) - wP;
    Z3 = -L*sin(theta3);

    % Getting the End Effector Coordinates:
   %  A1 = [X1,Y1,Z1];
   %  A2 = [X2,Y2,Z2];
   %  A3 = [X3,Y3,Z3];
   %radii = [l,l,l];
    solution=0;
    r1=l;
    r2=l;
    r3=l;
    [X,Y,Z] = trilaterate(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,r1,r2,r3, solution);
    %display();
end
