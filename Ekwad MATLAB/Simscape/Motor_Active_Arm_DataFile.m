% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(5).translation = [0.0 0.0 0.0];
smiData.RigidTransform(5).angle = 0.0;
smiData.RigidTransform(5).axis = [0.0 0.0 0.0];
smiData.RigidTransform(5).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 0 0];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(1).ID = "B[Active Arm 5.0-1:-:MOTORPLUSMOUNT-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-256.48419991751604 -20.001454537323283 27.774716864340004];  % mm
smiData.RigidTransform(2).angle = 2.0774580655092763;  % rad
smiData.RigidTransform(2).axis = [-0.57159224862114777 -0.58869737780326481 -0.57159224862114777];
smiData.RigidTransform(2).ID = "F[Active Arm 5.0-1:-:MOTORPLUSMOUNT-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [-130.98067481769249 -48.024956984691102 56.774716864340007];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = "AssemblyGround[MOTORPLUSMOUNT-1:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-88.9806748176903 -43.817003558853223 62.774716864340007];  % mm
smiData.RigidTransform(4).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(4).axis = [1 1.1435297153639111e-14 1.1435297153639111e-14];
smiData.RigidTransform(4).ID = "AssemblyGround[MOTORPLUSMOUNT-1:NEMA344-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 -90.154307640357459 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = "RootGround[MOTORPLUSMOUNT-1]";


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
smiData.Solid(1).mass = 0.10994831810938839;  % kg
smiData.Solid(1).CoM = [23.711141668869569 14.781724835747378 -2.6424537784082738e-05];  % mm
smiData.Solid(1).MoI = [14.014690910636189 862.85098372246136 875.10096586879104];  % kg*mm^2
smiData.Solid(1).PoI = [-3.3489821988086955e-05 -6.4527096550029745e-05 2.1647530807136355];  % kg*mm^2
smiData.Solid(1).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Active Arm 5.0*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.085157397641516142;  % kg
smiData.Solid(2).CoM = [0 14.213178546630681 31.791303365457367];  % mm
smiData.Solid(2).MoI = [158.8518915503162 169.20043526405411 158.93990875205986];  % kg*mm^2
smiData.Solid(2).PoI = [41.755377902665117 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.20000000000000001 0.20000000000000001 0.20000000000000001];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "motor_mount*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.99907747918618306;  % kg
smiData.Solid(3).CoM = [-42.500566008832088 73.430551981626039 -42.498816205987112];  % mm
smiData.Solid(3).MoI = [2482.0630328794932 1055.1102702441683 2482.0723672565032];  % kg*mm^2
smiData.Solid(3).PoI = [0.13769640721213638 0.00028207391918137422 -0.03869656549115548];  % kg*mm^2
smiData.Solid(3).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "NEMA344*:*Default";

