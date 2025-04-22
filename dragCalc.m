function [q, CD0, K] = dragCalc(alt, M, S, n, W, AR)

g = 1.4;
R = 287;
planeff = 0.75;
[T, a, P, rho] = atmosisa(alt/3.281);
u = M*sqrt(g*R*T)*3.281; %ft/sec
q = 0.5*rho/515.4*u^2; %slugs/ft*s
K = 1/(pi*AR*planeff);
k_rough = 3.33*10^(-5);
sections = ["Fuselage", "Wing", "Vertical Tail"];
l = [40 16 27.9077/12];
S_wet = [(40*10*pi+2*5^2*pi) S*2 10];
total_Swet = S_wet(1)+S_wet(2)+S_wet(3);
Amax = 29;
sweep = 60;
Cfc = 0;
Cf_total = 0;
if M<=0.8
    CD0 = .0035*total_Swet/S;
    CL = W/(q*S);
    D = (q*S*CD0+K/q*n^2*W^2/S)/sqrt(1-M^2);
elseif M >= 1.21
    for i = 1:length(sections)
        R = 44.62*(l(i)/k_rough)^(1.053)*M^1.16;
        Cfc = .455/(log(R)/log(10)*(1+.144*M^2)^.65);
        Cf_total = Cf_total+Cfc*S_wet(i);
    end
    CD0 = 1.05*(Cf_total/S + 2.5*(1-.386*(M-1.2)^.57)*(1-pi*(sweep^.77)/100)*9*pi/2*(Amax/l(1)));
    D = CD0*q;
else
   CD0 = -1;
   [qmax, maxdrag] = dragCalc(alt, 1.21, S, n, W, AR);
   [qmin, mindrag] = dragCalc(alt, 0.8, S, n, W, AR);
   superCd = maxdrag/qmax;
   subCd = mindrag/qmin;
   %fit curve
   %-b/2a = 1
   % system
   % eqn 1: 1.21^2*a +1.21*b + c = maxdrag
   %eqn 2: 
   A = [1.21^2 1.21 1; 0.8^2 0.8 1; -2 -1 0];
   b = [superCd; subCd; 0];
   d = A\b;
   a = d(1);
   b = d(2);
   c = d(3);
   D = (a*M^2 + b*M + c)/q;

end
%Cd = Cd0 + KCL^2 if M<0.4