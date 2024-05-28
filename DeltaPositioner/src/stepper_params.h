///////////////////// Stepper Motors Variables, Parameters & Constants

#include <math.h>

// Define motor parameters
const float STEPS_PER_REVOLUTION = 200.0; // Number of steps per revolution for the stepper motor
const float MICROSTEPS = 16.0;            // Microsteps setting for the motor driver
const float GEAR_RATIO = 1.0;             // Gear ratio of the motor (if any)
const float STEP_ANGLE_RADS = (2 * M_PI) / (STEPS_PER_REVOLUTION * MICROSTEPS);
const float STEP_ANGLE_DEGS = 360 / (STEPS_PER_REVOLUTION * MICROSTEPS);
const float steps_ls_home = (0 - 68) / STEP_ANGLE_DEGS;

unsigned long currentMicros;

////////////Trapezoidal Velocity  Profile Parameters and Variables////////////

/*  OLD CODE PARAMETERS
#define  Ft1 250000 // 16MHz/64 

#define TIMER5_INTERRUPTS_ON    TIMSK5 |=  (1 << OCIE5A);
#define TIMER5_INTERRUPTS_OFF   TIMSK5 &= ~(1 << OCIE5A);

#define TIMER4_INTERRUPTS_ON    TIMSK4 |=  (1 << OCIE4A);
#define TIMER4_INTERRUPTS_OFF   TIMSK4 &= ~(1 << OCIE4A);

#define TIMER3_INTERRUPTS_ON    TIMSK3 |=  (1 << OCIE3A);
#define TIMER3_INTERRUPTS_OFF   TIMSK3 &= ~(1 << OCIE3A);

int T1_FREQ_148 = (Ft1 * 0.676) / 100;         // divided by 100 and scaled by 0.676
long A_SQ = STEP_ANGLE_RADS * 2 * 10000000000; // ALPHA*2*10000000000
long A_T_x100 = STEP_ANGLE_RADS * Ft1 * 100;   // (ALPHA / T1_FREQ)*100
long A_x20000 = STEP_ANGLE_RADS * 20000;
*/

float duration;
volatile byte remaining_motors_byte = 0;

struct stepperInfo {
    // Pins & connection
    int stepPin;
    int dirPin;
    int lim_sw;

    // Positioning variables 
    long currentSteps;
    long targetSteps;
    bool movement_done = false;

    // Angles
    float current_angle;
    float next_angle;
    float target_angle; //degrees 
    float meshwar; //rads
    float accel_lim;
    float max_s_lim;

    // Initial & current delay counters
    double c0;
    double cn;
    double cmin;

    // Velocity profile curve index
    float n;
    
    float remainder;
    // Speed profile parameters
    float alpha; // rad/s2
    float max_speed;  //rad/s
};


