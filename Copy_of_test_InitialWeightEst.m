
% Parameters for DCAP Mission
stages = [1 3 2 1];
lengths = [300*6076.12 4*3600 100*6076.12 400*6076.12];
speeds = [.8*994.8 0 2.2*994.8 0.8*994.8];

W_est0 = InitialWeightEst(3800, 2.34, -.13, stages, lengths, speeds, 13.8, .61, 1.74, 40000)

desired_WsTO = 77.2;
S = W_est0/desired_WsTO