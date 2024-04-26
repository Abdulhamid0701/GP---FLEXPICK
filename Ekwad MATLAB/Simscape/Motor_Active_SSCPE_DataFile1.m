% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(7).translation = [0.0 0.0 0.0];
smiData.RigidTransform(7).angle = 0.0;
smiData.RigidTransform(7).axis = [0.0 0.0 0.0];
smiData.RigidTransform(7).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [-42.5 -40 -42.499999999999986];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(1).ID = "B[NEMA344-1:-:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [125.49997999149542 14.991498186703907 4.9999999999999964];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [-0.65313350014892768 0.75724278206082007 1.0928292289595312e-16];
smiData.RigidTransform(2).ID = "F[NEMA344-1:-:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [34.999999999999993 81.207953425837587 6];  % mm
smiData.RigidTransform(3).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = "B[motor_mount-1:-:NEMA344-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-76.999999999999744 -1.7763568394002505e-15 -6.9999999999995195];  % mm
smiData.RigidTransform(4).angle = 3.141592653589778;  % rad
smiData.RigidTransform(4).axis = [7.4971914902150249e-15 0.70710678118654757 -0.70710678118654746];
smiData.RigidTransform(4).ID = "F[motor_mount-1:-:NEMA344-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = "B[motor_mount-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-5.4624867638685091 -29.530402749429793 0];  % mm
smiData.RigidTransform(6).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(6).axis = [1 0 0];
smiData.RigidTransform(6).ID = "F[motor_mount-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [-5.4624867638685091 -29.530402749429793 0];  % mm
smiData.RigidTransform(7).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(7).axis = [-2.775557561562892e-17 1 0];
smiData.RigidTransform(7).ID = "RootGround[motor_mount-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(3).mass = 0.0;
smiData.Solid(3).CoM = [0.0 0.0 0.0];
smiData.Solid(3).MoI = [0.0 0.0 0.0];
smiData.Solid(3).PoI = [0.0 0.0 0.0];
smiData.Solid(3).color = [0.0 0.0 0.0];
smiData.Solid(3).opacity = 0.0;
smiData.Solid(3).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.085157397641516142;  % kg
smiData.Solid(1).CoM = [0 14.213178546630681 31.791303365457367];  % mm
smiData.Solid(1).MoI = [158.8518915503162 169.20043526405411 158.93990875205986];  % kg*mm^2
smiData.Solid(1).PoI = [41.755377902665117 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.20000000000000001 0.20000000000000001 0.20000000000000001];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "motor_mount*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.99907747918618306;  % kg
smiData.Solid(2).CoM = [-42.500566008832088 73.430551981626039 -42.498816205987112];  % mm
smiData.Solid(2).MoI = [2482.0630328794932 1055.1102702441683 2482.0723672565032];  % kg*mm^2
smiData.Solid(2).PoI = [0.13769640721213638 0.00028207391918137422 -0.03869656549115548];  % kg*mm^2
smiData.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "NEMA344*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.10994831810938839;  % kg
smiData.Solid(3).CoM = [23.711141668869569 14.781724835747378 -2.6424537784082738e-05];  % mm
smiData.Solid(3).MoI = [14.014690910636189 862.85098372246136 875.10096586879104];  % kg*mm^2
smiData.Solid(3).PoI = [-3.3489821988086955e-05 -6.4527096550029745e-05 2.1647530807136355];  % kg*mm^2
smiData.Solid(3).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Active Arm 5.0*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the PlanarJoint structure array by filling in null values.
smiData.PlanarJoint(1).Rz.Pos = 0.0;
smiData.PlanarJoint(1).Px.Pos = 0.0;
smiData.PlanarJoint(1).Py.Pos = 0.0;
smiData.PlanarJoint(1).ID = "";

smiData.PlanarJoint(1).Rz.Pos = -179.99999999999997;  % deg
smiData.PlanarJoint(1).Px.Pos = 0;  % mm
smiData.PlanarJoint(1).Py.Pos = 0;  % mm
smiData.PlanarJoint(1).ID = "[motor_mount-1:-:]";

