%% Intelligent Grippe Project | Workspace Formulation Program
% 3D Plotting sub-function


function GrafSpace(A, n)
global R
hold on

plot3(A(:,1), A(:,2), A(:,3),'.','color', [0.5 0 0.5], 'MarkerSize',4)
grid on
title("Intelligent Gripper Project",'FontName','CMU Sans Serif Demi Condensed','FontSize',19)
subtitle("Delta Robot Complete Workspace",'FontName','CMU Sans Serif Demi Condensed','FontSize',19)
xlabel("X - Axis",'Interpreter','latex','FontSize',14)
ylabel("Y - Axis",'Interpreter','latex','FontSize',14)
zlabel("Z - Axis",'Interpreter','latex','FontSize',14)
%plot_darkmode
rotate3d on
axis equal 
xlim([-400 400])
ylim([-400 400])
hold off      

figure
plot3(A(:,1), A(:,2), A(:,3),'.','color', [0.5 0 0.5], 'MarkerSize',4)
grid on
title("Intelligent Gripper Project",'FontName','CMU Sans Serif Demi Condensed','FontSize',20)
subtitle("Delta Robot Selected Work Area",'FontName','CMU Sans Serif Demi Condensed','FontSize',19)
xlabel("X - Axis",'Interpreter','latex','FontSize',14)
ylabel("Y - Axis",'Interpreter','latex','FontSize',14)
zlabel("Z - Axis",'Interpreter','latex','FontSize',14)
%plot_darkmode
rotate3d on
axis equal 
xlim([-200 200])
ylim([-200 200])
zlim([-470 -270])
hold off      

figure
plot(A(:,1), A(:,3),'.','color', [0.5 0 0.5], 'MarkerSize',4)
grid on

