
% Parameters for DCAP Mission
stages = [1 3 2 1];
lengths = [300*6076.12 4*3600 100*6076.12 400*6076.12];
speeds = [.8*994.8 0 1.6*994.8 0.8*994.8];
engine_costs = linspace(3*10^6, 9.5*10^6, 100);
LDRatios = linspace(12, 25, 100);
for j = 1:length(LDRatios)
   [W_est0(j), W_e(j)] = InitialWeightEst(3900, 2.34, -.13, stages, lengths, speeds, LDRatios(j), .61, 40000);
   Cost_est(j) = costEstimation(W_e(j), 1060, 1000, 9500000);
end
figure
plot(LDRatios, Cost_est/1000000000)
figure
plot(LDRatios, W_est0)
%desired_WsTO = 130;
%S = W_est0/desired_WsTO