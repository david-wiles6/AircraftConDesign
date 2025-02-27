%calculate and plot excess specific power

% (V*(T*cos(alpha) - D)/W
% T - based on altitude and speed
% alpha
% W 50% fuel
altitude = linspace(0, 30000, 100);%ft
M = linspace(0, 1.6, 100); % mach
S = 300; %ft^2
V = zeros(length(M), length(altitude));
for i = 1:length(M)
    for j = 1:length(altitude)
        V = M(i)*sqrt(gamma*R*calcTempRankine(altitude(j)));
        D = 0.5*getCD(V, altitude(j))*getRhoSlugs(altitude(j))*S*V^2;

    end
end