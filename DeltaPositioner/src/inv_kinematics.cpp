#include <Arduino.h>
#include <math.h>
#include <constants.h>
#include <inv_kinematics.h>


// Getting thetas using inverse kinematics
float* get_thetas(float x,float y,float z)
{   float t1;
    float t2;
    float t3;
    float F  = 2*z*L;
// Getting theta 1:
    float E_1 = 2*L*(y+a);
    float G_1 = x*x + y*y + z*z + a*a + L*L + 2*y*a - l*l;
    float t_plus1 = (-F + sqrt(pow(E_1, 2) + pow(F, 2) - pow(G_1, 2))) / (G_1 - E_1);
    float t_minus1 = (-F - sqrt(pow(E_1, 2) + pow(F, 2) - pow(G_1, 2))) / (G_1 - E_1);
    if (abs(t_plus1)>abs(t_minus1))
         t1=t_minus1;
    else
         t1=t_plus1;
    float theta1 = 2*atan(t1);
// Getting theta 2:
    float E_2 = -L*(sqrt(3)*(x+b)+y+c);
    float G_2 = x*x + y*y + z*z + b*b + c*c + L*L + 2*(x*b + y*c) - l*l;
    float  t_plus2 = (-F + sqrt(pow(E_2, 2) + pow(F, 2) - pow(G_2, 2))) / (G_2 - E_2);
    float  t_minus2 = (-F - sqrt(pow(E_2, 2) + pow(F, 2) - pow(G_2, 2))) / (G_2 - E_2);
    if (abs(t_plus2)>abs(t_minus2))
        t2=t_minus2;
    else
        t2=t_plus2;
    float theta2 = 2*atan(t2);
// Getting theta 3:
    float E_3 = L*(sqrt(3)*(x-b)-y-c);
    float G_3 = x*x + y*y + z*z + b*b + c*c + L*L + 2*(-x*b + y*c) - l*l;
    float t_plus3 = (-F + sqrt(pow(E_3, 2) + pow(F, 2) - pow(G_3, 2))) / (G_3 - E_3);
    float t_minus3 = (-F - sqrt(pow(E_3, 2) + pow(F, 2) - pow(G_3, 2))) / (G_3 - E_3);
    if (abs(t_plus3)>abs(t_minus3))
        t3=t_minus3;
    else
        t3=t_plus3;
    float theta3 = 2*atan(t3);
// saving the three thetas in thetas array
 float* thetas = new float[3];
    thetas[0] = theta1;
    thetas[1] = theta2;
    thetas[2] = theta3;
    return thetas;
}
