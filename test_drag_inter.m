% test interpolation 
clear all
M = linspace(0.4, 1.6, 500);
%Z = linspace(0, 40000, 100);
Z=10000;
for j = 1:length(Z)
for i = 1:length(M)
[CD(i, j), D(i, j), CD0(i, j)] = dragCalc(Z(j), M(i), 594, 1, 24028, 4);
end
end
figure
hold on
plot(M, D)
yl = ylim;
ylim([0, yl(2)]);
hold off
%{
figure
hold on
[C, h] = contour(M, Z, D');
clabel(C, h)
%}