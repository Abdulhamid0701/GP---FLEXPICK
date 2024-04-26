% Define the square's vertices
vertices = [0 0; 1 0; 1 1; 0 1; 0 0]; % Vertices of the square (A, B, C, D, A)

% Calculate midpoints of the sides
midpoints = (vertices(1:end-1, :) + vertices(2:end, :)) / 2; % Midpoints of the sides

% Assign labels to the points
labels = {'A', 'B', 'C', 'D', 'E'};

% Plot the square and midpoints
figure;
plot(vertices(:, 1), vertices(:, 2), 'b-o'); % Plot the square
hold on;
plot(midpoints(:, 1), midpoints(:, 2), 'r-o'); % Plot the midpoints
text(vertices(:, 1), vertices(:, 2), labels); % Add labels to the points

% Create curved arrows between midpoints
for i = 1:size(midpoints, 1)
    start_point = midpoints(i, :);
    end_point = midpoints(mod(i, size(midpoints, 1)) + 1, :);
    control_point = [end_point(1), start_point(2)];
    
    % Define control points for curved arrow
    x = [start_point(1), control_point(1), end_point(1)];
    y = [start_point(2), control_point(2), end_point(2)];

    annotation('arrow', x, y, 'HeadStyle', 'cback1', 'HeadLength', 10, 'HeadWidth', 8);
end

% Set plot properties
title('Square with Curved Arrows');
xlabel('X-axis');
ylabel('Y-axis');
legend('Square Vertices', 'Midpoints');
grid on;
hold off;
