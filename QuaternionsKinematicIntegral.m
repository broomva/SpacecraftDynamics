clear, clc

beta = [0.408248 0 0.408248 0.816497];

for t=0:0.01:60
    w = [0; sin(0.1*t); 0.01; cos(0.1*t)]*deg2rad(20);
    a = (1/2)*[beta(1) -beta(2) -beta(3) -beta(4); ...
               beta(2) beta(1) -beta(4) beta(3); ...
               beta(3) beta(4) beta(1) -beta(2); ...
               beta(4) -beta(3) beta(2) beta(1)];
    rates = a*w;
    beta(1) = beta(1) + rates(1)*0.01;
    beta(2) = beta(2) + rates(2)*0.01;
    beta(3) = beta(3) + rates(3)*0.01;
    beta(4) = beta(4) + rates(4)*0.01;
    
    if t==42
        norm = sqrt(beta(2)^2+beta(3)^2+beta(4)^2);
        disp(norm);
    end
end