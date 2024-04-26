%% calculates an intersection point of three spheres
function [x,y,z] = trilaterate(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,r1,r2,r3, solution)
% Unpacking Inputs:

% Manipulating Equations:
    a11 = 2*(X3 - X1);
    a12 = 2*(Y3 - Y1);
    a13 = 2*(Z3 - Z1);

    a21 = 2*(X3 - X2);
    a22 = 2*(Y3 - Y2);
    a23 = 2*(Z3 - Z2);

    b1 = r1*r1 - r3*r3 - X1*X1 - Y1*Y1 - Z1*Z1 + X3*X3 + Y3*Y3 + Z3*Z3;
    b2 = r2*r2 - r3*r3 - X2*X2 - Y2*Y2 - Z2*Z2 + X3*X3 + Y3*Y3 + Z3*Z3;
    
    a1 = a22/a21 - a12/a11;
    a2 = a13/a11 - a23/a21;
    a3 = b2/a21 - b1/a11;
    a4 = a2/a1;
    a5 = a3/a1;
    a6 = (a22*a4 + a23) / a21;
    a7 = (b2 - a22*a5) / a21;

    a0 = a6*a6 + a4*a4 + 1;
    b0 = 2*(a6*(X1 - a7) + a4*(a5 - Y1) - Z1);
    c0 = a7*(a7 - 2*X1) + a5*(a5 - 2*Y1) + X1*X1 + Y1*Y1 + Z1*Z1 - r1*r1;
 % Choosing the Solution to be Returned:
    if solution == 1
        z = 0.5*(-b0 + sqrt(b0*b0 - 4*a0*c0)) / a0;
    else
        z = 0.5*(-b0 - sqrt(b0*b0 - 4*a0*c0)) / a0;
    end
 % Calculating the Remaining Coordinates of the Solution:
    y = a4*z + a5;
    x = -a6*z + a7;
    coords = [x,y,z];
end