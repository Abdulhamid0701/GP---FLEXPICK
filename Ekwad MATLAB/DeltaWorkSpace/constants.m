%Some delta robot dimensions & constants
SP = 86.14;    % platform side length
SP = SP*0.5;
SB = 384.14;    % base  side length
L  = 230;    % driver link length
l  = 436;    % driven link length
delta = 89;  % distance between the each pair of driven links
tau = 80;   % distance between the bearing of the driver link's revolute joint

max_beta = pi/6;   % max angle for the spherical joints
min_angle = -pi/6;  % the minimum angle allowed for the motors
max_angle = pi/3;  % the maximum angle allowed for the motors

wB = (SB*sqrt(3))/(6);
uB = (SB*sqrt(3))/(3);
wP = (SP*sqrt(3))/(6);
uP = (SP*sqrt(3))/(3);

delta_2 = delta/2;
tau_2 = tau/2;

a = wB-uP;
b = (SP-sqrt(3)*wB)/2;
c = wP-0.5*wB;