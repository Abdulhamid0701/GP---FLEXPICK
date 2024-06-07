#include <math.h>

// Belt's Stepper Motor Parameters 
const float MicroSteps = 16;
const float Step_Angle_Rads =  (2 * M_PI) / (200 * MicroSteps);

const float pulley_radius = 16;

const int start_button_pin_belt = 20;
const int stop_button_pin_belt = 21;

float curr_belt = 0;
float prev_belt = 0;

const float belt_speed_linear = 10; // mm/sec
float rpm_belt = ((60) / (2 * M_PI)) * (belt_speed_linear / pulley_radius);
int SPS = ((belt_speed_linear* 1e-3) / pulley_radius) / Step_Angle_Rads;

float delay_belt = 60 * (1 / rpm_belt) * (1 / 200) * (1e6) * (1 / MicroSteps);