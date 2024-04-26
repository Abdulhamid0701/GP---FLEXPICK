clc;
num = [0 0 1 0]; 
den = [1 2 1 1];
[a,b,c,d] = tf2ss(num,den);
sys = ss(a,b,c,d);

t = tf(num,den)

paralleldecomposedsys = modalreal(sys)