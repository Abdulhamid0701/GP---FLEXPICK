% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(60).translation = [0.0 0.0 0.0];
smiData.RigidTransform(60).angle = 0.0;
smiData.RigidTransform(60).axis = [0.0 0.0 0.0];
smiData.RigidTransform(60).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [-42.5 -40 -42.499999999999986];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(1).ID = "B[Motor_Active_SSCPE:NEMA344-1:-:Motor_Active_SSCPE:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [125.49997999149532 14.991498186703996 5.0000000000000027];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897927;  % rad
smiData.RigidTransform(2).axis = [-1 7.1416094390659181e-32 -2.2956151936342672e-16];
smiData.RigidTransform(2).ID = "F[Motor_Active_SSCPE:NEMA344-1:-:Motor_Active_SSCPE:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [34.999999999999993 81.207953425837587 6];  % mm
smiData.RigidTransform(3).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = "B[Motor_Active_SSCPE:motor_mount-1:-:Motor_Active_SSCPE:NEMA344-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-76.999999999999744 8.8817841970012523e-16 -6.9999999999995266];  % mm
smiData.RigidTransform(4).angle = 3.141592653589778;  % rad
smiData.RigidTransform(4).axis = [7.4971914902150249e-15 0.70710678118654757 -0.70710678118654746];
smiData.RigidTransform(4).ID = "F[Motor_Active_SSCPE:motor_mount-1:-:Motor_Active_SSCPE:NEMA344-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 13.154928527444889 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = "B[145910-DEBearings:rod-end-145910-DEBearings-1:-:145910-DEBearings:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [2.6946972674065372e-15 4.597564488399072e-15 0];  % mm
smiData.RigidTransform(6).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(6).axis = [0 0 1];
smiData.RigidTransform(6).ID = "F[145910-DEBearings:rod-end-145910-DEBearings-1:-:145910-DEBearings:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 400 0];  % mm
smiData.RigidTransform(7).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(7).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(7).ID = "B[Passive Plus RodEnd:PassiveArm 3.0-1:-:Passive Plus RodEnd:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [-2.9432447275063708e-14 -404.84507147255562 -2.9031178381698138e-13];  % mm
smiData.RigidTransform(8).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(8).axis = [-0.57735026918962584 -0.57735026918962595 -0.57735026918962551];
smiData.RigidTransform(8).ID = "F[Passive Plus RodEnd:PassiveArm 3.0-1:-:Passive Plus RodEnd:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [-9.0000000000000071 22.154928527444884 3.3749999999999996];  % mm
smiData.RigidTransform(9).angle = 4.3064815605490902e-16;  % rad
smiData.RigidTransform(9).axis = [1 0 0];
smiData.RigidTransform(9).ID = "B[Passive Plus RodEnd:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [9.0000000000000675 -431.84507147255556 3.3749999999997886];  % mm
smiData.RigidTransform(10).angle = 3.1415926535897913;  % rad
smiData.RigidTransform(10).axis = [1.110223024625156e-16 -8.4465009242753799e-17 -1];
smiData.RigidTransform(10).ID = "F[Passive Plus RodEnd:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [0 -4.8450714725551123 0];  % mm
smiData.RigidTransform(11).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(11).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(11).ID = "B[Passive Plus RodEnd:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd:PassiveArm 3.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(12).translation = [-3.5648217303649391e-14 400 1.095447626049566e-13];  % mm
smiData.RigidTransform(12).angle = 2.0943951023931944;  % rad
smiData.RigidTransform(12).axis = [-0.57735026918962551 -0.57735026918962651 -0.57735026918962518];
smiData.RigidTransform(12).ID = "F[Passive Plus RodEnd:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd:PassiveArm 3.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(13).translation = [0 0 0];  % mm
smiData.RigidTransform(13).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(13).axis = [0.96592582628906765 0 -0.25881904510252335];
smiData.RigidTransform(13).ID = "B[BasePlatform 3.0-1:-:Motor_Active_SSCPE-3:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(14).translation = [214.55672385628259 -46.406456764596911 9.0949470177292824e-13];  % mm
smiData.RigidTransform(14).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(14).axis = [1 3.0749537793206642e-31 1.8855633445868337e-15];
smiData.RigidTransform(14).ID = "F[BasePlatform 3.0-1:-:Motor_Active_SSCPE-3:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(15).translation = [0 7.5 0];  % mm
smiData.RigidTransform(15).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(15).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(15).ID = "B[BasePlatform 3.0-1:-:Motor_Active_SSCPE-3:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(16).translation = [-90.000000000000085 -6.0420465741643543 -28.999999999999922];  % mm
smiData.RigidTransform(16).angle = 1.8234765819369729;  % rad
smiData.RigidTransform(16).axis = [-0.77459666924148518 0.44721359549995643 0.44721359549995648];
smiData.RigidTransform(16).ID = "F[BasePlatform 3.0-1:-:Motor_Active_SSCPE-3:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(17).translation = [0 0 0];  % mm
smiData.RigidTransform(17).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(17).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(17).ID = "B[BasePlatform 3.0-1:-:Motor_Active_SSCPE-2:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(18).translation = [198.98484881075365 -64.385995818943897 2.8421709430404007e-14];  % mm
smiData.RigidTransform(18).angle = 3.1415926535897922;  % rad
smiData.RigidTransform(18).axis = [-1 6.196282057937668e-32 -1.3530317449682415e-16];
smiData.RigidTransform(18).ID = "F[BasePlatform 3.0-1:-:Motor_Active_SSCPE-2:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(19).translation = [0 7.5 0];  % mm
smiData.RigidTransform(19).angle = 0;  % rad
smiData.RigidTransform(19).axis = [0 0 0];
smiData.RigidTransform(19).ID = "B[BasePlatform 3.0-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(20).translation = [6.9896341035119846e-12 1.7908341476413625e-11 1.4417360125860503e-11];  % mm
smiData.RigidTransform(20).angle = 0;  % rad
smiData.RigidTransform(20).axis = [0 0 0];
smiData.RigidTransform(20).ID = "F[BasePlatform 3.0-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(21).translation = [0 7.5 0];  % mm
smiData.RigidTransform(21).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(21).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(21).ID = "B[BasePlatform 3.0-1:-:Motor_Active_SSCPE-1:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(22).translation = [-90 -6.0420465741644156 -28.99999999999973];  % mm
smiData.RigidTransform(22).angle = 1.8234765819369734;  % rad
smiData.RigidTransform(22).axis = [-0.77459666924148507 -0.44721359549995643 -0.44721359549995621];
smiData.RigidTransform(22).ID = "F[BasePlatform 3.0-1:-:Motor_Active_SSCPE-1:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(23).translation = [0 0 0];  % mm
smiData.RigidTransform(23).angle = 0.5235987755983037;  % rad
smiData.RigidTransform(23).axis = [-0 -1 0];
smiData.RigidTransform(23).ID = "B[BasePlatform 3.0-1:-:Motor_Active_SSCPE-1:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(24).translation = [186.11626725375243 -74.599116380558499 -3.1263880373444408e-13];  % mm
smiData.RigidTransform(24).angle = 3.1415926535897927;  % rad
smiData.RigidTransform(24).axis = [-1 -2.9414558881700929e-31 1.0775731062812234e-15];
smiData.RigidTransform(24).ID = "F[BasePlatform 3.0-1:-:Motor_Active_SSCPE-1:Active Arm 5.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(25).translation = [0 7.5 0];  % mm
smiData.RigidTransform(25).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(25).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(25).ID = "B[BasePlatform 3.0-1:-:Motor_Active_SSCPE-2:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(26).translation = [-90 -6.0420465741644085 -29.000000000000043];  % mm
smiData.RigidTransform(26).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(26).axis = [-4.5698073364484234e-17 -0.70710678118654757 -0.70710678118654757];
smiData.RigidTransform(26).ID = "F[BasePlatform 3.0-1:-:Motor_Active_SSCPE-2:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(27).translation = [0 44.500000000000014 0];  % mm
smiData.RigidTransform(27).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(27).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(27).ID = "B[Bottom_Connecting_Rod-1:-:Passive Plus RodEnd-3:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(28).translation = [1.5232259897857148e-13 -1.028066520802895e-13 4.4999999999992362];  % mm
smiData.RigidTransform(28).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(28).axis = [-1 -3.4461071417672309e-33 3.8962953270476361e-17];
smiData.RigidTransform(28).ID = "F[Bottom_Connecting_Rod-1:-:Passive Plus RodEnd-3:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(29).translation = [-124.50002000850463 14.991498186703895 5.0000000000000044];  % mm
smiData.RigidTransform(29).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(29).axis = [1 0 -8.3266726846886741e-17];
smiData.RigidTransform(29).ID = "B[Motor_Active_SSCPE-1:Active Arm 5.0-1:-:Bottom_Connecting_Rod-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(30).translation = [-3.8191672047105385e-14 -4.9999999999998854 -1.3145040611561853e-13];  % mm
smiData.RigidTransform(30).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(30).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(30).ID = "F[Motor_Active_SSCPE-1:Active Arm 5.0-1:-:Bottom_Connecting_Rod-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(31).translation = [0 44.500000000000014 0];  % mm
smiData.RigidTransform(31).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(31).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(31).ID = "B[Bottom_Connecting_Rod-1:-:Passive Plus RodEnd-4:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(32).translation = [7.1054273576010019e-14 -6.7501559897209518e-14 84.500000000000199];  % mm
smiData.RigidTransform(32).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(32).axis = [-1 -2.2449850330796863e-32 2.1224884576392887e-16];
smiData.RigidTransform(32).ID = "F[Bottom_Connecting_Rod-1:-:Passive Plus RodEnd-4:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(33).translation = [0 44.5 0];  % mm
smiData.RigidTransform(33).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(33).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(33).ID = "B[Bottom_Connecting_Rod-2:-:Passive Plus RodEnd-5:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(34).translation = [4.2632564145606011e-14 -6.2172489379008766e-14 84.499999999999986];  % mm
smiData.RigidTransform(34).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(34).axis = [-1 -1.0140617246178697e-32 9.1303067577436191e-17];
smiData.RigidTransform(34).ID = "F[Bottom_Connecting_Rod-2:-:Passive Plus RodEnd-5:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(35).translation = [-124.50002000850466 14.991498186703902 5];  % mm
smiData.RigidTransform(35).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(35).axis = [1 0 0];
smiData.RigidTransform(35).ID = "B[Motor_Active_SSCPE-2:Active Arm 5.0-1:-:Bottom_Connecting_Rod-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(36).translation = [2.9309887850104133e-14 -4.9999999999999654 -8.2821682284923095e-16];  % mm
smiData.RigidTransform(36).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(36).axis = [-0.57735026918962584 -0.57735026918962573 -0.57735026918962573];
smiData.RigidTransform(36).ID = "F[Motor_Active_SSCPE-2:Active Arm 5.0-1:-:Bottom_Connecting_Rod-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(37).translation = [0 44.5 0];  % mm
smiData.RigidTransform(37).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(37).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(37).ID = "B[Bottom_Connecting_Rod-2:-:Passive Plus RodEnd-6:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(38).translation = [-1.4210854715202004e-14 -2.19824158875781e-14 4.4999999999999813];  % mm
smiData.RigidTransform(38).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(38).axis = [-1 7.6077078635259885e-34 -5.4871105968376586e-17];
smiData.RigidTransform(38).ID = "F[Bottom_Connecting_Rod-2:-:Passive Plus RodEnd-6:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(39).translation = [-124.50002000850466 14.991498186703902 5.0000000000000044];  % mm
smiData.RigidTransform(39).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(39).axis = [1 0 0];
smiData.RigidTransform(39).ID = "B[Motor_Active_SSCPE-3:Active Arm 5.0-1:-:Bottom_Connecting_Rod-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(40).translation = [2.6498803151753236e-12 -5.0000000000158966 -1.5578649481540197e-12];  % mm
smiData.RigidTransform(40).angle = 2.0943951023931917;  % rad
smiData.RigidTransform(40).axis = [-0.57735026918962462 -0.57735026918962618 -0.57735026918962662];
smiData.RigidTransform(40).ID = "F[Motor_Active_SSCPE-3:Active Arm 5.0-1:-:Bottom_Connecting_Rod-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(41).translation = [0 44.5 0];  % mm
smiData.RigidTransform(41).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(41).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(41).ID = "B[Bottom_Connecting_Rod-3:-:Passive Plus RodEnd-1:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(42).translation = [1.8700596626786137e-12 2.0827783941967937e-13 -4.5000000000176614];  % mm
smiData.RigidTransform(42).angle = 9.5383924522349679e-16;  % rad
smiData.RigidTransform(42).axis = [0.65738662228011124 0.75355346780911736 2.3625452014372495e-16];
smiData.RigidTransform(42).ID = "F[Bottom_Connecting_Rod-3:-:Passive Plus RodEnd-1:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(43).translation = [0 44.5 0];  % mm
smiData.RigidTransform(43).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(43).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(43).ID = "B[Bottom_Connecting_Rod-3:-:Passive Plus RodEnd-2:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(44).translation = [1.1588952020247234e-11 4.936495656693296e-12 -84.500000000057653];  % mm
smiData.RigidTransform(44).angle = 2.5152126513126472e-15;  % rad
smiData.RigidTransform(44).axis = [0.16635684262292988 0.98606561694064243 2.0629618556559709e-16];
smiData.RigidTransform(44).ID = "F[Bottom_Connecting_Rod-3:-:Passive Plus RodEnd-2:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(45).translation = [-5.4624867638684984 -29.530402749429783 0];  % mm
smiData.RigidTransform(45).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(45).axis = [0 1 0];
smiData.RigidTransform(45).ID = "AssemblyGround[Motor_Active_SSCPE-1:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(46).translation = [-5.4624867638684851 -29.530402749429776 0];  % mm
smiData.RigidTransform(46).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(46).axis = [0 1 0];
smiData.RigidTransform(46).ID = "AssemblyGround[Motor_Active_SSCPE-3:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(47).translation = [-5.4624867638685126 -29.530402749429793 0];  % mm
smiData.RigidTransform(47).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(47).axis = [-2.775557561562892e-17 1 0];
smiData.RigidTransform(47).ID = "AssemblyGround[Motor_Active_SSCPE-2:motor_mount-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(48).translation = [0 13.154928527444889 0];  % mm
smiData.RigidTransform(48).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(48).axis = [2.9800918363695129e-17 4.0859492978348291e-17 -1];
smiData.RigidTransform(48).ID = "AssemblyGround[Passive Plus RodEnd-2:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(49).translation = [0 13.15492852744493 0];  % mm
smiData.RigidTransform(49).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(49).axis = [-0 -0 -1];
smiData.RigidTransform(49).ID = "AssemblyGround[Passive Plus RodEnd-2:145910-DEBearings-2:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(50).translation = [0 13.154928527444897 0];  % mm
smiData.RigidTransform(50).angle = 2.6114459642205743;  % rad
smiData.RigidTransform(50).axis = [-4.2993375256435341e-17 1.0348773775685214e-16 -1];
smiData.RigidTransform(50).ID = "AssemblyGround[Passive Plus RodEnd-1:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(51).translation = [0 13.15492852744493 0];  % mm
smiData.RigidTransform(51).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(51).axis = [-0 -0 -1];
smiData.RigidTransform(51).ID = "AssemblyGround[Passive Plus RodEnd-1:145910-DEBearings-2:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(52).translation = [6.9896341035119846e-12 -7.4999999999820917 1.4417360125860503e-11];  % mm
smiData.RigidTransform(52).angle = 0;  % rad
smiData.RigidTransform(52).axis = [0 0 0];
smiData.RigidTransform(52).ID = "RootGround[BasePlatform 3.0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(53).translation = [0 13.154928527444882 0];  % mm
smiData.RigidTransform(53).angle = 2.6114459642205743;  % rad
smiData.RigidTransform(53).axis = [-1.1340498566954076e-16 8.8418608345525161e-17 -1];
smiData.RigidTransform(53).ID = "AssemblyGround[Passive Plus RodEnd-4:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(54).translation = [0 13.15492852744493 0];  % mm
smiData.RigidTransform(54).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(54).axis = [2.9800918363695135e-17 -0 -1];
smiData.RigidTransform(54).ID = "AssemblyGround[Passive Plus RodEnd-4:145910-DEBearings-2:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(55).translation = [0 13.154928527444889 0];  % mm
smiData.RigidTransform(55).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(55).axis = [-0 -0 -1];
smiData.RigidTransform(55).ID = "AssemblyGround[Passive Plus RodEnd-6:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(56).translation = [0 13.154928527444904 0];  % mm
smiData.RigidTransform(56).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(56).axis = [-0 -0 -1];
smiData.RigidTransform(56).ID = "AssemblyGround[Passive Plus RodEnd-6:145910-DEBearings-2:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(57).translation = [0 13.154928527444889 0];  % mm
smiData.RigidTransform(57).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(57).axis = [-0 -0 -1];
smiData.RigidTransform(57).ID = "AssemblyGround[Passive Plus RodEnd-3:145910-DEBearings-1:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(58).translation = [0 13.154928527444987 0];  % mm
smiData.RigidTransform(58).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(58).axis = [-0 2.7007082267098711e-17 -1];
smiData.RigidTransform(58).ID = "AssemblyGround[Passive Plus RodEnd-3:145910-DEBearings-2:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(59).translation = [0 13.154928527444849 0];  % mm
smiData.RigidTransform(59).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(59).axis = [3.1978082603505716e-17 6.9307283574908459e-17 -1];
smiData.RigidTransform(59).ID = "AssemblyGround[Passive Plus RodEnd-5:145910-DEBearings-2:joint-145910-DEBearings-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(60).translation = [0 13.154928527444895 0];  % mm
smiData.RigidTransform(60).angle = 2.6114459642205747;  % rad
smiData.RigidTransform(60).axis = [-0 -0 -1];
smiData.RigidTransform(60).ID = "AssemblyGround[Passive Plus RodEnd-5:145910-DEBearings-1:joint-145910-DEBearings-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(8).mass = 0.0;
smiData.Solid(8).CoM = [0.0 0.0 0.0];
smiData.Solid(8).MoI = [0.0 0.0 0.0];
smiData.Solid(8).PoI = [0.0 0.0 0.0];
smiData.Solid(8).color = [0.0 0.0 0.0];
smiData.Solid(8).opacity = 0.0;
smiData.Solid(8).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.085157397641516128;  % kg
smiData.Solid(1).CoM = [0 14.213178546630676 31.791303365457345];  % mm
smiData.Solid(1).MoI = [158.85189155031611 169.20043526405411 158.93990875205981];  % kg*mm^2
smiData.Solid(1).PoI = [41.755377902665131 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.20000000000000001 0.20000000000000001 0.20000000000000001];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "motor_mount*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.99907747918618317;  % kg
smiData.Solid(2).CoM = [-42.500566008832095 73.430551981626039 -42.498816205987112];  % mm
smiData.Solid(2).MoI = [2482.0630328794932 1055.1102702441683 2482.0723672565032];  % kg*mm^2
smiData.Solid(2).PoI = [0.13769640721219165 0.00028207391917997533 -0.038696565491097672];  % kg*mm^2
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

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.018792667955346169;  % kg
smiData.Solid(4).CoM = [0 -0.76831105366636021 0];  % mm
smiData.Solid(4).MoI = [11.290488262712755 0.088348662028308989 11.290488262712755];  % kg*mm^2
smiData.Solid(4).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(4).color = [0.77647058823529413 0.75686274509803919 0.73725490196078436];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "Bottom_Connecting_Rod*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.088894504595003448;  % kg
smiData.Solid(5).CoM = [0 199.99999999999997 0];  % mm
smiData.Solid(5).MoI = [1185.4600739020511 0.40002527067751581 1185.4600739020511];  % kg*mm^2
smiData.Solid(5).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(5).color = [0.77647058823529413 0.75686274509803919 0.73725490196078436];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = "PassiveArm 3.0*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(6).mass = 0.0054185656423743509;  % kg
smiData.Solid(6).CoM = [0 0 0];  % mm
smiData.Solid(6).MoI = [0.088212096580643259 0.088212096580643259 0.11936816206102958];  % kg*mm^2
smiData.Solid(6).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(6).color = [0.89803921568627454 0.89803921568627454 0.89803921568627454];
smiData.Solid(6).opacity = 1;
smiData.Solid(6).ID = "joint-145910-DEBearings*:*145910-DEBearings";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(7).mass = 0.019971933752691497;  % kg
smiData.Solid(7).CoM = [-0.0017843464209906796 0.38736530037894368 -6.8316610302626254e-08];  % mm
smiData.Solid(7).MoI = [2.5929991009318574 0.45399950797098493 2.8071729176858482];  % kg*mm^2
smiData.Solid(7).PoI = [-1.2582534719692821e-09 -1.3273941763400694e-05 -9.674417964758688e-05];  % kg*mm^2
smiData.Solid(7).color = [0.52941176470588236 0.5490196078431373 0.5490196078431373];
smiData.Solid(7).opacity = 1;
smiData.Solid(7).ID = "rod-end-145910-DEBearings*:*145910-DEBearings";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(8).mass = 4.5293042714461542;  % kg
smiData.Solid(8).CoM = [0 0 0];  % mm
smiData.Solid(8).MoI = [46261.961927891673 92291.400172212132 46199.287154499681];  % kg*mm^2
smiData.Solid(8).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(8).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(8).opacity = 1;
smiData.Solid(8).ID = "BasePlatform 3.0*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the PlanarJoint structure array by filling in null values.
smiData.PlanarJoint(3).Rz.Pos = 0.0;
smiData.PlanarJoint(3).Px.Pos = 0.0;
smiData.PlanarJoint(3).Py.Pos = 0.0;
smiData.PlanarJoint(3).ID = "";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.PlanarJoint(1).Rz.Pos = -1.370740866327139;  % deg
smiData.PlanarJoint(1).Px.Pos = 0;  % mm
smiData.PlanarJoint(1).Py.Pos = 0;  % mm
smiData.PlanarJoint(1).ID = "[BasePlatform 3.0-1:-:Motor_Active_SSCPE-3:Active Arm 5.0-1]";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.PlanarJoint(2).Rz.Pos = 76.005036544386357;  % deg
smiData.PlanarJoint(2).Px.Pos = 0;  % mm
smiData.PlanarJoint(2).Py.Pos = 0;  % mm
smiData.PlanarJoint(2).ID = "[BasePlatform 3.0-1:-:Motor_Active_SSCPE-2:Active Arm 5.0-1]";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.PlanarJoint(3).Rz.Pos = 157.2945786520913;  % deg
smiData.PlanarJoint(3).Px.Pos = 0;  % mm
smiData.PlanarJoint(3).Py.Pos = 0;  % mm
smiData.PlanarJoint(3).ID = "[BasePlatform 3.0-1:-:Motor_Active_SSCPE-1:Active Arm 5.0-1]";


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(24).Rz.Pos = 0.0;
smiData.RevoluteJoint(24).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 67.294578652090095;  % deg
smiData.RevoluteJoint(1).ID = "[Motor_Active_SSCPE-1:NEMA344-1:-:Motor_Active_SSCPE-1:Active Arm 5.0-1]";

smiData.RevoluteJoint(2).Rz.Pos = 88.629259133671653;  % deg
smiData.RevoluteJoint(2).ID = "[Motor_Active_SSCPE-3:NEMA344-1:-:Motor_Active_SSCPE-3:Active Arm 5.0-1]";

smiData.RevoluteJoint(3).Rz.Pos = 76.005036544385135;  % deg
smiData.RevoluteJoint(3).ID = "[Motor_Active_SSCPE-2:NEMA344-1:-:Motor_Active_SSCPE-2:Active Arm 5.0-1]";

smiData.RevoluteJoint(4).Rz.Pos = -1.7938441188726668e-13;  % deg
smiData.RevoluteJoint(4).ID = "[Passive Plus RodEnd-2:PassiveArm 3.0-1:-:Passive Plus RodEnd-2:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

smiData.RevoluteJoint(5).Rz.Pos = 7.6597900019727072e-14;  % deg
smiData.RevoluteJoint(5).ID = "[Passive Plus RodEnd-2:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd-2:PassiveArm 3.0-1]";

smiData.RevoluteJoint(6).Rz.Pos = -3.4075008807433197e-13;  % deg
smiData.RevoluteJoint(6).ID = "[Passive Plus RodEnd-1:PassiveArm 3.0-1:-:Passive Plus RodEnd-1:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

smiData.RevoluteJoint(7).Rz.Pos = -6.1735541336342387e-13;  % deg
smiData.RevoluteJoint(7).ID = "[Passive Plus RodEnd-1:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd-1:PassiveArm 3.0-1]";

smiData.RevoluteJoint(8).Rz.Pos = -5.5088823045458551e-14;  % deg
smiData.RevoluteJoint(8).ID = "[Passive Plus RodEnd-4:PassiveArm 3.0-1:-:Passive Plus RodEnd-4:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

smiData.RevoluteJoint(9).Rz.Pos = -2.0365486769359555e-14;  % deg
smiData.RevoluteJoint(9).ID = "[Passive Plus RodEnd-4:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd-4:PassiveArm 3.0-1]";

smiData.RevoluteJoint(10).Rz.Pos = 2.5444437451708125e-14;  % deg
smiData.RevoluteJoint(10).ID = "[Passive Plus RodEnd-6:PassiveArm 3.0-1:-:Passive Plus RodEnd-6:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

smiData.RevoluteJoint(11).Rz.Pos = -1.1467652988433741e-14;  % deg
smiData.RevoluteJoint(11).ID = "[Passive Plus RodEnd-6:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd-6:PassiveArm 3.0-1]";

smiData.RevoluteJoint(12).Rz.Pos = 4.5980745634362126e-14;  % deg
smiData.RevoluteJoint(12).ID = "[Passive Plus RodEnd-3:PassiveArm 3.0-1:-:Passive Plus RodEnd-3:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

smiData.RevoluteJoint(13).Rz.Pos = -4.5427407241477191e-14;  % deg
smiData.RevoluteJoint(13).ID = "[Passive Plus RodEnd-3:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd-3:PassiveArm 3.0-1]";

smiData.RevoluteJoint(14).Rz.Pos = 3.8166656177562189e-14;  % deg
smiData.RevoluteJoint(14).ID = "[Passive Plus RodEnd-5:PassiveArm 3.0-1:-:Passive Plus RodEnd-5:145910-DEBearings-2:rod-end-145910-DEBearings-1]";

smiData.RevoluteJoint(15).Rz.Pos = -9.5416640443905471e-15;  % deg
smiData.RevoluteJoint(15).ID = "[Passive Plus RodEnd-5:145910-DEBearings-1:rod-end-145910-DEBearings-1:-:Passive Plus RodEnd-5:PassiveArm 3.0-1]";

smiData.RevoluteJoint(16).Rz.Pos = 89.624832176311074;  % deg
smiData.RevoluteJoint(16).ID = "[Bottom_Connecting_Rod-1:-:Passive Plus RodEnd-3:145910-DEBearings-1:joint-145910-DEBearings-1]";

smiData.RevoluteJoint(17).Rz.Pos = 142.70542134790907;  % deg
smiData.RevoluteJoint(17).ID = "[Motor_Active_SSCPE-1:Active Arm 5.0-1:-:Bottom_Connecting_Rod-1]";

smiData.RevoluteJoint(18).Rz.Pos = -94.089601109768765;  % deg
smiData.RevoluteJoint(18).ID = "[Bottom_Connecting_Rod-1:-:Passive Plus RodEnd-4:145910-DEBearings-1:joint-145910-DEBearings-1]";

smiData.RevoluteJoint(19).Rz.Pos = -30.375167823689335;  % deg
smiData.RevoluteJoint(19).ID = "[Bottom_Connecting_Rod-2:-:Passive Plus RodEnd-5:145910-DEBearings-1:joint-145910-DEBearings-1]";

smiData.RevoluteJoint(20).Rz.Pos = 13.994963455613636;  % deg
smiData.RevoluteJoint(20).ID = "[Motor_Active_SSCPE-2:Active Arm 5.0-1:-:Bottom_Connecting_Rod-2]";

smiData.RevoluteJoint(21).Rz.Pos = -30.375167823689335;  % deg
smiData.RevoluteJoint(21).ID = "[Bottom_Connecting_Rod-2:-:Passive Plus RodEnd-6:145910-DEBearings-1:joint-145910-DEBearings-1]";

smiData.RevoluteJoint(22).Rz.Pos = -145.77984250490931;  % deg
smiData.RevoluteJoint(22).ID = "[Motor_Active_SSCPE-3:Active Arm 5.0-1:-:Bottom_Connecting_Rod-3]";

smiData.RevoluteJoint(23).Rz.Pos = 65.469957742890699;  % deg
smiData.RevoluteJoint(23).ID = "[Bottom_Connecting_Rod-3:-:Passive Plus RodEnd-1:145910-DEBearings-1:joint-145910-DEBearings-1]";

smiData.RevoluteJoint(24).Rz.Pos = 63.224584452452795;  % deg
smiData.RevoluteJoint(24).ID = "[Bottom_Connecting_Rod-3:-:Passive Plus RodEnd-2:145910-DEBearings-1:joint-145910-DEBearings-1]";

