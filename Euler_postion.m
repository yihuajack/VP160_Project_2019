dt=0.05;%the time difference
n=200;%the total number of plots
x=0.5;
v=1;
t=0;
w=1.5;
hold on;
plot(t,x,'g.');
for i=1:n
    a=-w^2*x;
    x=x+v*dt;
    v=v+a*dt;
    t=t+dt;
    plot(t,x,'g.');
end
hold off;