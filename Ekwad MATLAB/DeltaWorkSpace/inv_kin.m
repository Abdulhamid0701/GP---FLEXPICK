%% Entering coords of end-effector 
x = input("Enter X position of end effector :");
y = input("Enter Y position of end effector :");
z = input("Enter Z position of end effector :");
%% calling get-thetas function
thetaas=get_thetas(x,y,z);
disp(rad2deg(thetaas))