function [x, P] = mu_g(x_hat, P_hat, yacc, Ra, g0)
    %fk^a = 0 gives:
    h = transpose(Qq(x_hat))*g0;
    [Q0, Q1, Q2, Q3] = dQqdq(x_hat);
    h_prime = [transpose(Q0)*g0 transpose(Q1)*g0 transpose(Q2)*g0 transpose(Q3)*g0];
    
    Sk = h_prime*P_hat*transpose(h_prime) + Ra;
    Kk = P_hat*transpose(h_prime)*inv(Sk);
    x = x_hat + Kk*(yacc - h);
    P = P_hat - Kk*Sk*transpose(Kk);
    
end