%excess specific power
clear all
% (V*(T*cos(alpha) - D)/W

M = linspace(0.2, 1.6, 100); % mach
S = 720; %ft^2
altitude = linspace(0, 40000, 200);
R = 1716;
gamma = 1.4;
V = zeros(length(M), length(altitude));

%Takeoff Weight
W_TO = 24028;
W_f = 7810;
%combat weight
W = W_TO-.5*W_f;

% Cl/alpha calcs
a0 = 2.578; %rad
lambda = 60*pi/180;
AR = 1.23;
acomp = a0*cos(lambda)./(sqrt(1-M.^2*cos(lambda)^2*(a0*cos(lambda)/(pi*AR))^2)+(a0*cos(lambda)/(pi*AR))); %scalar for now

for i = 1:length(altitude)
    for j = 1:length(M)
        [~, ~, T(i, j), ~, TAB(i, j)] = afterburningTF(M(j), altitude(i)/3.281, .51, 1922, 26, 0.3);
        V(i, j) = M(j)*sqrt(gamma*R*calcTempRankine(altitude(i))); %ft/sec
        Cl_min(i, j) = W./(0.5*calcRhoSlugs(altitude(i))*S.*V(i, j).^2);
        alpha_min(i, j) = 180/pi*Cl_min(i, j)/acomp(j);
        [q_1g(i, j), D_1g(i, j)] = dragCalc(altitude(i), M(j), S, 1, W, AR);
        [q_1g_TO(i, j), D_1g_TO(i, j)] = dragCalc(altitude(i), M(j), S, 1, W_TO, AR);
        [q_5g(i, j), D_5g(i, j)] = dragCalc(altitude(i), M(j), S, 5, W, AR);
        Spex_1g_Mil(i, j) = V(i, j)*(T(i,j)/4.448*cosd(alpha_min(i, j))-D_1g(i, j))/W;
        Spex_1g_Max(i, j) = V(i, j)*(TAB(i,j)/4.448*cosd(alpha_min(i, j))-D_1g(i, j))/W;
        Spex_5g_Max(i, j) = V(i, j)*(TAB(i,j)/4.448*cosd(alpha_min(i, j))-D_5g(i, j))/W;
        Spex_1g_Max_TO(i, j) = V(i, j)*(TAB(i,j)/4.448*cosd(alpha_min(i, j))-D_1g_TO(i, j))/W_TO;
    end
end

figure("Name","Drag")
hold on
[C, h] = contour(M, altitude, D_1g);
clabel(C, h)
hold off
figure("Name", "1g Military Manuever")
hold on
title("Specific Excess Power (ft/sec) vs Mach Number and Altitude ", sprintf("Maneuver weight at 1g loading condition under military thrust\n"))
%surf(M, altitude, Spex, 'EdgeColor','none')
[C, h] = contour(M, altitude, Spex_1g_Mil);
clabel(C, h)
hold off
figure("Name", "1g Maximum Maneuver")
hold on
title("Specific Excess Power (ft/sec) vs Mach Number and Altitude ", sprintf("Maneuver weight at 1g loading condition under maximum thrust\n"))
%surf(M, altitude, Spex_1g_Max, 'EdgeColor','none')
[C, h] = contour(M, altitude, Spex_1g_Max);
clabel(C, h)
hold off
figure("Name", "5g Maximum Maneuver")
hold on
title("Specific Excess Power (ft/sec) vs Mach Number and Altitude ", sprintf("Maneuver weight at 5g loading condition under maximum thrust\n"))
%surf(M, altitude, Spex, 'EdgeColor','none')
[C, h] = contour(M, altitude, Spex_5g_Max);
clabel(C, h)
hold off
figure("Name", "1g Maximum Takeoff")
hold on
title("Specific Excess Power (ft/sec) vs Mach Number and Altitude", sprintf("Takeoff weight at 1g loading condition under maximum thrust\n"))
%surf(M, altitude, Spex, 'EdgeColor','none')
[C, h] = contour(M, altitude, Spex_1g_Max_TO);
clabel(C, h)
hold off

