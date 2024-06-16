#include <Gripper.h>
#include <math.h>
#include <Arduino.h>

void gripper_idle()
{
    digitalWrite(VACUUM_PUMP, HIGH);
    digitalWrite(INTAKE_VALVE, LOW);
    digitalWrite(VACUUM_VALVE, LOW);
    digitalWrite(INTAKE_PUMP, HIGH);
}

void gripper_inflate()
{
    digitalWrite(INTAKE_VALVE, HIGH);
    digitalWrite(VACUUM_VALVE, LOW);
}

void gripper_delate()
{
    digitalWrite(INTAKE_VALVE, LOW);
    digitalWrite(VACUUM_VALVE, HIGH);
}

void gripper_off()
{
    digitalWrite(VACUUM_PUMP,  LOW);
    digitalWrite(INTAKE_VALVE, LOW);
    digitalWrite(VACUUM_VALVE, LOW);
    digitalWrite(INTAKE_PUMP,  LOW);
}

void gripper_hold()
{
    digitalWrite(VACUUM_PUMP,  HIGH);
    digitalWrite(INTAKE_VALVE, LOW);
    digitalWrite(VACUUM_VALVE, LOW);
    digitalWrite(INTAKE_PUMP,  HIGH);
}