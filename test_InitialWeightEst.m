
% Parameters for DCAP Mission
stages = [1 3 2 1];
lengths = [300*6076.12 4*3600 400*6076.12 400*6076.12];
speeds = [.8*994.8 0 1.6*994.8 0.8*994.8];

W_est0 = InitialWeightEst(3900, 2.34, -.13, stages, lengths, speeds, 15, .81, 40000)

desired_WsTO = 130;
S = W_est0/desired_WsTO