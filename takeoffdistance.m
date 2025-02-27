function distance = takeoffdistance(V_TO, TO_Wing_Loading, Cl_TO, Cd, mu, TWRatio, g, rho, Cl_max, TOGW)
% V_TO, TO_Wing_Loading, Cl_TO, Cd, mu, TWRatio, g, rho, Cl_max, TOGW
D = 0.5*Cd*rho*S*(V_TO*.707)^2;
L = 0.5*Cl_TO*rho*S*(V_TO*.707)^2;
S_G = 1.44*(TO_Wing_Loading)/(g*rho*Cl_max*(TWRatio-D/TOGW-mu(1-L/TOGW)));
S_R = 2*V_TO; %ft/sec
distance = S_G;