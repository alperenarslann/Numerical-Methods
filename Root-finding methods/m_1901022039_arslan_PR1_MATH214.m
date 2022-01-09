%% function definition
clear all
format long
f= @(r) (1/(4*pi*(1/(36*pi)*10^-9)))*(13*(r--7)/(abs(r--7)^3)+9*(r--4)/(abs(r--4)^3)+6*(r-11)/(abs(r-11)^3)+3*(r-14)/(abs(r-14)^3));
tolerance=10^-16;

%% bisection method
min=-3;
max=10;
fprintf("bisection method\nresult             iteration    error\n");
for i=1:100
    mid= min+(max-min)/2;
    if f(min)*f(mid)<0
       max=mid;
    else
        min=mid;
    end
    a1(1,i)=i;
    bisection(1,i)=abs(0-f(mid));
    fprintf("%1.15f      %1.f    %1.15f\n",mid,i,abs(0-f(mid)));
if (max-min)/2<tolerance
    break
end
end
fprintf("the final result that found by bisection method is %1.15f at %1.f iterations\n\n",mid,i);

%% newton's method
h=10^-10;
f_turev= @(x) (f(x+h)-f(x))/h; %derivative can be found by using limit definition
p0=6.5;
fprintf("newton's method\nresult             iteration     error\n");
for i=1:100
p=p0-f(p0)/f_turev(p0);
a2(1,i)=p;
newton(1,i)=abs(0-f(p));
fprintf("%1.15f      %1.f    %1.15f\n",p,i,abs(0-f(p)));
if abs(p-p0)<tolerance
    break
end
p0=p;
end
fprintf("the result that found by newton method is %1.15f at %1.f iterations\n\n",p,i);

%% secant method
x1=-3;x2=10;
q0=f(x1);
q1=f(x2);
fprintf("secant method\nresult             iteration     error\n");
for i=1:100
    p=x2-q1*(x2-x1)/(q1-q0);
    fprintf("%1.15f      %1.f    %1.15f\n",p,i,abs(0-f(p)));
    if abs(p-x2)<tolerance
        break
    end
    a3(1,i)=i;
    secand(1,i)=abs(0-f(p));
    x1=x2;
    q0=q1;
    x2=p;
    q1=f(p);
    
end
fprintf("the result that found by secant method is %1.15f at %1.f iterations\n",p,i);
%% ploting the graph
xlabel("iteration");
ylabel("error");
title("error graph according to iteration");
hold on
loglog(a1,bisection);
loglog(a2,newton);
loglog(a3,secand);
legend("bisection","newton","secant");
hold off
