function fuelburn = enduranceEquation(TSFC, LDRatio, W0, time)
%TSFC and time should have the same units
W1 = exp(-TSFC*time/LDRatio)*W0;
fuelburn = W0-W1;