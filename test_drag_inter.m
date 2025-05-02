% test interpolation 
clear all
M = linspace(0.5, 1.6, 500);
Z = linspace(0, 40000, 100);
%Z=10000;
for j = 1:length(Z)
for i = 1:length(M)
[CD(i, j), D(i, j), CD0(i, j)] = dragCalc(Z(j), M(i), 594, 1, 24028, 4);
end
end
if length(Z)==1
figure
hold on
plot(M, D)
yl = ylim;
ylim([0, yl(2)]);
hold off
else

figure
hold on
title("Drag vs Mach Number and Altitude")
xlabel("Mach Number")
ylabel("Altitude (ft)")
[C, h] = contour(M, Z, D');
clabel(C, h)
hold off
end