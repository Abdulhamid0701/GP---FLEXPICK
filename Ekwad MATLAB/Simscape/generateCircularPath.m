function [path, trajectory] = generateCircularPath(center, radius, height, omega, totalTime, numPoints)
    % Generate points on a circle
    theta = linspace(0, 2*pi, numPoints);
    x = center(1) + radius * cos(theta);
    y = center(2) + radius * sin(theta);
    z = height * ones(size(x));
    
    % Combine x, y, z coordinates into path matrix
    path = [x; y; z]';
    
    % Generate time vector for the trajectory
    time = linspace(0, totalTime, numPoints);
    
    % Generate a sinusoidal trajectory for theta
    theta_max = pi/2; % Maximum angle for the circular path
    trajectory = theta_max * sin(omega * time);
end


% % Plot the trajectory
% figure;
% plot(trajectory, 'r-', 'LineWidth', 2);
% xlabel('Time');
% ylabel('Theta');
% title('Theta Trajectory');
% grid on;
