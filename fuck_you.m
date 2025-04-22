
M = linspace(0, .8, 100);
altitude = linspace(0, 35000, 100);
W = 23000;
S = 594;
n = 1;

for i = 1:length(M)
    for j = 1:length(altitude)
        [T, a, P, rho]= atmosisa(altitude(j));
        V = M(i)*sqrt(1.4*287*T)*3.281;
        q = rho*V^2*.5;
        
        [~, ~, T(i, j), ~, TAB(i, j)] = afterburningTF(M(j), altitude(i)/3.281, .51, 1922, 26, 0.3);
        [q, CD0, K] = dragCalc(altitude(j), M(i), S, n, W, 1.23);
        Ps(i, j) = V*(T(i, j)/W - q*CD0/(W/S) - n^2*K*W/(q*S));
    end
end
figure
contour(M, altitude, Ps')
%Ps = V*(T/W - q*CD0/(W/S) - n^2*K*W/(q*S));
