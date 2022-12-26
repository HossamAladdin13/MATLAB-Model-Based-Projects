alpha1 = 20*pi/180;
alpha2 = 30*pi/180;
initial = [alpha1; alpha2];
syms x1 x2
fy1 = [1-2*cos(3*x1)+2*cos(3*x2)];
fy2 = [1-2*cos(5*x1)+2*cos(5*x2)];
fun_initial = [1-2*cos(3*alpha1)+2*cos(3*alpha2); 1-2*cos(5*alpha1)+2*cos(5*alpha2)];
j = [subs(diff(fy1,x1),x1,alpha1) subs(diff(fy1,x2),x2,alpha2); 
     subs(diff(fy2,x1),x1,alpha1) subs(diff(fy2,x2),x2,alpha2)];
j = double(j);
jinv = inv(j);
alpha_new = (initial-jinv*fun_initial)*180/pi;
t1 = alpha_new(1)*t/360;
t2 = alpha_new(2)*t/360;
to = 1e-9;