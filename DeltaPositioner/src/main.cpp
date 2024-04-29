#include <Arduino.h>
#include <Wire.h>
#include <inv_kinematics.h>
#include <constants.h>
#include <stepper_params.h>
#include <math.h>
#include <AccelStepper.h>
//#include <avr8-stub.h>
 
// End effector position variables
float X_current;
float Y_current;
float Z_current;

float X_next;
float Y_next;
float Z_next;

const int theta_max = 70;
const int theta_min = -70;

// End effector motion cycle
const int X_cycle[] = {0,    -180,  -180,  -180,  180,    180,    180,   0, 180, 180, 0};
const int Y_cycle[] = {0,    -180,  -180, -180, -180,    -180,   -180,   0, 0, 0, 0};
const int Z_cycle[] = {-300, -300,  -400,  -300, -300,    -400,   -300, -300, -400, -300, -300};
const float dur_arr[] = {0, 0.5,  0.5,  0.5,    0.5,    0.5,   0.5,  0.5, 1, 1, 1};
int ind = 0;



// Steppers structure to contain 3 motors info
volatile stepperInfo steppers[3];

// MEGA Wiring 
AccelStepper stepper1(AccelStepper::DRIVER, 50, 51);
AccelStepper stepper2(AccelStepper::DRIVER, 47, 46);
AccelStepper stepper3(AccelStepper::DRIVER, 42, 43);

/* NANO Wiring
AccelStepper stepper1(AccelStepper::DRIVER, 6, 7);
AccelStepper stepper2(AccelStepper::DRIVER, 11, 12);
AccelStepper stepper3(AccelStepper::DRIVER, 3, 4);
*/

/// Function Prototypes
void trapezoid_profile_setup()
{
  for (int i = 0; i < 3; i++)
  {
    // Define distance traveled in radians by each motor
    steppers[i].meshwar = (steppers[i].target_angle) * M_PI / 180;

    // Define angular acceleration required by each motor for 1/3 acc, 1/3 const. speed, 1/3 dec [rad/s2]
    steppers[i].alpha = 2 * (steppers[i].meshwar * 0.5) / (pow((duration * 0.5), 2));

    // Define max. speed in for each motor [rad/s]
    steppers[i].max_speed = steppers[i].alpha * duration * 0.5;

    steppers[i].currentSteps = 0;

    remaining_motors_byte |= (1 << i);
  }
  stepper1.setMaxSpeed(steppers[0].max_speed / STEP_ANGLE_RADS);
  stepper2.setMaxSpeed(steppers[1].max_speed / STEP_ANGLE_RADS);
  stepper3.setMaxSpeed(steppers[2].max_speed / STEP_ANGLE_RADS);

  stepper1.setAcceleration(steppers[0].alpha / STEP_ANGLE_RADS);
  stepper2.setAcceleration(steppers[1].alpha / STEP_ANGLE_RADS);
  stepper3.setAcceleration(steppers[2].alpha / STEP_ANGLE_RADS);

  stepper1.moveTo(-steppers[0].targetSteps);
  stepper2.moveTo(-steppers[1].targetSteps);
  stepper3.moveTo(-steppers[2].targetSteps);

    /*
    Serial.print("Mot1. Steps: ");
    Serial.println(round(steppers[0].meshwar / STEP_ANGLE_RADS));
    Serial.print("Mot2. Steps: ");
    Serial.println(round(steppers[1].meshwar / STEP_ANGLE_RADS));
    Serial.print("Mot3. Steps: ");
    Serial.println(steppers[2].meshwar / STEP_ANGLE_RADS);
  */
}

