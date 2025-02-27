function R = calcTempRankine(altitude)
%alt in feet
%convert meters
altitudeSI = altitude/3.281;
[TSI, a, P, rho] = atmosisa(altitudeSI);
R = TSI*1.8;

end