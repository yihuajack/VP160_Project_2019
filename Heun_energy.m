dt=0.05;%the time difference
n=200;%the total number of plots
m=1;
x=0.5;
v=1;
t=0;
w=1.5;
e=m*w^2*x^2/2+m*v^2/2;
axis([0,10,0,3]);%fix the value of axis
hold on;
plot(t,e,'b.');
for i=1:n
    a=-w^2*x;
    y=x+v*dt;
    z=v+a*dt;
    x=(y+x+z*dt)/2;
    v=(z+v-w^2*y*dt)/2;
    t=t+dt;
    e=m*w^2*x^2/2+m*v^2/2;
    plot(t,e,'b.');
end
hold off;