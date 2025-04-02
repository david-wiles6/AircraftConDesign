function [time, fuelBurn] = rangeEquation(TSFC, V, LDRatio, W0, g, distance)

distance_increment = linspace(0, distance, distance/0.1);

W_final = exp(-distance*TSFC*g/V/LDRatio);
fuelBurn = W0-W_final;
time = distance/V;
%maybe change to an integration from W1 to ending weight

