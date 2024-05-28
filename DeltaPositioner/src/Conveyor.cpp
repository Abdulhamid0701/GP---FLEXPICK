#include <Conveyor.h>
#include <AccelStepper.h>
#include <math.h>
// Initalize Conevyor's Stepper Motor Pins
AccelStepper belt_stepper(AccelStepper::DRIVER, 9, 8);

// Moving With Constant Speed Function 
void belt_run_const_speed(int linear_speed)
{
    // Convert linear speed to rad/s then to STEPS/SEC 
    int SPS = ((linear_speed * 1e-3) / pulley_radius) / Step_Angle_Rads;
    belt_stepper.setSpeed(SPS);

    // Run belt unless the stop button is pressed 
    belt_stepper.runSpeed();
}

void start_belt()
{
    int SPS = ((belt_speed_linear* 1e-3) / pulley_radius) / Step_Angle_Rads;
    belt_stepper.setSpeed(SPS);
    belt_stepper.runSpeed();
}

void stop_belt()
{
    belt_stepper.stop();
}

float get_time_to_position(float item_pos)
{
    // Get time for a movement on the belt with 200 mm on X-axis
    float time_to_pos = item_pos / belt_speed_linear; // sec = mm/(mm/sec)
    return time_to_pos;
}