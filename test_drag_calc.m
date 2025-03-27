%test drag calc
clear all
Z = linspace(0, 40000, 100);
M1 = linspace(0.2, 0.89, 100);
M2 = linspace(1.21, 1.7, 100);
M = [M1 M2];
for j = 1:length(Z)
for i = 1:length(M1)
[q1(i, j), D1(i, j)] = dragCalc(Z(j), M1(i), 594, 1, 24028, 1.23);
end
for i = 1:length(M2)
[q2(i, j), D2(i,j)] = dragCalc(Z(j), M2(i), 594, 1, 24028, 1.23);
end
end
figure
hold on
surf(M1,Z, D1')
surf(M2,Z, D2')
hold off

figure
hold on
surf(M1,Z, q1')
surf(M2,Z, q2')
hold off