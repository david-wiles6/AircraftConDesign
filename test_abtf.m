%test_abtf.m
clear all
M = linspace(0.2, 1.6, 100);
Z = linspace(0, 40000/3.281, 100);
%Z = 0;
%M = 0.9;

for i = 1:length(M)
    for j = 1:length(Z)
        [u_e(i, j), ~, T(i, j), ~, TAB(i, j)] = afterburningTF(M(i), Z(j), 0.22, 1922, 26, 0.3);
    end
end

%[~, TSFC, T, ~, ~] = afterburningTF(M, Z, 0.5, 1922, 26, 0.3);
% TSFC in SI is kg/N/s
%TSFC_hr = TSFC*3600;
%TSFCImperial = TSFC_hr*9.80665
%TImperial = T/4.448
figure
hold on
%contour(M, Z, T'/4.448)
contour(M, Z, TAB'/4.448)
hold off

