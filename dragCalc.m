function D = dragCalc(alt, M, S, n, W, AR)
C_D0 = 0.028;
g = 1.4;
R = 287;
planeff = 0.7;
[T, a, P, rho] = atmosisa(alt/3.281);
u = M*sqrt(g*R*T)*3.281; %ft/sec
q = 0.5*rho/515.4*u^2; %slugs/ft^3
K = 1/(pi*AR*planeff);
if M<0.9
    D = (q*S*C_D0+K/q*n^2*W^2/S)/sqrt(1-M^2);
else
D = -10000;
end
%Cd = Cd0 + KCL^2 if M<0.4