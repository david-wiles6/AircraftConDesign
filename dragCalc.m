function D = dragCalc(alt, M, S, n, W, AR)
C_D0 = 0.028;
g = 1.4;
R = 287;
planeff = 0.7;
[T, a, P, rho] = atmosisa(alt/3.281);
u = M*sqrt(g*R*T)*3.281; %ft/sec
q = 0.5*rho/515.4*u^2; %slugs/ft^3
K = 1/(pi*AR*planeff);
k_rough = 3.33*10^(-5);
sections = ["Fuselage", "Wing", "Vertical Tail"];
l = [50 14 2.5];
S_wet = [50*5^2*pi S*2, 10]
Cfc = 0;
if M<0.9
    D = (q*S*C_D0+K/q*n^2*W^2/S)/sqrt(1-M^2);
elseif M > 1.2
    C_Dw = 9*pi/2*(A/l)^2;
    for i = 1:length(sections)
        R = 44.62*(l(i)/k_rough)^(1.053)*M^1.16;
        Cfc = Cfc+.455/(log(R)/log(10)*(1+.144*M^2)^.65);
        Cf_total = Cf_total+Cfc*S_wet(i);
    end
    CD0 = 1.05*(Cf_total/S + 2.5*(1-.386*(M-1.2)^.57*(1-pi*sweep^.77/100)*9*pi/2*(Amax/14)))
end
%Cd = Cd0 + KCL^2 if M<0.4