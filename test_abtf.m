%test_abtf.m

M = linspace(0.6, 1.6, 100);
Z = linspace(0, 40000/3.281, 100);

for i = 1:length(M)
    for j = 1:length(Z)
        [~, T(i, j), ~, ~] = afterburningTF(M(i), Z(j), 0.5, 1922);
    end
end

surf(M, Z*3.281, T/4.448)
