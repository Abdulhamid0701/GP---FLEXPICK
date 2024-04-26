% Define circular trajectory parameters
radius = 180; % Radius of the circle
center = [0, 0, -300]; % Center of the circle
duration = 5; % Duration of the motion

% Generate circular trajectory
time = linspace(0, duration, 1000);
theta = linspace(0, 2*pi, 1000);
x = center(1) + radius * cos(theta);
y = center(2) + radius * sin(theta);
z = center(3) * ones(size(x));


% Interpolate actuator angles
[th1,th2,th3] = interpolate_actuator_angles(x, y, z);

% Simulate the delta robot motion
simOut = sim("Delta_Inshallah_15RAMADAN_Circular.slx", 'StopTime', num2str(duration));

% % Plot the motion
% plot3(simOut.logsout.get('end_effector_position').Values.Data(:,1), ...
%       simOut.logsout.get('end_effector_position').Values.Data(:,2), ...
%       simOut.logsout.get('end_effector_position').Values.Data(:,3));
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('Circular Motion of Delta Robot');

function [th1,th2,th3] = interpolate_actuator_angles(x,y,z)
    % Generate time vector
    t = linspace(0, 1, numel(x));
    
    % Fit cubic splines to x, y, z coordinates
    pp_x = spline(t, x);
    pp_y = spline(t, y);
    pp_z = spline(t, z);
    
    % % Evaluate the splines at finer intervals
    finer_t = linspace(0, 1, 1000);
    interp_x = ppval(pp_x, finer_t);
    interp_y = ppval(pp_y, finer_t);
    interp_z = ppval(pp_z, finer_t);
    % 
    % Calculate actuator angles for each interpolated point
    th1 = zeros(numel(t),1);
    th2 = zeros(numel(t),1);
    th3 = zeros(numel(t),1);
    for i = 1:numel(t)
        % Use inverse kinematics to calculate actuator angles for each point
        [th1(i),th2(i),th3(i)] = IKINEM(interp_x(i), interp_y(i), interp_z(i));
    end
end 