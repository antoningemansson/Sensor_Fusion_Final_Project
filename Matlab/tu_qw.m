function [x, P] = tu_qw(x_hat, P_hat, omega, T, Rw)
    
    F = eye(size(x_hat,1)) + 1/2*Somega(omega)*T;
    G = 1/2*Sq(x_hat)*T;
    
    x = F*x_hat;
    P = F*P_hat*transpose(F) + G*Rw*transpose(G);
end