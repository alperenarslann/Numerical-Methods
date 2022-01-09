clear all;
format long;
clc;
R=14.2;
L=0.98;
V=12;
f = @(x) (V-R*x)/L;
%% euler's method for h=0.05
h=0.05;
current_euler(1,1)=0.1;% first row is for h=0.05

derivative_current_euler(1,1)=(V-R*current_euler(1,1))/L;
for i=2:13
current_euler(1,i)=current_euler(1,i-1)+derivative_current_euler(1,i-1)*h;
derivative_current_euler(1,i)=(V-R*current_euler(1,i))/L;
end

%% modified euler's method for h=0.05
h=0.05;
modified_euler(1,1)=0.1;% first row is for h=0.05
modified_euler(1,13)=0;
derivative_m_euler(1,1)=(V-R*modified_euler(1,1))/L;
derivative_m_euler(1,13)=0;
for i=2:13
modified_euler(1,i)=modified_euler(1,i-1)+(h/2)*(derivative_m_euler(1,i-1)+derivative_current_euler(1,i));
derivative_m_euler(1,i)=(V-R*modified_euler(1,i))/L;
end

%% midpoint method for h=0.05
h=0.05;
midpoint(1,1)=0.1;
k1(1)=(V-R*midpoint(1,1))/L;
k2(1)=f(midpoint(1,1)+0.5*h*k1(1));
for i=2:13
   midpoint(1,i)= midpoint(1,i-1) + k2(i-1)*h;
   k1(i)=f(midpoint(1,i));
k2(i)=f(midpoint(1,i)+0.5*h*k1(i));
end

%% runge kutta method order four for h=0.05
h=0.05;
for i=1:25
    k1(i)=0;k2(i)=0; %just to be sure dont get anything wrong
end
runge_kutta(1,1)=0.1;
k1(1)=f(runge_kutta(1,1));
k2(2)=f(runge_kutta(1,1)+0.5*k1(1)*h);
k3(1)=f(runge_kutta(1,1)+0.5*k2(1)*h);
k4(1)=f(runge_kutta(1,1)+k3(1)*h);

for i=2:13
runge_kutta(1,i)=runge_kutta(1,i-1)+(1/6)*(k1(i-1) + 2*k2(i-1) + 2*k3(i-1) + k4(i-1))*h;
k1(i)=f(runge_kutta(1,i));
k2(i)=f(runge_kutta(1,i)+0.5*k1(i)*h);
k3(i)=f(runge_kutta(1,i)+0.5*k2(i)*h);
k4(i)=f(runge_kutta(1,i)+k3(i)*h);
end
    
%% analytical solution for h=0.05
h=0.05;
y=@(x) 12/14.2-(529/710)*exp(-14.2*x);
for i=0:12
    analytical(1,i+1)=y(h*i);
end
%%




                                   %geçiş bölgesi!




%% euler's method for h=0.025
h=0.025;
current_euler(2,1)=0.1;% second row is for h=0.025
derivative_current_euler(2,1)=(V-R*current_euler(2,1))/L;
for i=2:25
   current_euler(2,i)=current_euler(2,i-1)+derivative_current_euler(2,i-1)*h; 
   derivative_current_euler(2,i)=(V-R*current_euler(2,i))/L;
end

%% modified euler's method for h=0.025
h=0.025;
modified_euler(2,1)=0.1;
derivative_m_euler(2,1)=(V-R*modified_euler(2,1))/L;
for i=2:25
   modified_euler(2,i)=modified_euler(2,i-1)+(h/2)*(derivative_current_euler(2,i)+derivative_m_euler(2,i-1));
   derivative_m_euler(2,i)=(V-R*modified_euler(2,i))/L;
end
%% midpoint method for h=0.025
h=0.025;
midpoint(2,1)=0.1;
midpoint(2,25)=0;
a1(1)=(V-R*midpoint(2,1))/L;
a2(1)=f(midpoint(2,1)+0.5*h*k1(1));
a1(25)=0;
a2(25)=0;
for i=2:25
   midpoint(2,i)=midpoint(2,i-1)+a2(i-1)*h;
   a1(i)=f(midpoint(2,i));
   a2(i)=f(midpoint(2,i)+0.5*h*a1(i));
end
%% runge-kutta order four for h=0.025;
h=0.025;

for i=1:25
    k1(i)=0;k2(i)=0; %just to be sure dont get anything wrong
end
runge_kutta(2,1)=0.1;
runge_kutta(2,25)=0;
k1(1)=f(runge_kutta(2,1));
k2(2)=f(runge_kutta(2,1)+0.5*k1(1)*h);
k3(1)=f(runge_kutta(2,1)+0.5*k2(1)*h);
k4(1)=f(runge_kutta(2,1)+k3(1)*h);

