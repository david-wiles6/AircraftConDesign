%excess specific power stuff

% (V*(T*cos(alpha) - D)/W
% T - based on altitude and speed
% alpha
% W 50% fuel
% V done
% D done
%altitude = [0 15000];%ft
M = 0.9; % mach
S = 300; %ft^2
%T = [26000 35000 35000];
altitude = 0;
T = [26000 35000];
R = 1716;
gamma = 1.4;
alpha = linspace(0, 10, 10); %deg
V = zeros(length(M), length(altitude));
W = 30000;
a0 = 2.578; %rad
lambda = 45*pi/180;
AR = 3.5;
acomp = a0*cos(lambda)/(sqrt(1-M^2*cos(lambda)^2*(a0*cos(lambda)/(pi*AR))^2)+(a0*cos(lambda)/(pi*AR)));
LDRatio = 16;
Cl = acomp*(alpha*pi/180);
%for i = 1:length(T)
%    for j = 1:length(altitude)
V = M*sqrt(gamma*R*calcTempRankine(altitude)); %ft/sec
Cl_min = W/(0.5*calcRhoSlugs(altitude)*S*V^2);
alpha_min = 180/pi*Cl_min/acomp;
%D = 0.5*getCD(M, altitude)*getRhoSlugs(altitude)*S*V^2;
D = CL/LDRatio*0.5*calcRhoSlugs(altitude)*S*V^2;
T = T;
for i = 1:length(T)
Spex(i, :) = V*(T(i)*cosd(alpha)-D)/W;
end
%    end
%end
figure
hold on
xline(alpha_min)
plot(alpha, Spex)
hold off

