%PDI Mission

%{
Takeoff + accelerate

Climb to 35000 ft, accelerate to max speed

Dash 200 nm at M >= 1.6 35000 ft

Combat (max thrust, fuel flow, 35000 ft, 
    M = 1.2, 360 turn turn rate >= 18 deg/sec?
    M = 0.9, " " " 

Climb to optimum speed + alt

Cruise 200nm opt speed + alt

Descend to sea level

30 min reserve fuel at max endurance, sea level

%}

stages = [0 2 4 0 1 3];
lengths = [35000 200 0 30000 200 0.5*3600];
speeds = [1.6 1.6 1.2 0.8 0.8 0.6];
LDRatio = 14;
W_pay = 1100+2083+681;
[W_est0, W_e] = InitialWeightEst(W_pay, 2.34, -.13, stages, lengths, speeds, LDRatio, .61, 40000)