#include <Arduino.h>
#include <math.h>
#include <Conveyor.h>
#include <AccelStepper.h>

// Initalize Conevyor's Stepper Motor Pins
AccelStepper belt_stepper(AccelStepper::DRIVER, 1, 2);

// Moving With Constant Speed Function 
void belt_run_const_speed(int linear_speed)
{
    // Convert linear speed to rad/s then to STEPS/SEC 
    int SPS = ((linear_speed * 1e-3) / pulley_radius) / Step_Angle_Rads;
    belt_stepper.setSpeed(SPS);

    // Run belt unless the stop button is pressed 
    belt_stepper.runSpeed();
}