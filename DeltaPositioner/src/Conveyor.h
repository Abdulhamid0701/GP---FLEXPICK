#include <math.h>

// Belt's Stepper Motor Parameters 
float belt_speed_linear = 10; // mm/sec

const float MicroSteps = 8;
const float Step_Angle_Rads =  (2 * M_PI) / (200 * MicroSteps);

const float pulley_radius = 44.0;

const int start_button_pin_belt = 20;
const int stop_button_pin_belt = 21;

// Functions Prototypes
void belt_run_const_speed(int linear_speed);
void start_belt();
void stop_belt();
float get_time_to_position(float item_pos);