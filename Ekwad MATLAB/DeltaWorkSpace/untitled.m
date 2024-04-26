den = [-1/14.4513 1]
sys = tf(num,den)
figure 
bode(sys)
title('Bode Plot for Test 2','Interpreter','latex','FontSize',15)
grid on 


den = [0.1 1]
sys = tf(num,den)
figure 
bode(sys)
title('Bode Plot for Test 1','Interpreter','latex','FontSize',15)
grid on