function dy = state_eqs(y, CL, alpha, CD0, K, S, m, g)
    %x = y(0);
    %h = y(1);
    v = y(2);
    gamma = y(3);
    
    L = total_lift(CL, alpha, v);
    D = total_drag(CD0, K, CL, alpha, S, v);
    
    dy = [v*cos(gamma);
          v*sin(gamma);
          -1/m * (L * sin(gamma) + D*cos(gamma));
          -1/m * (m*g - L*cos(gamma) + D*sin(gamma));
          -(D/m + g*sin(gamma));
          (L - m*g*cos(gamma)) / (v*m);];
end

function L = total_lift(CL, alpha, rho, v)
    q = air_density(rho,v);
    L = CL*alpha*S*q;
end

function D = total_drag(CD0, K, CL, alpha, S, rho, v)
    q = air_density(rho,v);
    D = (CD0 + K*(CL*alpha)^2)*S*q;
end

function q = air_density(rho,v)
    q = 0.5*rho*v^2;
end