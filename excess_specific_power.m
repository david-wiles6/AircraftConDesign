%excess specific power stuff

% (V*(T*cos(alpha) - D)/W
% T - based on altitude and speed
% alpha
% W 50% fuel
% V done
% D done
altitude = [0 15000];%ft
M = 0.9; % mach
S = 300; %ft^2
T = [26000 35000 35000];
alpha = 3; %deg
V = zeros(length(M), length(altitude));
W = 30000;

for i = 1:length(T)
    for j = 1:length(altitude)
        V = M*sqrt(gamma*R*calcTempRankine(altitude(j)));
        D = 0.5*getCD(M, altitude(j))*getRhoSlugs(altitude(j))*S*V^2;
        T = T(i);
        Spex = V*(T*cosd(alpha)-D)/W;
    end
end

Spex