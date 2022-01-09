clear all;clc;

load pr3data.dat;
%% 
h=0.025;
derivative(1)=(1/(2*h))*(-3*pr3data(1,2)+4*pr3data(2,2)-pr3data(3,2));

for i=2:40
    derivative(i)=(1/(2*h))*(pr3data(i+1,2)-pr3data(i-1,2));
end
derivative(41)=(1/(2*h))*(+3*pr3data(41,2)-4*pr3data(40,2)+pr3data(39,2));

figure
plot(derivative,pr3data(:,3));
title("current and voltage");
xlabel("voltage v(t) (volt)");
ylabel("current i(t) (Ampere)");

p(41)=0;
for i=1:41
   p(i) = pr3data(i,2) * pr3data(i,3); 
end
figure
plot(pr3data(:,1),p);
title("p(t) versus time graph");
xlabel("time (s)");
ylabel("power (watt)");
hold off;

%% composite midpoint integration
E_midpoint(41)=0;
for i=3:2:41
    for k=2:2:i
        E_midpoint(i)=E_midpoint(i)+p(k)*0.05;
    end
end

for i=4:2:41
   E_midpoint(i)=E_midpoint(i-1) + 0.025*( (p(i)+p(i-1))*0.5 );
end

figure('name','composite midpoint rule');
plot(pr3data(:,1),E_midpoint);
title("composite midpoint rule");
hold off;
xlabel("time (s)");
ylabel("Stored Energy (J)");
legend("midpoint");
%% composite trapezoidal integration
E_trapezoidal(41)=0;
for i=2:1:41
   for k=2:1:i
      E_trapezoidal(i) = E_trapezoidal(i) + 0.025*(p(k-1)+p(k))/2;
   end
end
figure('name','composite trapzedoidal rule');
plot(pr3data(:,1),E_trapezoidal);
title("composite trapezoidal rule");
xlabel("time (s)");
ylabel("Stored Energy (J)");
legend("trapzedodal");
%% composite simpson's rule
E_simpson(41)=0;
for i=3:2:41
   for k=3:2:i
   E_simpson(i) = E_simpson(i) + 0.025/3*(p(k-2)+4*p(k-1)+p(k));
   end
end
for i=4:2:40
   E_simpson(i)=E_simpson(i-1)  + 0.025*(p(i)+p(i-1))/2;
end
figure('name','simpson');
plot(pr3data(:,1),E_simpson);
title("composite simpson's rule");
xlabel("time (s)");
ylabel("Stored Energy (J)");
legend("simpson");
%% normal
for i=1:41
   E_normal(i) = 0.5*0.1*pr3data(i,2)*pr3data(i,2); 
end
figure('name','voltage current relation');
plot(pr3data(:,1),E_normal);
title("real power-time graph");
xlabel("time (s)");
ylabel("Stored Energy (J)");;

figure;
subplot(2,2,1);
plot(pr3data(:,1),E_midpoint);
title("composite midpoint rule");
legend("midpoint");
hold off;
xlabel("time (s)");
ylabel("Stored Energy (J)");

subplot(2,2,2);
plot(pr3data(:,1),E_trapezoidal);
title("composite trapezoidal rule");
xlabel("time (s)");
ylabel("Stored Energy (J)");
legend("trapezoidal");

subplot(2,2,3);
plot(pr3data(:,1),E_simpson);
title("composite simpson's rule");
xlabel("time (s)");
ylabel("Stored Energy (J)");
legend("simpson");

subplot(2,2,4);
plot(pr3data(:,1),E_normal);
title("real power-time graph");
xlabel("time (s)");
ylabel("Stored Energy (J)");
legend("normal");
 %% analysis
 figure;
 hold on;
 plot(pr3data(:,1),E_midpoint,'--');
 plot(pr3data(:,1),E_trapezoidal,'-');
plot(pr3data(:,1),E_simpson,'.r');
plot(pr3data(:,1),E_normal);
xlabel("time (s)");
ylabel("stored energy (J)");
title("comparison of methods");
hold off;
legend("midpoint","trapezoidal","simpson","normal");
fprintf("error in composite midpoint rule is : %f\n",norm(E_midpoint-E_normal) / sqrt(41));
fprintf("error in composite trapzedoidal rule is : %f\n",norm(E_trapezoidal-E_normal) / sqrt(41));
fprintf("error in composite simpson'S rule is : %f\n",norm(E_simpson-E_normal) / sqrt(41));
