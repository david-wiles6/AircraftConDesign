function CostEst = costEstimation(W_e, MaxV, Qt, engine_cost)
G2 = W_e;
G3 = MaxV;
G4 = Qt;
G5 = 3;
eng_cost = 115;
tool_cost = 118;
qcon_cost = 104;
man_cost = 98;

eng = 4.86*(G2^0.777)*(G3^0.894)*(G4^0.163)*eng_cost;
tool = (5.99*G2^0.777)*(G3^0.696)*(G4^0.263)*tool_cost;
man = (7.37*G2^0.82)*(G3^0.484)*(G4^0.641)*man_cost;
qcon = 0.133*man*qcon_cost/man_cost;
dev_supp = 2.697*((45.42*G2^0.63)*G3^1.3);
flight_test = ((1243.03*G2^0.325)*(G3^0.822)*(G5^1.21))*2.697;
mats = 2.697*((11*G2^0.921)*(G3^0.621)*G4^0.799);
engine = engine_cost*1000;
avionics = 2250000*1000;
CostEst = tool+man+qcon+mats+engine+avionics;
end