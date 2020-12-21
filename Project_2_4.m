clear;
v0=10;
b=0.5;
g=9.7964;
e=2.7182818284;
pi=3.141592654;
a=[pi/12,pi/6,pi/4,pi/3,5*pi/12];
vx0=v0.*cos(a);
vy0=v0.*sin(a);
dt=0.00001;
vx=[];
vy=[];
for i=1:5
    vx=[vx;vx0(i)*linspace(1,1,100001)];
    vy=[vy;vy0(i)*linspace(1,1,100001)];
end
xn=zeros(5,100001);
yn=zeros(5,100001);
for i=1:5
    for j=1:100000
        vx(i,j+1)=vx(i,j)-b*sqrt(vx(i,j).^2+vy(i,j).^2)*vx(i,j).*0.00001;
        xn(i,j+1)=xn(i,j)+vx(i,j).*0.00001;
        vy(i,j+1)=vy(i,j)-(g+b*sqrt(vx(i,j).^2+vy(i,j).^2)*vy(i,j)).*0.00001;
        yn(i,j+1)=yn(i,j)+vy(i,j).*0.00001;
    end
end
figure(1);
for i=1:5
    plot(sqrt(vx(i,:).^2+vy(i,:).^2));
    hold on;
end
legend('汐=15～','汐=30～','汐=45～','汐=60～','汐=75～');
figure(2);
plot(xn(1,:),yn(1,:),xn(2,:),yn(2,:),xn(3,:),yn(3,:),xn(4,:),yn(4,:),xn(5,:),yn(5,:));
legend('汐=15～','汐=30～','汐=45～','汐=60～','汐=75～');
a=pi/4;
b=[0,0.25,0.5,0.75,1];
vx=vx0(3)*linspace(1,1,100001);
vy=vy0(3)*linspace(1,1,100001);
vx=[vx;vx;vx;vx;vx];
vy=[vy;vy;vy;vy;vy];
for i=1:5
    for j=1:100000
        vx(i,j+1)=vx(i,j)-b(i).*sqrt(vx(i,j).^2+vy(i,j).^2).*vx(i,j).*0.00001;
        xn(i,j+1)=xn(i,j)+vx(i,j).*0.00001;
        vy(i,j+1)=vy(i,j)-(g+b(i).*sqrt(vx(i,j).^2+vy(i,j).^2).*vy(i,j)).*0.00001;
        yn(i,j+1)=yn(i,j)+vy(i,j).*0.00001;
    end
end
figure(3);
for i=1:5
    plot(sqrt(vx(i,:).^2+vy(i,:).^2));
    hold on;
end
legend('百=0','百=0.25','百=0.5','百=0.75','百=1');
figure(4);
plot(xn(1,:),yn(1,:),xn(2,:),yn(2,:),xn(3,:),yn(3,:),xn(4,:),yn(4,:),xn(5,:),yn(5,:));
legend('百=0','百=0.25','百=0.5','百=0.75','百=1');