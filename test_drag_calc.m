%test drag calc
clear all
Z = 10000;
M = linspace(0.2, 0.89, 100);
for i = 1:length(M)
D(i) = dragCalc(Z, M(i), 350, 5, 20000, 3.5);
end
plot(M, D)