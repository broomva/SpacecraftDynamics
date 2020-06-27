% Modified Rodrigues Parameters Differential Kinematic Equation Integral

clear, clc


% q = c(1)^2 + c(2)^2 + c(3)^2;
% C = (1/(1+cigs^2)^2)*[(c(1)^2-c(2)^2-c(3)^2)+(1-cigs^2)^2 8*c(1)*c(2)+4*c(3)*(1-cigs^2) 8*c(1)*c(3)-4*c(2)*(1-cigs^2); ...
%                8*c(2)*c(1)-4*c(3)*(1-cigs^2) 4*(-c(1)^2+c(2)^2-c(3)^2)+(1-cigs^2)^2 8*c(2)*c(3)+4*c(1)*(1-cigs^2); ...
%                8*c(3)*c(1)+4*c(2)*(1-cigs^2) 8*c(3)*c(2)-4*c(1)*(1-cigs^2) 4*(-c(1)^2-c(2)^2+c(3)^2)+(1-cigs^2)^2];


co = [0.4 0.2 -0.1];
c = co;
q = sqrt(c(1)^2 + c(2)^2 + c(3)^2);

for t=0:0.01:60
    w = [sin(0.1*t); 0.01; cos(0.1*t)]*deg2rad(20);
    B = [1-q^2+2*c(1)^2 2*(c(1)*c(2)-c(3)) 2*(c(1)*c(3)+c(2)); ...
         2*(c(2)*c(1)+c(3)) 1-q^2+2*c(2)^2 2*(c(2)*c(3)-c(1)); ...
         2*(c(3)*c(1)-c(2)) 2*(c(3)*c(2)+c(1)) 1-q^2+2*c(3)^2];
    rates = (1/4)*B*w;
    
    for i=1:3
        c(i) = c(i) + rates(i)*0.01;
    end
%     c(1) = c(1) + rates(1)*0.01;
%     c(2) = c(2) + rates(2)*0.01;
%     c(3) = c(3) + rates(3)*0.01;
    q = sqrt(c(1)^2 + c(2)^2 + c(3)^2);
    
    if (q > 1)
        c = -c/q^2;
%         c(1) = -c(1)/q^2;
%         c(2) = -c(2)/q^2;
%         c(3) = -c(3)/q^2;
    end
    
    if t==42
        disp(q)
    end
end