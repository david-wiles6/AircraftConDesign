function rho = calcRhoSlugs(altitude)
%alt in feet
%convert meters
altitudeSI = altitude/3.281;
[TSI, a, P, rhoSI] = atmosisa(altitudeSI);%rho in kg/m^3
rho = rhoSI*0.00194032; %slugs/ft^3

end