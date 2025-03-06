function [TSFC, Thrust, TSFCAB, ThrustAB] = afterburningTF(M, z, )
%
% Engine Simulation ew
A_in = pi*(1^2);
% Flight Conditions

% Altitude and air properties
[Ta, ~, Pa, rhoa] = atmosisa(z);
R = 287; %R/MM

% Speed
g = 1.4;
u = M*sqrt(g*R*Ta);
m_dota = rhoa*A_in*u;
% Inlet
T_02 = Ta*(1 + (g-1)/2*M^2);
n_d = 1;
P_02 = Pa*(1 + n_d*(T_02/Ta-1))^(g/(g-1));

% Fan
B = 0.3;
P_rf = 1.5;
P_08 = P_02 * P_rf;
n_f = 1;
T_08 = T_02 * (1 + (1/n_f)*(P_rf^((g-1)/g)-1));
u_ef = sqrt(2*n_f*g/(g-1)*R*T_08*(1-(Pa/P_08)^((g-1)/g)));

% Compressor
%Input: P_rc
P_rc = 26;
P_03 = P_rc*P_02;
n_c = 1;
T_03 = T_02*(1+(1/n_c)*(P_rc^((g-1)/g)-1));

% Burner
%Input: T_04 (turbine inlet temp)
T_04 = 1922; %K
QR = 42000000; %J/kg
C_p = 1005; %J/kg
f = (T_04/T_03-1)/(QR/(C_p*T_03)-T_04/T_03);
P_04 = P_03;

% Turbine
n_t = 1;
T_05 = T_04 - C_p/(n_c*n_t*C_p)*(T_03-T_02)-B*(T_08-T_02);
P_05 = P_04*(1-1/n_t*(1-T_05/T_04))^(g/(g-1));

% No AB
T_06 = T_05;
P_06 = P_05;

% Afterburner
Tmax_AB = 1700;
T_06AB = Tmax_AB;
P_06AB = P_05;

% Nozzle
n_n = 1;
u_en = sqrt(2*n_n*g/(g-1)*R*T_06*(1-(Pa/P_06)^((g-1)/g)));
u_enAB = sqrt(2*n_n*g/(g-1)*R*T_06AB*(1-(Pa/P_06AB)^((g-1)/g)));

%Thrust
Thrust = m_dota*((1+f)*u_en+B*u_ef-(1+B)*u);
ThrustAB = m_dota*((1+f)*u_enAB+B*u_ef-(1+B)*u);
TSFC = f*m_dota/Thrust;
TSFCAB = f*m_dota/ThrustAB;

end