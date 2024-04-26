%% Intelligent Gripper Project | Torque Calculator 
% 
%
%%
% Angles Values
clc;clear;
phi_act = deg2rad(0);
phi_passive = deg2rad(70);
%%
% Linkages' Parameters 
m2_active = 0.109; % active arm mass
m1_passive = 90/1000; % passive arm mass 
m_platform = 161; % end effector mass without payload 
m_gripper_payload = 500; % gripper and payload mass 
M_tot = (1*m_platform) + (2*23) + (4*3.5) + (m_gripper_payload/1); % Total end effector mass
M_tot = M_tot/1000;
g = 9.81;
L = .200; % Active arm length
l = .360; % Passive Arm length 
rb = 103.9/1000;
% all moments of inertia are taken about the motor's axis
I_passive = 0.0047; 
I_active = 0.00574;
I_platform = 0.04;
I_tot = I_active + I_platform + I_passive*(0.25^2)*2;
%%
% Load Torque Calculation 
T_load = m2_active*L*0.5*cos(phi_act) + (m1_passive*(l*cos(phi_passive-phi_act) + L*cos(phi_act))) + M_tot*(L*cos(phi_act) + l*cos(phi_passive - phi_act));
T_load = T_load*g
%%
% Inertial Torque Calculation
acc_max = 5;
T_acc_max = I_tot*acc_max;

T_hold_max = ((2*m1_passive + M_tot)*g*L) + (0.5*L*m2_active*g) + (M_tot*g*rb)
