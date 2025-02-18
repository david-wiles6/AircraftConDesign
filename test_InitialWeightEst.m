clear all

% Parameters for DCAP Mission
stages = [1 3 2 1];
lengths = [300*6076.12 4*3600 100*6076.12 400*6076.12];
speeds = [.8*994.8 0 1.6*994.8 0.8*994.8];
engine_costs = linspace(3*10^6, 9.5*10^6, 100);
LDRatios = linspace(12, 25, 100);
W_pay = 1100+2083+681;
for i = 1:length(W_pay)
for j = 1:length(LDRatios)
   [W_est0(i, j), W_e(i, j)] = InitialWeightEst(W_pay(i), 2.34, -.13, stages, lengths, speeds, LDRatios(j), .61, 40000);
   Cost_est(i, j) = costEstimation(W_e(i, j), 1060, 1000, 9500000);
end
end
figure
hold on
ylabel("Cost in Millions of Dollars")
xlabel("L/D Ratio")
plot(LDRatios, Cost_est/1000000000)
hold off
figure
hold on
ylabel("TOGW (lbs)")
xlabel("L/D Ratio")
plot(LDRatios, W_est0)
plot(LDRatios, W_e)
hold off
%{
figure
hold on
ylabel("Cost in Millions of Dollars")
for i = 1:length(W_pay)
plot(LDRatios, Cost_est(i, :)/1000000000)
end
hold off
figure
hold on
%ylabel("TOGW (lbs)")
%for i = 1:length(W_pay)
%plot(LDRatios, W_est0(i, :))
%end
%hold off
%}
%desired_WsTO = 130;
%S = W_est0/desired_WsTO