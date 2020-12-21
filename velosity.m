k=0.3;
n=20;
v_x=2;
v_y=1;
x=0;
y=0;
g=9.8;
t=0;
dt=0.01;
v=sqrt(v_x^2+v_y^2);
hold on;
plot(t,v,'.b');
for i=1:n
    a=v_x-k*v_x+k^2*v_x*dt^2/2;
    b=v_y-g-k*v_y+(k*g+k^2*v_y)*dt^2/2;
    x=x+v_x-k*v_x*dt^2/2;
    y=y+v_y+(-g-k*b)*dt^2/2;
    v_x=a;
    v_y=b;
    t=t+dt;
    v=sqrt(v_x^2+v_y^2);
    plot(t,v,'.b');
end
hold off;