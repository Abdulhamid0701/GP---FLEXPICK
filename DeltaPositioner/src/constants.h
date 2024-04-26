// Delta Robot Kinematic Constants and Used Parameters

#include <Arduino.h>
#include <math.h>

const float SB = 384.14;    // base side length
const float Sp = 86.14/2;      // platform side length
const float L  = 230;       // driver link length
const float l  = 436;     // driven link length
const float delta = 89;     // distance between the each pair of driven links
const float tau = 80;      // distance between the bearing of the driver link's revolute joint

const float max_beta = M_PI/6;   // max angle for the spherical joints
const float min_angle = -M_PI/6; // the minimum angle allowed for the motors
const float max_angle = M_PI/3;  // the maximum angle allowed for the motors

const float wB = (SB*sqrt(3))/(6);
const float uB = (SB*sqrt(3))/(3);
const float wP = (Sp*sqrt(3))/(6);
const float uP = (Sp*sqrt(3))/(3);

const float delta_2 = delta/2;
const float tau_2 = tau/2;

const float a = wB-uP;
const float b = (Sp-sqrt(3)*wB)/2;
const float c = wP-0.5*wB;

