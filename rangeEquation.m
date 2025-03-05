function fuelBurn = rangeEquation(TSFC, V, LDRatio, W0, g, distance)

W_final = exp(-distance*TSFC*g/V/LDRatio);
fuelBurn = W0-W_final;