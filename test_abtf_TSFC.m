%TSFC Plots
A = .61;
M = linspace(0, 2, 100);
z = linspace(0, 40000, 200);
for i = 1:length(M)
    for j = 1:length(z)
[~, TSFC(i, j), ~, TSFC_AB(i, j), ~] = afterburningTF(M(i), z(j)/3.281, A, 1922, 26, 0.3);
    end
end
contour(M, z, TSFC'*9.804*3600)
