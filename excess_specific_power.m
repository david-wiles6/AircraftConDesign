%excess specific power stuff
clear all
% (V*(T*cos(alpha) - D)/W
% T - based on altitude and speed
% alpha
% W 50% fuel
% V done
% D done
%altitude = [0 15000];%ft
M = linspace(0, 1.6, 100); % mach
S = 300; %ft^2
%T = [26000 35000 35000];
altitude = linspace(0, 35000, 100);
%altitude = 0;
T0 = 26000;
R = 1716;
gamma = 1.4;
%alpha = linspace(0, 10, 10); %deg
V = zeros(length(M), length(altitude));
W = 30000;
a0 = 2.578; %rad
lambda = 45*pi/180;
AR = 3.5;
acomp = a0*cos(lambda)./(sqrt(1-M.^2*cos(lambda)^2*(a0*cos(lambda)/(pi*AR))^2)+(a0*cos(lambda)/(pi*AR))); %scalar for now
LDRatio = 16;
%Cl = acomp*(alpha*pi/180);
%for i = 1:length(T)
%    for j = 1:length(altitude)


%D = 0.5*getCD(M, altitude)*getRhoSlugs(altitude)*S*V^2;
T = ones(length(altitude), length(M));
T=T*T0;
for i = 1:length(altitude)
    for j = 1:length(M)
        %T(i, j) = (T0-5000)*(1.6-M(j)) + 5000;
        V(i, j) = M(j)*sqrt(gamma*R*calcTempRankine(altitude(i))); %ft/sec
        Cl_min(i, j) = W./(0.5*calcRhoSlugs(altitude(i))*S.*V(i, j).^2);
        alpha_min(i, j) = 180/pi*Cl_min(i, j)/acomp(j);
        D(i, j) = Cl_min(i, j)/LDRatio*0.5.*calcRhoSlugs(altitude(i))*S.*V(i, j).^2;
        Spex(i, j) = V(i, j)*(T(i,j)*cosd(alpha_min(i, j))-D(i, j))/W;
    end
end

%    end
%end
figure
hold on
contour(M, altitude, Spex')
hold off

