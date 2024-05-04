#include <math.h>

// Belt's Stepper Motor Parameters 
float belt_speed_rpm;
float belt_speed_linear;

const float MicroSteps = 8;
const float Step_Angle_Rads =  (2 * M_PI) / (200 * MicroSteps);

const float pulley_radius = 44.0;

// Functions Prototypes
void belt_run_const_speed(int linear_speed);