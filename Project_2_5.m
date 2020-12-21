v0=10;
b=0.09114657;
k=0.5;
g=9.7964;
e=2.7182818284;
pi=3.141592654;
a=pi/4;
vx0=v0*cos(a);
vy0=v0*sin(a);
vx1=vx0*ones(1,100001);
vx2=vx0*ones(1,100001);
vx3=vx0*ones(1,100001);
vy1=vy0*ones(1,100001);
vy2=vy0*ones(1,100001);
vy3=vy0*ones(1,100001);
x1=zeros(1,100000);
y1=zeros(1,100000);
x2=zeros(1,100000);
y2=zeros(1,100000);
x3=zeros(1,100000);
y3=zeros(1,100000);
for i=1:100000
    vx1(i+1)=vx(i);
    x1(i+1)=x1(i)+vx1(i).*0.00001;
    vy1(i+1)=vy1(i)-g*0.00001;
    y1(i+1)=y1(i)+vy1(i).*0.00001;
end
for i=1:100000
    vx2(i+1)=vx(i)-k.*vx2(i).*0.00001;
    x2(i+1)=x2(i)+vx2(i).*0.00001;
    vy2(i+1)=vy2(i)-(g+k.*vy2(i)).*0.00001;
    y2(i+1)=y2(i)+vy2(i).*0.00001;
end
for i=1:100000
    vx3(i+1)=vx3(i)-b*sqrt(vx3(i).^2+vy3(i).^2)*vx3(i).*0.00001;
    x3(i+1)=x3(i)+vx3(i).*0.00001;
    vy3(i+1)=vy3(i)-(g+b*sqrt(vx3(i).^2+vy3(i).^2)*vy3(i)).*0.00001;
    y3(i+1)=y3(i)+vy3(i).*0.00001;
end
plot(x1,y1,x2,y2,x3,y3),legend({'no drag','linear drag','quadratic drag'},'Location','southeast');