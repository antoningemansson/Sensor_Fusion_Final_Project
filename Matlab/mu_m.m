function [x, P] = mu_m(x_hat, P_hat, mag, m0, Rm)
    %fk^a = 0 gives:
    h = transpose(Qq(x_hat))*m0;
    [Q0, Q1, Q2, Q3] = dQqdq(x_hat);
    h_prime = [transpose(Q0)*m0 transpose(Q1)*m0 transpose(Q2)*m0 transpose(Q3)*m0];
    
    Sk = h_prime*P_hat*transpose(h_prime) + Rm;
    Kk = P_hat*transpose(h_prime)*inv(Sk);
    x = x_hat + Kk*(mag - h);
    P = P_hat - Kk*Sk*transpose(Kk);
    
end