for i=2:25
runge_kutta(2,i)=runge_kutta(2,i-1)+(1/6)*(k1(i-1) + 2*k2(i-1) + 2*k3(i-1) + k4(i-1))*h;
k1(i)=f(runge_kutta(2,i));
k2(i)=f(runge_kutta(2,i)+0.5*k1(i)*h);
k3(i)=f(runge_kutta(2,i)+0.5*k2(i)*h);
k4(i)=f(runge_kutta(2,i)+k3(i)*h);
end

%% analytical solution for h=0.025
h=0.025;
for i=0:24
   analytical(2,i+1)=y(h*i); 
end
 %% graphs
 x_1=linspace(0,0.6,13);
 x_2=linspace(0,0.6,25);
 figure('name','h=0.05');
 hold on;
 plot(x_1,current_euler(1,1:13));
 plot(x_1,modified_euler(1,1:13));
 plot(x_1,midpoint(1,1:13),".");
 plot(x_1,runge_kutta(1,1:13),"--");
 plot(x_1,analytical(1,1:13));
 xlabel("time (s)");
 ylabel("current (A)");
 hold off;
 legend("euler's method","modified euler's method","midpoint mothod","runge-kutta order four","analytical solution");
 title("h=0.05");
 
 figure("name","h=0.025");
 title("h=0.025");
 hold on;
 plot(x_2,current_euler(2,:));
 plot(x_2,modified_euler(2,:));
 plot(x_2,midpoint(2,:),".");
 plot(x_2,runge_kutta(2,:),"--");
 plot(x_2,analytical(2,1:25));
 xlabel("time (s)");
 ylabel("current (A)");
 hold off;
 legend("euler's method","modified euler's method","midpoint mothod","runge-kutta order four","analytical solution");
%% error analysis
%error for h=0.05
for i=1:13
   error_euler(1,i)=abs(analytical(i)-current_euler(1,i));
   error_modified(1,i)=abs(analytical(i)-modified_euler(1,i));
   error_midpoint(1,i)=abs(analytical(i)-midpoint(1,i));
   error_runge_kutta(1,i)=abs(analytical(i)-runge_kutta(1,i));
end
%error for h=0.025
for i=1:25
   error_euler(2,i)=abs(analytical(i)-current_euler(2,i));
   error_modified(2,i)=abs(analytical(i)-modified_euler(2,i));
   error_midpoint(2,i)=abs(analytical(i)-midpoint(2,i));
   error_runge_kutta(2,i)=abs(analytical(i)-runge_kutta(2,i));
end
   fprintf("errors for h=0.05\n");
   fprintf("%s\t  %-6s %10s  %8s  %-8s\n","time(s)","euler","modified euler","midpoint","runge kutta"); 
for i=0:12
fprintf("%.2f\t%f\t%f\t%f\t%f\n",0.05*i,error_euler(1,i+1),error_modified(1,i+1),error_midpoint(1,i+1),error_runge_kutta(1,i+1));
end
fprintf("\n\n\n");
  fprintf("errors for h=0.025\n");
   fprintf("%s\t  %-6s %10s  %8s  %-8s\n","time(s)","euler","modified euler","midpoint","runge kutta"); 
for i=0:24
fprintf("%.3f\t%f\t%f\t%f\t%f\n",0.025*i,error_euler(2,i+1),error_modified(2,i+1),error_midpoint(2,i+1),error_runge_kutta(2,i+1));
end

fprintf("\n\n\n");
fprintf(" average error for h=0.05 euler:%f\n",norm(current_euler(1,1:13)-analytical(1,1:13))/sqrt(13));
fprintf(" average error for h=0.05 modified euler:%f\n",norm(modified_euler(1,1:13)-analytical(1,1:13))/sqrt(13));
fprintf(" average error for h=0.05 midpoint:%f\n",norm(midpoint(1,1:13)-analytical(1,1:13))/sqrt(13));
fprintf(" average error for h=0.05 runge kutta order four:%f\n",norm(runge_kutta(1,1:13)-analytical(1,1:13))/sqrt(13));
fprintf("\n\n");
fprintf(" average error for h=0.025  euler:%f\n",norm(current_euler(1,1:25)-analytical(1,1:25))/sqrt(25));
fprintf(" average error for h=0.025  modified euler:%f\n",norm(modified_euler(1,1:25)-analytical(1,1:25))/sqrt(25));
fprintf(" average error for h=0.025  midpoint:%f\n",norm(midpoint(1,1:25)-analytical(1,1:25))/sqrt(25));
fprintf(" average error for h=0.025  runge kutta order four:%f\n",norm(runge_kutta(1,1:25)-analytical(1,1:25))/sqrt(25));

