Vdc = 780;
Pn = 5000;
fg = 50;
wg = 2*pi*fg;
C = (4*Pn)/(4*fg*Vdc^2);
En = 236.6;
Zb = En^2/Pn;
Cb = 1/(wg*Zb);
Imax = (Pn*sqrt(2))/En;
Fsw = 1000;
delta_Imax = Imax*0.1;
L1 = Vdc/(6*Fsw*delta_Imax);
Cf = 0.05*Cb;
L2 = 0.6*L1;
wres = sqrt((L1+L2)/(L1*L2*Cf));
fres = wres/(2*pi);
Rf = 1/(3*Cf*wres);