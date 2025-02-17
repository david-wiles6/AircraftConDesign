%Initial Weight Estimation for an Aircraft

function [WeightEst, W_e] = InitialWeightEst(W_pay, A, C, steps_id, steps_L, steps_V, LDRatio, TSFC, W0_Guess) 
%steps id: 1 for distance based cruise, 2 for distance based dash, 3 for
%time based loiter
epsilon = 100000;
while(epsilon>100)
    R_empty = A*W0_Guess^(C);
    R_takeoff = .97;
    R_climbaccel = .985;
    R_total = 1;
    for ii = 1:length(steps_id)
        if steps_id(ii) == 1
            R(ii) = exp((-steps_L(ii)*0.8*TSFC/3600)/(steps_V(ii)*LDRatio*.866));
        elseif steps_id(ii) == 2
            R(ii) = exp((-steps_L(ii)*0.8*TSFC/3600)/(steps_V(ii)*LDRatio*.866));
        elseif steps_id(ii) == 3
            R(ii) = exp(-steps_L(ii)*TSFC/3600/LDRatio);
        end
        R_total = R(ii)*R_total;
    end
    R_land = .995;
    
    R_f = 1.06*(1-R_takeoff*R_climbaccel*R_total*R_land);
    
    W_new = W_pay/(1-R_empty-R_f);
    epsilon = W_new-W0_Guess;
    if W_new < 0
        W0_Guess = W0_Guess*2;
    else
        W0_Guess = (W_new+W0_Guess)/2;
    end
end
WeightEst = W_new;
W_e = W_new*R_empty;
end