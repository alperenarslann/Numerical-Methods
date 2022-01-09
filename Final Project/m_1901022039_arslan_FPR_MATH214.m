clear all;clc;
load fprdata.dat
%% fitting the exponential least squares polynomial
%ln(y)=ln(b)+ax
m=5;
%sum of x
sum_x=0;
for i=1:m
   sum_x = sum_x + fprdata(i,1); 
end

% %sum 0f y
% sum_y=0;
% for i=1:m
%    sum_y = sum_y + fprdata(i,2);  
% end

%sum of ln(y)
sum_lny=0;
for i=1:m
   sum_lny = sum_lny + log(fprdata(i,2)); 
end

%sum 0f x^2
sum_x2=0;
for i=1:m
   sum_x2 = sum_x2 + fprdata(i,1)^2; 
end

%sum of x*ln(y)
sum_xlny=0;
for i=1:m
   sum_xlny = sum_xlny + fprdata(i,1)*log(fprdata(i,2)); 
end

a=((m*sum_xlny)-(sum_x*sum_lny))/(m*sum_x2-sum_x^2);

lnb=((sum_x2*sum_lny)-(sum_xlny*sum_x))/(m*sum_x2-sum_x^2);
b = exp(lnb);

Id_function = @(x) b * exp(a * x);
as=linspace(0,1.25,40);
 plot(as,Id_function(as));
hold on;
plot(fprdata(:,1),fprdata(:,2),".");
xlabel("voltage on diode [V]");
ylabel("current [A]");
legend("exponantial least squares polynomial","given data set");
title("plotting a graph for current voltage relation using least square polynomial");

%finding error values
   fprintf("acutal current      current by least squares method         error\n");
for i=1:5
   error=abs(fprdata(i,2)-Id_function(fprdata(i,1)))/fprdata(i,2); 
   fprintf("%15.15f \t %15.15f \t \t %15.15f\n",fprdata(i,2),Id_function(fprdata(i,1)),error);
end


%% finding current and voltages
Vs=2;
R=14.2;
L=0.98;
h=0.025;


V1(1)=0;
Id(1)=0;
Vd(1)=0;


for i=1:0.6/h
    Id(i+1) = Id(i) + h * ( Vs - V1(i) - Vd(i) ) / L;
    Vd(i+1) = log(Id(i+1)/b)/a;
    V1(i+1) = Id(i+1)*R;
end



%Vs=V1+V2+Vd
%V2=Vs-V1-Vd
for i=1:(0.6/h)+1 %adding plus 1 because since we use i+1 notation at other variables its length must be same with them
V2(i)=Vs - V1(i )- Vd(i);
end

h=0.0025;

V1_2(1)=0;
Id_2(1)=0;
Vd_2(1)=0;

for i=1:0.600/h
    Id_2(i+1) = Id_2(i) + h * ( Vs - V1_2(i) - Vd_2(i) ) / L;
    Vd_2(i+1) = log(Id_2(i+1)/b)/a;
    V1_2(i+1) = Id_2(i+1)*R;
end


%Vs=V1+V2+Vd
%V2=Vs-V1-Vd
for i=1:(0.6/h)+1 %adding plus 1 because since we use i+1 notation at other variables its length must be same with them
V2_2(i)=Vs - V1_2(i) - Vd_2(i);
end

figure;
hold on;
plot(Vd,Id);
plot(Vd_2,Id_2,"-r");
xlabel("voltage on diode (V)");
ylabel("current (A)");
legend("by solving ODE at h=0.025 s","by solving ODE at h=0.0025 s");
title("comparison between h=0.025 and h=0.0025");
hold off;

figure;
plot(as,Id_function(as));
hold on;
plot(fprdata(:,1),fprdata(:,2),".");
plot(Vd,Id);
plot(Vd_2,Id_2,"-r");
xlabel("voltage on diode (V)");
ylabel("current (A)");
legend("exponantial least squares polynomial","given data set","by solving ODE at h=0.025 s","by solving ODE at h=0.0025 s");
title("voltage-current characteristic of the diode");
%creating time arrays for plotting graphs versus time
time_1(1)=0;
time_2(1)=0;

for i=1:0.6/0.025
   time_1(i+1)= time_1(i) + 0.025;
end

for i=1:0.6/0.0025
   time_2(i+1)=time_2(i) + 0.0025; 
end
%plotting current graph
figure;
title(" current(Id) versus time graphs");
hold on;
plot(time_1,Id);
plot(time_2,Id_2);
hold off;
legend("current at h = 0.025","current at h=0.0025");
xlabel("Time [s]");
ylabel("Current [A]");
%plotting Vd graph
figure;
title(" voltage on the diode(Vd) versus time graphs");
hold on;
plot(time_1,Vd);
plot(time_2,Vd_2);
hold off;
legend("Vd at h = 0.025","Vd at h=0.0025");
xlabel("Time [s]");
ylabel("voltage on the diode [V]");
%plotting V1 vs time graph
figure;
title("voltage on the resistor(V1) versus time graphs");
hold on;
plot(time_1,V1);
plot(time_2,V1_2);
xlabel("Time [s]");
ylabel("voltage on the resistor [V]");
hold off;
legend("V1 at h = 0.025","V1 at h=0.0025");
%plotting V2 vs time graphs
figure;
title("voltage on the inductor(V2) versus time graphs");
hold on;
plot(time_1,V2);
plot(time_2,V2_2);
hold off;
legend("V2 at h = 0.025","V2 at h=0.0025");
xlabel("Time [s]");
ylabel("voltage on the inductor [V]");

