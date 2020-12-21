dt=0.05;%the time difference
n=200;%the total number of plots
x=0.5;
v=1;
t=0;
w=1.5;
hold on;
plot(t,x,'y.');
for i=1:n
    a=-w^2*x;
    y=x+v*dt;
    z=v+a*dt;
    x=(y+x+z*dt)/2;
    v=(z+v-w^2*y*dt)/2;
    t=t+dt;
    plot(t,x,'y.');
end
hold off;