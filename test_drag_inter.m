% test interpolation 
clear all
M = linspace(0.4, 1.6, 500);
%Z = linspace(0, 40000, 100);
Z=0;
for j = 1:length(Z)
for i = 1:length(M)
[q(i, j), D(i, j)] = dragCalc(Z(j), M(i), 594, 1, 24028, 4);
end
end
figure
plot(M,D)