void move_steppers()
{
  // Convert XYZ distnace to angles through inverse kinematics
  float *thetas_next = get_thetas(X_next, Y_next, Z_next);
  float *thetas_current = get_thetas(X_current, Y_current, Z_current);

  steppers[0].current_angle = (thetas_current[0] * 180 / M_PI);
  steppers[1].current_angle = (thetas_current[2] * 180 / M_PI);
  steppers[2].current_angle = (thetas_current[1] * 180 / M_PI);

  steppers[0].next_angle = (thetas_next[0] * 180 / M_PI);
  steppers[1].next_angle = (thetas_next[2] * 180 / M_PI);
  steppers[2].next_angle = (thetas_next[1] * 180 / M_PI);

  // Checking that the required posionts are not out of the workspace and/or violate any mechanical constraints (collisions)
  for (int i = 0; i < 3; i++)
  {
    if (steppers[i].next_angle < theta_max && steppers[i].next_angle > theta_min)
    {
      steppers[i].target_angle = (steppers[i].next_angle - steppers[i].current_angle);
    }
    else
    {
      steppers[i].target_angle = 0;
    }
    // Update steps to be moved
    steppers[i].targetSteps = round(steppers[i].target_angle / STEP_ANGLE_DEGS);
  }

  // Setup the speed profile parameters for the motors
  trapezoid_profile_setup();

  while (stepper1.distanceToGo() != 0 || stepper2.distanceToGo() != 0 || stepper3.distanceToGo() != 0 )
  {
    stepper1.run();
    stepper2.run();
    stepper3.run();

    if (stepper1.distanceToGo() == 0)
    {
      remaining_motors_byte &= ~(1 << 0);
    }

    if (stepper2.distanceToGo() == 0)
    {
      remaining_motors_byte &= ~(1 << 1);
    }

    if (stepper3.distanceToGo() == 0)
    {
      remaining_motors_byte &= ~(1 << 2);
    }
  }

  // Reset all steppers and update their current position
  for (int i = 0; i < 3; i++)
  {
    steppers[i].currentSteps = 0;
    steppers[i].movement_done = false;
    if (steppers[i].next_angle <= theta_max && steppers[i].next_angle >= theta_min)
    {
      steppers[i].current_angle = steppers[i].next_angle;
    }
  }
  /*
  Serial.print("Mot1. Steps: ");
  Serial.print(steppers[0].targetSteps);
  Serial.print("   ");
  Serial.println(stepper1.currentPosition());
  Serial.print("Mot2. Steps: ");
  Serial.print(steppers[1].targetSteps);
  Serial.print("   ");
  Serial.println(stepper2.currentPosition());
  Serial.print("Mot3. Steps: ");
  Serial.print(steppers[2].targetSteps);
  Serial.print("   ");
  Serial.println(stepper3.currentPosition());
  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
  */
}

/*
void move_circular()
{
  float raduis = 150;
  float z_c = -400;

  for (int i = 0; i < 10; i++)
  {
    float phi = 2 * M_PI * i;
    float x_c = raduis + cos(phi);
    float y_c = raduis + sin(phi);

    X_next = x_c;
    Y_next = y_c;
    Z_next = z_c;
    duration = 0.2;
    move_steppers();
    X_current = X_next;
    Y_current = Y_next;
    Z_current = Z_next;
    // Serial.print(X_current);
    // Serial.print("   ");
    // Serial.println(Z_current);
  }
}
*/

void setup()
{
  // Serial Monitor Init.
  Serial.begin(115200);
  //debug_init();

  // Set 3 motors' steps counter initially to zero
  steppers[0].currentSteps = 0;
  steppers[1].currentSteps = 0;
  steppers[2].currentSteps = 0;

  // Homing the XYZ positions
  X_current = 0;
  Y_current = 0;
  Z_current = -300;

  // Homing the Stepper Motor Positions
  steppers[0].current_angle = 0;
  steppers[1].current_angle = 0;
  steppers[2].current_angle = 0;

  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
}
void loop()
{
  delay(3000);
  bool start_flag = false;
  
  if (Serial.available() > 0) {
    char key = Serial.read();
    if (key == 's') 
    {
      Serial.println("Key 's' pressed. Starting Motion Cycle.");
      start_flag = true;
    } 
    else 
    {
      Serial.println("Press 's' to start motion cycle.");
      start_flag = false;
    }
  }

  while (ind < 8 && start_flag == true) // while en el cycle lessa makhelsetsh
  {
    // Next points on the main cycle
    X_next = X_cycle[ind];
    Y_next = Y_cycle[ind];
    Z_next = Z_cycle[ind];

    while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
    {
      duration = dur_arr[ind];
      move_steppers();
      X_current = X_next;
      Y_current = Y_next;
      Z_current = Z_next;
    }

    ind++;    
    Serial.print(X_current);
    Serial.print("   ");
    Serial.print(Y_current);
    Serial.print("   ");
    Serial.println(Z_current);
    delay(10);
  }
  // ind = 0;
  // move_circular();
}