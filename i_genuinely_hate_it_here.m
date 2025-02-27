weight = DCAPanalysis(TOGW, total_fuel, LDRatio)

%{
DCAP Mission Elements:
Warm up, Takeoff
Accelerate to climb speed
Climb to cruise altitude
Cruise 300 nm optimum speed and alt
Loiter 4 hours best loiter speed and 35000ft
Dash 100 nm Mach 1.6 35000ft
Combat - two 360 deg turns at 18 deg/sec
- one M=1.2
- one M=0.9
Max Thrust and fuel flow
- Drop missiles
Climb to optimum speed + alt
Cruise 400 nm optimum speed and alt
Descend (0 fuel)
30 min reserve max endurance, sea level
%}
% Warm up, Takeoff, Accelerate
Takeoff = 0.025*last_weight(i); %linear change
Accelerate = 0.025*last_weight(i); %linear change
Climb