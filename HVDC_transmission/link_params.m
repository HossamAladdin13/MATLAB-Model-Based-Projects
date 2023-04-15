% clear; clc;
Vl_rms_A = 22e3;
Vl_rms_B = 20e3;
R = 10;
mu = 0;
gamma_min = 20;
power_trans = 800e6;
swell = 2.5/100;
Vl_rms_A_swell = Vl_rms_A + Vl_rms_A*swell;
ratio = 10;
V_AC_A = Vl_rms_A*ratio;
V_AC_B = Vl_rms_B*ratio;

% V_AC_A = tapChanger(V_AC_A, -(5/100));
% V_AC_B = tapChanger(V_AC_B, -(2.5/100));

syms I_dc positive;
Vdc_i = ((3*sqrt(2)) / pi) * V_AC_B * cos(gamma_min*(pi/180));
eqn = R*I_dc^2 + Vdc_i*I_dc - power_trans == 0;
soln = solve(eqn,I_dc);
I_dc = double(soln);

alpha_r = acos((power_trans*pi)/(I_dc*3*sqrt(2)*V_AC_A))*(180/pi);
% alpha_i = 180 - gamma_min - mu;
if alpha_r < 5
    alpha_r = 5;
    Vdc_r = ((3*sqrt(2)) / pi) * V_AC_B * cos(alpha_r*(pi/180));
%     V_AC_A = Vdc_r_n / (((3*sqrt(2)) / pi) * cos(alpha_r*(pi/180)));
    Vdc_i = Vdc_r - I_dc*R;
    gamma = acos((Vdc_i*pi)/(3*sqrt(2)*V_AC_A))*(180/pi);
    alpha_i = 180 - gamma - mu;
else
    alpha_i = 180 - gamma_min - mu;
end

function result = tapChanger(Vl_rms, tap)
    result = Vl_rms + Vl_rms*tap;
end
