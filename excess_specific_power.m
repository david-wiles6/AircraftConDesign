%excess specific power stuff
clear all
% (V*(T*cos(alpha) - D)/W

M = linspace(0.2, 1.6, 100); % mach
S = 594; %ft^2
altitude = linspace(0, 40000, 200);
R = 1716;
gamma = 1.4;
%alpha = linspace(0, 10, 10); %deg
V = zeros(length(M), length(altitude));
%combat weight
W = 20000;
W_TO = 26704;
a0 = 2.578; %rad
lambda = 60*pi/180;
AR = 1.23;
acomp = a0*cos(lambda)./(sqrt(1-M.^2*cos(lambda)^2*(a0*cos(lambda)/(pi*AR))^2)+(a0*cos(lambda)/(pi*AR))); %scalar for now

%Cl = acomp*(alpha*pi/180);
%for i = 1:length(T)
%    for j = 1:length(altitude)


%D = 0.5*getCD(M, altitude)*getRhoSlugs(altitude)*S*V^2;

for i = 1:length(altitude)
    for j = 1:length(M)
        [~, ~, T(i, j), ~, TAB(i, j)] = afterburningTF(M(j), altitude(i)/3.281, .61, 1922, 26, 0.3);
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

%    end
%end
figure("Name","1g Drag")
hold on 
contour(M, altitude, D_1g)
hold off
figure("Name", "1g Military Manuever")
hold on
%surf(M, altitude, Spex, 'EdgeColor','none')
contour(M, altitude, Spex_1g_Mil)
hold off
figure("Name", "1g Maximum Maneuver")
hold on
%surf(M, altitude, Spex_1g_Max, 'EdgeColor','none')
contour(M, altitude, Spex_1g_Max)
hold off
figure("Name", "5g Maximum Maneuver")
hold on
%surf(M, altitude, Spex, 'EdgeColor','none')
contour(M, altitude, Spex_5g_Max)
hold off
figure("Name", "1g Maximum Takeoff")
hold on
%surf(M, altitude, Spex, 'EdgeColor','none')
contour(M, altitude, Spex_1g_Max_TO)
hold off

