function [x, P] = tu_qw_no_omega(x_hat, P_hat, T, Rw)
    
%     G = 1/2*Sq(x_hat)*T; %Is Sq also dependent on w?? Should it be taken away?
%      G taken away since vk is only process noise of omega, without omega
%      no vk either. Without vk, Rw does not exist, so some other noise is
%      needed
    
    Q = T*Rw;

    x = x_hat;
    P = P_hat + Q;
end