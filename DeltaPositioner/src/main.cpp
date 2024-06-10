#include <Arduino.h>
#include <Wire.h>
#include <inv_kinematics.h>
#include <constants.h>
#include <stepper_params.h>
#include <math.h>
#include <Gripper.h>
#include <Conveyor.h>
#include <AccelStepper.h>
#include <ezButton.h>
// #include <avr8-stub.h>

// Computer Vision Message
String X_recieved;
String Y_recieved;
String Z_recieved;

// End effector position variables
float X_current;
float Y_current;
float Z_current;

float X_next;
float Y_next;
float Z_next;

const int theta_max = 65;
const int theta_min = -65;
////
/// Delta Robot Motion Demo, End Effector Position Arrays
// Cornering Demo
const int X_cycle[]   = {0,       0,      0,     0,     0,    140,   0,    -140,      0,    0,     0,     0,     0,      0,      0,     0,       0};
const int Y_cycle[]   = {0,     -140,     0,    140,    0 ,    0,    0,      0,       0,    0,     0,     0,     0,     140,    140,   140,      0};
const int Z_cycle[]   = {-300,  -400,   -300,  -400,  -300,  -400,  -300,  -400,   -300,  -460,  -300,  -400,   -300,  -400,   -400,   -400,   -300};
const float dur_arr[] = {0,  0.5,   0.5,    0.5,    0.4,   0.5,   0.5,   0.5,   0.4,    0.5,   0.5,   0.5,   0.4,    0.5,    0.5,   0.5,    0.4};
int ind = 0;

// Pick and Place Demo
const int X_PP[] =         {   0,      0,     0,    0,    0,    0};
const int Y_PP[] =         { -140,   -140,  -140,  140,  140,  140};
const int Z_PP[] =         { -350,   -500,  -350, -350, -500, -350};
const float dur_arr_PP[]=  {0.8,  0.7,    0.6,   0.8,  0.6,  0.7};

// Computer Vision Pick and Place 
const int X_CV[] =         {   0,      0,     0,     0,    0,    0,    0,   0};
      int Y_CV[] =         { -140,   -140,  -140,  -140,  140,  140,  140,  0};
const int Z_CV[] =         { -350,   -450,  -450,  -350, -350, -450, -350, -300};
const float dur_arr_CV[]=  {0.8,  0.7,     4,    0.6,   2,  0.6,  0.7,  0.8};
const int X_item = 0;
const int Y_item = -130;
const int Z_item = -330;
const int Z_item_hold = -404;
const int X_pack = 0;
const int Y_pack = 140;
const int Z_pack = -330;

////                                                                         
bool start_flag           = false;
bool start_flag_PickPlace = false;
bool start_flag_HOME      = false;
bool start_flag_CV        = false;
bool no_motion            = false;
bool demos_start_flag     = false;
bool demos_once_flag      = false;
bool demos_inf_flag       = false;
bool demos_stopnow_flag   = false;
bool start_flag_cornering = false;
bool prev_is_demo         = false;
bool bara_elfetch_yakalb  = false;
bool start_flag_belt      = false; 
bool basmag_flag          = false;
bool gripper_test_flag    = false;

// Timers 
float current_millis_gripper;
float previous_millis_gripper = 0;
float offset_millis_gripper = 0;

// Flags 
bool start_cycle_again    = true;
bool end_deflation_flag   = false;
bool go_downpick_flag     = false;
bool go_up_flag           = false;
bool go_pack_yalla        = false;
bool packed               = false;
////                                                                         

// Steppers structure to contain 3 motors info
volatile stepperInfo steppers[3];

// MEGA Wiring
AccelStepper stepper1(AccelStepper::DRIVER, 43, 16);
AccelStepper stepper2(AccelStepper::DRIVER, 37, 35);
AccelStepper stepper3(AccelStepper::DRIVER, 40, 39);
AccelStepper belt_stepper(AccelStepper::FULL2WIRE, 42, 47);

