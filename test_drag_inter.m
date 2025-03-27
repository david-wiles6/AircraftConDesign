% test interpolation 

M = linspace(0.4, 1.6, 500);
Z = linspace(0, 40000, 100);
dragCalc(10000, .89, 594, 1, 24028, 1.23)
dragCalc(10000, 1.21, 594, 1, 24028, 1.23)
for j = 1:length(Z)
for i = 1:length(M)
[q(i, j), D(i, j)] = dragCalc(Z(j), M(i), 594, 1, 24028, 1.23);
end
end
figure
contour(M,Z,D')