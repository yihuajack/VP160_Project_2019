v0=10;
k=0.5;
g=9.7964;
e=2.7182818284;
pi=3.141592654;
a=pi/4;
vx0=v0*cos(a);
vy0=v0*sin(a);
dt=[0.001,0.0001,0.00001];
t=0:dt(1):1;
xa1=vx0./k.*(1-e.^(-k.*t));
ya1=(g/k^2+vy0./k).*(1-e.^(-k.*t))-g.*t./k;
t=0:dt(2):1;
xa2=vx0./k.*(1-e.^(-k.*t));
ya2=(g/k^2+vy0./k).*(1-e.^(-k.*t))-g.*t./k;
t=0:dt(3):1;
xa3=vx0./k.*(1-e.^(-k.*t));
ya3=(g/k^2+vy0./k).*(1-e.^(-k.*t))-g.*t./k;
yt=(g/k^2+vy0/k)*(1-e^(-k*1))-g*1/k;
vx1=vx0*ones(1,1001);
vx2=vx0*ones(1,10001);
vx3=vx0*ones(1,100001);
xn1=zeros(1,1001);
xn2=zeros(1,10001);
xn3=zeros(1,100000);
vy1=vy0*ones(1,1001);
vy2=vy0*ones(1,10001);
vy3=vy0*ones(1,100001);
yn1=zeros(1,1001);
yn2=zeros(1,10001);
yn3=zeros(1,100000);
for i=1:(1/dt(1))
    vx1(i+1)=vx1(i)-k.*vx1(i).*dt(1);
    xn1(i+1)=xn1(i)+vx1(i).*dt(1);
    vy1(i+1)=vy1(i)-(g+k.*vy1(i)).*dt(1);
    yn1(i+1)=yn1(i)+vy1(i).*dt(1);
end
for i=1:(1/dt(2))
    vx2(i+1)=vx2(i)-k.*vx2(i).*dt(2);
    xn2(i+1)=xn2(i)+vx2(i).*dt(2);
    vy2(i+1)=vy2(i)-(g+k.*vy2(i)).*dt(2);
    yn2(i+1)=yn2(i)+vy2(i).*dt(2);
end
for i=1:(1/dt(3))
    vx3(i+1)=vx3(i)-k.*vx3(i).*dt(3);
    xn3(i+1)=xn3(i)+vx3(i).*dt(3);
    vy3(i+1)=vy3(i)-(g+k.*vy3(i)).*dt(3);
    yn3(i+1)=yn3(i)+vy3(i).*dt(3);
end
xb1=xa1(1001);
xb2=xa2(10001);
xb3=xa3(100001);
xo1=xn1(1001);
xo2=xn2(10001);
xo3=xn3(100000);
yb1=ya1(1001);
yb2=ya2(10001);
yb3=ya3(100001);
yo1=yn1(1001);
yo2=yn2(10001);
yo3=yn3(100000);
dr1=zeros(1,100001);
dr2=zeros(1,100001);
dr3=zeros(1,100001);
for i=1:1001
    dr1(100*i)=sqrt((xa1(i)-xn1(i))^2+(ya1(i)-yn1(i))^2);
    dr2(100*i)=sqrt((xa2(i)-xn2(i))^2+(ya2(i)-yn2(i))^2);
    dr3(100*i)=sqrt((xa3(i)-xn3(i))^2+(ya3(i)-yn3(i))^2);
end
figure(1);
subplot(2,2,1),plot(xn1,yn1),title('Numerical Trajectory,¦¤t=0.001s');
subplot(2,2,2),plot(xn2,yn2),title('Numerical Trajectory,¦¤t=0.0001s');
subplot(2,2,3),plot(xn3,yn3),title('Numerical Trajectory,¦¤t=0.00001s');
subplot(2,2,4),plot(xa3,ya3),title('Analytical Trajectory');
figure(2);
subplot(1,3,1),plot(dr1),title('r(Analytical)-r(Numerical),¦¤t=0.001s');
subplot(1,3,2),plot(dr2),title('r(Analytical)-r(Numerical),¦¤t=0.0001s');
subplot(1,3,3),plot(dr3),title('r(Analytical)-r(Numerical),¦¤t=0.00001s');