ezButton ls_mot1(15);  // create ezButton object that attach to pin 6;
ezButton ls_mot2(14);  // create ezButton object that attach to pin 7;
ezButton ls_mot3(0);  // create ezButton object that attach to pin 8;

/* NANO Wiring
AccelStepper stepper1(AccelStepper::DRIVER, 6, 7);
AccelStepper stepper2(AccelStepper::DRIVER, 11, 12);
AccelStepper stepper3(AccelStepper::DRIVER, 3, 4);
*/

/// Function Prototypes
void fetch_command()
{
  //while (bara_elfetch_yakalb == false)
  //{
    if (Serial.available())
    {
      String incoming_byte = Serial.readStringUntil('\n');
      incoming_byte.trim();
      Serial.print(incoming_byte);
      //char key = Serial.read();
      no_motion = false;
      
      //if (prev_is_demo == true && incoming_byte !="HOME" && incoming_byte != "VISION")
      //{
       // goto sabry; 
      ///}

      // Check the main choice
      if (incoming_byte == "HOME")
      {
        Serial.println("Key 'h' pressed. Homing Robot");
        demos_start_flag = false;
        //start_flag_PickPlace = false;
        //start_flag_cornering = false;
        start_flag_HOME = true;
        start_flag_CV = false;
        ind = 0;
        bara_elfetch_yakalb = true;
      }

      else if (incoming_byte == "DEMOS")
      {
        demos_start_flag = true;
        Serial.print("ANA GOWA DEMOS YA KALB");
        delay(2000);
        start_flag_HOME = false;
        //start_flag_PickPlace = false;s
        //start_flag_cornering = false;
        start_flag_CV = false;
        ind = 0;
        bara_elfetch_yakalb = false;
      }

      else if (incoming_byte == "VISION")
      {
        demos_start_flag = false;
        start_flag_HOME = false;
        start_flag_PickPlace = false;
        start_flag_cornering = false;
        start_flag_CV = true;
        ind = 0;
        bara_elfetch_yakalb = true;
        Serial.println("Im inside vision");
        delay(1000);
        return;
      }
      else if (incoming_byte == "VISIONEX")
      {
        demos_start_flag = false;
        start_flag_HOME = false;
        start_flag_PickPlace = false;
        start_flag_cornering = false;
        start_flag_CV = false;
        ind = 0;
        bara_elfetch_yakalb = true;
        Serial.println("Im going outside vision");
        delay(1000);
        return;
      }
      else if (incoming_byte == "BELTON")
      {
        demos_start_flag = true;
      }
      else if (incoming_byte == "BELTOFF")
      {
        demos_start_flag = false;
      }
      else 
      {
        delay(1000);
        Serial.println("NO CHOICE SELECTED");
      }
      ////

      // if cornering is has been chosen, check which choice
      // sabry:
      if (demos_start_flag == true)
      {
        // Check which demo will be done 
        //sabry:
        while (start_flag_cornering == false && start_flag_PickPlace == false)
        {
          String choice = Serial.readString();
          choice.trim();
          Serial.print(choice);
          if (choice == "CORNER")
          {
            start_flag_cornering = true;
            start_flag_PickPlace = false;
          }
          else if (choice == "PICKPLACE")
          {
            start_flag_PickPlace = true;
            start_flag_cornering = false;
          }
          else
          {
            Serial.println("Invalid choice. Please choose again.");
          }
        }
        // Check how many times the demo would be done, once, inifnitely, or stop now 
        String choii = Serial.readString();
        while (demos_inf_flag == false && demos_once_flag == false && demos_stopnow_flag == false)
        {
          choii = Serial.readString();
          choii.trim();
          if (choii == "DEMONONSTOP")
          {
            demos_inf_flag     = true;
            demos_once_flag    = false;
            demos_stopnow_flag = false;
          }
          else if (choii == "DEMOSTOPNOW")
          {
            demos_inf_flag     = false;
            demos_once_flag    = false;
            demos_stopnow_flag = true;
          }
          else if (choii == "DEMOONETIME")
          {
            demos_inf_flag     = false;
            demos_once_flag    = true;
            demos_stopnow_flag = false;
          }
        }
        bara_elfetch_yakalb = true;
      }
      else 
      {
        start_flag_cornering = false;
        start_flag_PickPlace = false;
        demos_inf_flag       = false;
        demos_once_flag      = false;
        demos_stopnow_flag   = false;
        bara_elfetch_yakalb  = true;
      }
      /////
      /*
      if (key == 's')
      {
        Serial.println("Key 's' pressed. Starting Motion Cycle.");
        start_flag = true;
        start_flag_PickPlace = false;
        start_flag_HOME = false;
        start_flag_CV = false;
        ind = 0;
      }
      else if (key == 'p')
      {
        Serial.println("Key 'p' pressed. Pick and Place Demo Selected");
        start_flag_PickPlace = true;
        start_flag = false;
        start_flag_HOME = false;
        start_flag_CV = false;
        ind = 0;
      }
      else if (key == 'h')
      {
        Serial.println("Key 'h' pressed. Homing Robot");
        start_flag_PickPlace = false;
        start_flag = false;
        start_flag_HOME = true;
        start_flag_CV = false;
        ind = 0;
      }
      else if (key == 'c')
      {
        Serial.println("Key 'c' pressed. Taking input from CV, Enter Y");
        int YY = Serial.parseInt();
        Y_CV[0] = YY;
        Y_CV[1] = YY;
        Y_CV[2] = YY;
        start_flag_PickPlace = false;
        start_flag = false;
        start_flag_HOME = false;
        start_flag_CV = true;
        ind = 0;
      }
      else
      {
        Serial.println("Press 's' to start corenring cycle demo");
        Serial.println("Press 'p' to start pick and place demo");
        Serial.println("Press 'h' to home robot");
        start_flag = false;
        start_flag_PickPlace = false;
        start_flag_HOME = false;
        start_flag_CV = false;
      }
    }
    */
    }
    else
    {
      no_motion = true;
      // bara_elfetch_yakalb = true;
    }
  //}
}
void yalla_ya_belt_sama3_3amo()
{
  curr_belt = millis();
  digitalWrite(7,HIGH);
  if (curr_belt - prev_belt >= 0.1 && start_flag_belt == true)
  {
    digitalWrite(6,HIGH);
    digitalWrite(6,LOW);
    
    prev_belt = curr_belt;
  }

  if (Serial.available())
  {
    String incoming_belt = Serial.readStringUntil('\n');
    incoming_belt.trim();

    if (incoming_belt == "BELTON")
    {
      start_flag_belt = true;
    } 
    else if (incoming_belt == "BELTOFF")
    {
      start_flag_belt = false;
    }
  }
}
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

  steppers[0].current_angle = (thetas_current[2] * 180 / M_PI);
  steppers[1].current_angle = (thetas_current[0] * 180 / M_PI);
  steppers[2].current_angle = (thetas_current[1] * 180 / M_PI);

  steppers[0].next_angle = (thetas_next[2] * 180 / M_PI);
  steppers[1].next_angle = (thetas_next[0] * 180 / M_PI);
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

  while (stepper1.distanceToGo() != 0 || stepper2.distanceToGo() != 0 || stepper3.distanceToGo() != 0)
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

    yalla_ya_belt_sama3_3amo();
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
  */
  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
}
void home_delta()
{
  float homing_speed = 0.2; // Rad/s
  float homing_acc = 0.27; // Rad/s2
  ////                                                            
  /// Homing Motor 1
  int ls1 = 1;
  stepper1.setCurrentPosition(0);
  stepper1.moveTo(200 / STEP_ANGLE_DEGS);
  stepper1.setMaxSpeed(homing_speed / STEP_ANGLE_RADS);
  stepper1.setAcceleration(homing_acc / STEP_ANGLE_RADS);
  
  ls_mot1.loop();
  ls1 = ls_mot1.getState();
  ls1 = 1;

  while (ls1 == 1)
  {
    ls_mot1.loop();
    //ls1 = ls_mot1.getState();
    stepper1.run();
    if (ls_mot1.isPressed())
    {
     //stepper1.stop();
     ls1 = 0;
    }
  }
  stepper1.stop();
  delay(1000);
  stepper1.setCurrentPosition(0);
  stepper1.moveTo(steps_ls_home);
  stepper1.setMaxSpeed(homing_speed / STEP_ANGLE_RADS);
  stepper1.setAcceleration(homing_acc / STEP_ANGLE_RADS);
  while (stepper1.distanceToGo() != 0)
  {
    stepper1.run();
  }
  ////                                                            
  /// Homing Motor 3
  int ls3 = 1;
  stepper3.setCurrentPosition(0);
  stepper3.moveTo(200 / STEP_ANGLE_DEGS);
  stepper3.setMaxSpeed(homing_speed / STEP_ANGLE_RADS);
  stepper3.setAcceleration(homing_acc / STEP_ANGLE_RADS);
  
  ls_mot3.loop();
  ls3 = ls_mot3.getState();
  ls3 = 1;

  while (ls3 == 1)
  {
    ls_mot3.loop();
    //ls1 = ls_mot1.getState();
    stepper3.run();
    if (ls_mot3.isPressed())
    {
     //stepper1.stop();
     ls3 = 0;
    }
  }
  stepper3.stop();
  delay(1000);
  stepper3.setCurrentPosition(0);
  stepper3.moveTo(steps_ls_home);
  stepper3.setMaxSpeed(homing_speed / STEP_ANGLE_RADS);
  stepper3.setAcceleration(homing_acc / STEP_ANGLE_RADS);
  while (stepper3.distanceToGo() != 0)
  {
    stepper3.run();
  }
  ////                                                           
  /// Homing Motor 2
  int ls2 = 1;
  stepper2.setCurrentPosition(0);
  stepper2.moveTo(200 / STEP_ANGLE_DEGS);
  stepper2.setMaxSpeed(homing_speed / STEP_ANGLE_RADS);
  stepper2.setAcceleration(homing_acc / STEP_ANGLE_RADS);
  
  ls_mot2.loop();
  ls2 = ls_mot2.getState();
  ls2 = 1;

  while (ls2 == 1)
  {
    ls_mot2.loop();
    //ls1 = ls_mot1.getState();
    stepper2.run();
    if (ls_mot2.isPressed())
    {
     //stepper1.stop();
     ls2 = 0;
    }
  }
  stepper2.stop();
  delay(1000);
  stepper2.setCurrentPosition(0);
  stepper2.moveTo(steps_ls_home);
  stepper2.setMaxSpeed(homing_speed / STEP_ANGLE_RADS);
  stepper2.setAcceleration(homing_acc / STEP_ANGLE_RADS);
  while (stepper2.distanceToGo() != 0)
  {
    stepper2.run();
  }
  stepper1.stop();
  stepper2.stop();
  stepper3.stop();
  
  /// Reset Angular and End-Effector Positions 
  X_current = 0;
  Y_current = 0;
  Z_current = -300;
  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
  return;
}
float get_time_to_position(float item_pos)
{
    // Get time for a movement on the belt with 200 mm on X-axis
    float time_to_pos = item_pos / belt_speed_linear; // sec = mm/(mm/sec)
    return time_to_pos;
}
void check_switches()
{

}
void setup()
{
  ls_mot1.setDebounceTime(10); // set debounce time to 50 milliseconds
  ls_mot2.setDebounceTime(10); // set debounce time to 50 milliseconds
  ls_mot3.setDebounceTime(10); // set debounce time to 50 milliseconds
  // Serial Monitor Init.
  Serial.begin(9600);
  // debug_init();

  // CV
  X_recieved = String();
  Y_recieved = String();
  Z_recieved = String();

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
  /**
  Serial.println("    Press 's' to start corenring cycle demo");
  Serial.println("    Press 'p' to start pick and place demo");
  Serial.println("    Press 'h' to home robot");
  */
  steppers[0].lim_sw = 15;
  steppers[1].lim_sw = 14;
  steppers[2].lim_sw = 0;
  pinMode(steppers[0].lim_sw, INPUT);
  pinMode(steppers[1].lim_sw, INPUT);
  pinMode(steppers[2].lim_sw, INPUT);

  // Belt Initialization
  //attachInterrupt(digitalPinToInterrupt(start_button_pin_belt), start_belt, RISING);
  //attachInterrupt(digitalPinToInterrupt(stop_button_pin_belt), stop_belt, RISING);
  pinMode(INTAKE_PUMP, OUTPUT);
  pinMode(VACUUM_PUMP, OUTPUT);
  pinMode(INTAKE_VALVE, OUTPUT);
  pinMode(VACUUM_VALVE, OUTPUT);

  //
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  digitalWrite(6,LOW);
  //home_delta();
  //belt_init(belt_speed_linear);
  gripper_idle();
}
void loop()
{
  // gripper_off();
  // stop_belt();
  // Motion Demo Selector
  
  // fetch_command();
  //start_flag_cornering = true;
  //demos_inf_flag = false;
  ////
  /// Cornring Demo
  // start_flag_CV = true;

  while (ind < 13 && start_flag_cornering == true)
  {
    X_next = X_cycle[ind];
    Y_next = Y_cycle[ind];
    Z_next = Z_cycle[ind];

    while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
    {
      duration = 0.8 * dur_arr[ind];
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
    // delay(3000);
    // start_flag_ = true;
  }
  ////
  // Pick and Place Demo
  while (ind < 6 && start_flag_PickPlace == true)
  
  {
    X_next = X_PP[ind];
    Y_next = Y_PP[ind];
    Z_next = Z_PP[ind];

    while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
    {
      duration = 0.8 * dur_arr_PP[ind];
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
    // delay(3000);
    // start_flag_PickPlace = true;
  }
  ////
  // Homing Stepeprs
  while (start_flag_HOME == true)
  {
    X_next = 0;
    Y_next = 0;
    Z_next = -300;
    duration = 0.7;
    while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
    {
      move_steppers();
      X_current = X_next;
      Y_current = Y_next;
      Z_current = Z_next;
    }
    start_flag_HOME = false;
  }
  ////
  // Taking Input from CV
  while (ind < 8 && start_flag_CV == true)
  {
    if (Serial.available())
    {
      String break_cond = Serial.readString();
      break_cond.trim();
      if (break_cond == "VISIONEX")
      {
        // Serial.println("Breaking Vision Loop");
        start_flag_CV = false;
        break;
      }
    }
    Serial.println("VISION STARTED");
    X_next = X_CV[ind];
    Y_next = Y_CV[ind];
    Z_next = Z_CV[ind];
    duration = dur_arr_CV[ind];

    // Delay a while until the gripper hold the object
    if (X_next == X_current && Y_next == Y_current && Z_next == Z_current)
    {
      delay(4000);
    }

    while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
    {
      move_steppers();
      X_current = X_next;
      Y_current = Y_next;
      Z_current = Z_next;
    }
    ind++;
    //start_flag_CV = true;
  }
  ////

  /// No choice selected
  /*
  if (no_motion == true && start_flag == false && start_flag_HOME == false && start_flag_PickPlace == false)
  {
    delay(3000);
    
    Serial.println("Motion DONE, Select another DEMO to do: ");
    Serial.println("    Press 's' to start corenring cycle demo");
    Serial.println("    Press 'p' to start pick and place demo");
    Serial.println("    Press 'h' to home robot");
    
  }
  */

  if (demos_inf_flag == true)
  {
    // ind = 0;
  }

  //gripper_off();
  //delay(8000);
  //gripper_delate();
  //delay(12000);
  //gripper_inflate();

  
     
  
  if (Serial.available())
  {
    String incoming = Serial.readStringUntil('\n');
    incoming.trim();

    if (incoming == "BELTON")
    {
      start_flag_belt = true;
    } 
    else if (incoming == "BELTOFF")
    {
      start_flag_belt = false;
    }
    else if (incoming == "PNEUOFF")
    {
      gripper_off();
    }
    else if (incoming == "PNEUON")
    {
      gripper_idle();
    }
  }
  
  basmag_flag = true;
  start_flag_belt = true;
  while (basmag_flag == true)
  {
    // Deflate gripper by default initially  
    gripper_delate();

    current_millis_gripper = millis();
    
    if (current_millis_gripper - previous_millis_gripper > 4000 && start_cycle_again == true)
    {
      end_deflation_flag = true;
    }
    
    //delay(4000); 
 
    // Move Belt Regardless of which gripper action is took now 
    yalla_ya_belt_sama3_3amo();


    // Go to item location and stop (no z)
    if (end_deflation_flag == true)
    {
      X_next = X_item;
      Y_next = Y_item;
      Z_next = Z_item;
      duration = 1;//ppppppc  
      while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
      {  
        move_steppers(); 
        X_current = X_next;
        Y_current = Y_next;
        Z_current = Z_next;
      }
      offset_millis_gripper = millis();
      go_downpick_flag = true;
    }

    // delay until object comes, then go down and grip object,then go up again   
    while (go_downpick_flag == true)
    {
      // belt
      yalla_ya_belt_sama3_3amo();
      
      // remove this delay, responsible for waiting till object comes, function in belt speed, delay(1000);
      current_millis_gripper = millis();
      //gripper_off();

      if (current_millis_gripper - offset_millis_gripper > 2000 && go_up_flag == false) // delay removed, currently 2 seconds for object to come under the gripper 
      {
        // move in z only to grip the object
        X_next = X_item;
        Y_next = Y_item;
        Z_next = Z_item_hold;
        duration = 0.4;//pppppp
        while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
        {  
          move_steppers(); 
          X_current = X_next;
          Y_current = Y_next;
          Z_current = Z_next;
        }
        gripper_inflate();
        go_up_flag = true;
        //go_downpick_flag = false;
        offset_millis_gripper = millis();
      }

      if (current_millis_gripper - offset_millis_gripper > 1000 && go_up_flag == true)
      {
        // move in upwards
        X_next = X_item;
        Y_next = Y_item;
        Z_next = Z_item;
        duration = 1.5;//pppppp
        while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
        {  
          move_steppers(); 
          X_current = X_next;
          Y_current = Y_next;
          Z_current = Z_next;
        }
        go_pack_yalla = true;
        go_downpick_flag = false;
        start_cycle_again = false;
        offset_millis_gripper = millis();
      }
    }
    
    // go to pack location 
    if (go_pack_yalla == true)
    {
      X_next = X_pack;
      Y_next = Y_pack;
      Z_next = Z_pack;
      duration = 1;
      while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
      {
        move_steppers(); 
        X_current = X_next;
        Y_current = Y_next;
        Z_current = Z_next;
      }
      gripper_delate();
      end_deflation_flag = false;
      go_downpick_flag = false;
      go_up_flag = false;
      go_pack_yalla = false;
      start_cycle_again = false;
      packed = true;
      offset_millis_gripper = millis();
    }
    
    //delay(5000);

    
    
    // Home Delta 
    if (start_cycle_again == false && packed == true && current_millis_gripper - offset_millis_gripper > 1000)
    {
      gripper_off();
      X_next = 0;
      Y_next = 0;
      Z_next = -300;
      duration = 1;
      while (X_current != X_next || Y_next != Y_current || Z_current != Z_next)
      {
        move_steppers(); 
        X_current = X_next;
        Y_current = Y_next;
        Z_current = Z_next;
      }
    }
    //delay(50000000);
  }


  gripper_test_flag = false;


  // gripper_idle(); 
  // gripper testing and calibration
  while (gripper_test_flag == true)
  {
    gripper_inflate();
    delay(4000);
    //delay(10000);
    gripper_delate();
    delay(7000);
  }

} 