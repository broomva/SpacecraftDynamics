r = deg2rad(80);

p = deg2rad(30);

y = deg2rad(40);

for t=0:0.01:60

w = [ sin(0.1*t) ; 0.01 ; cos(0.1*t) ]*deg2rad(20);

a = [0, sin(r)/cos(p), cos(r)/cos(p);

0, cos(r), -sin(r);

1, sin(r)*tan(p), cos(r)*tan(p)];

eul_rates = a*w;

dy=eul_rates(1);

dp=eul_rates(2);

dr=eul_rates(3);

r=r+dr*0.01;

p=p+dp*0.01;

y=y+dy*0.01;

if t==42

norm=sqrt(r^2+p^2+y^2);

disp(norm);

end

end