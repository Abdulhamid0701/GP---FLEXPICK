function [q,qdot,q2dot] = csp_hamz(t,qt0,qtf,delta_t)
t0=0;
tf = t0 + delta_t;

qdott0=0;
qdottf=0;

A=[1 t0  t0^2 t0^3;0 1 2*t0 3*t0^2;1 tf tf^2 tf^3;0 1 2*tf 3*tf^2];
RHS=[qt0;qdott0;qtf;qdottf];

coeffs=inv(A)*RHS;

%t=linspace(t0,tf,100);
q=coeffs(4)*t.^3+coeffs(3)*t.^2+coeffs(2)*t+coeffs(1);
qdot=3*coeffs(4)*t.^2+2*coeffs(3)*t+coeffs(2);
q2dot=6*coeffs(4)*t+2*coeffs(3);
