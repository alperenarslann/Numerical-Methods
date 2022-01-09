clear all; clc;
load pr5data.dat;
format long

 figure
plot(pr5data(:,1),pr5data(:,2));
 title("real graph")
 legend("real graph");
 xlabel("distance [m]");
 ylabel("voltage [V]");
%% linear least squares polynomial

sum_x2=0;
for i=1:11
   sum_x2=sum_x2 + pr5data(i,1)*pr5data(i,1);
end
sum_x1=0;
for i=1:11
   sum_x1=sum_x1 + pr5data(i,1);
end

sum_y=0;
for i=1:11
   sum_y=sum_y + pr5data(i,2);
end

sum_y2=0;
for i=1:11
   sum_y2=sum_y2 + pr5data(i,2)*pr5data(i,2);
end

sum_x1y=0;
for i=1:11
   sum_x1y=sum_x1y + pr5data(i,1)*pr5data(i,2);
end

a1(1) = ((sum_x2*sum_y)-(sum_x1y*sum_x1))/(11*(sum_x2)-(sum_x1*sum_x1));
a1(2) = (  11*sum_x1y   -  (sum_x1*sum_y)        )/(11*(sum_x2)-(sum_x1*sum_x1));
k=pr5data(1:11,1);
 p1=a1(2)*k + a1(1);
 
 figure
plot(k,pr5data(1:11,2),".");
hold on;
 plot(k,p1);
 hold off;
 title("linear least squares polynomial graph")
 legend("real graph","linear least squares polynomial");
 xlabel("distance [m]");
 ylabel("voltage [V]");
 
 error_linear=0;
 for i=1:11
    error_linear=error_linear + (pr5data(i,2)-p1(i))^2;%(a1*pr5data(i,1)+a0)^2;
 end


 %% least squares polynomial of degree 2

 sum_x0=0;
 for i=1:11
    sum_x0 = sum_x0 + 1;
 end
 
 sum_x3=0;
 for i=1:11
    sum_x3 = sum_x3 +  pr5data(i,1)^3;
 end
 
 sum_x4=0;
 for i=1:11
    sum_x4=sum_x4 + pr5data(i,1)^4; 
 end
 
 
 matrix2=[sum_x0 sum_x1 sum_x2; sum_x1 sum_x2 sum_x3;sum_x2 sum_x3 sum_x4];
 
 sum_x0y=0;
 for i=1:11
    sum_x0y= sum_x0y + pr5data(i,2);
 end
 
 sum_x2y=0;
 for i=1:11
   sum_x2y = sum_x2y + pr5data(i,2)*pr5data(i,1)*pr5data(i,1);
 end
 results2=[sum_x0y;sum_x1y;sum_x2y];
 
a2=inv(matrix2)*results2;
p2=a2(1) + a2(2)*k + a2(3)*k.^2;

figure;
hold on;
plot(pr5data(:,1),pr5data(:,2),".");
plot(k,p2);
 xlabel("distance [m]");
 ylabel("voltage [V]");
 legend("real graph","least squares polynomial of degree two graph");
 title("least squares polynomial of degree two graph");
error_degree2=0;
for i=1:11
   error_degree2 = error_degree2 + (pr5data(i,2)-p2(i))^2; 
end

%% least square polynomial of degree 3
sum_x5=0;
for i=1:11
   sum_x5 = sum_x5 + pr5data(i,1)^5; 
end

sum_x6=0;
for i=1:11
   sum_x6 = sum_x6 + pr5data(i,1)^6; 
end

 matrix3=[sum_x0 sum_x1 sum_x2 sum_x3; sum_x1 sum_x2 sum_x3 sum_x4;sum_x2 sum_x3 sum_x4 sum_x5; sum_x3 sum_x4 sum_x5 sum_x6];
sum_x3y=0;
for i=1:11
   sum_x3y = sum_x3y + pr5data(i,2)*pr5data(i,1)^3; 
end
 results3=[sum_x0y ; sum_x1y ; sum_x2y;sum_x3y];
 
 a3=inv(matrix3)*results3;
 
 p3= a3(1) +a3(2)*k + a3(3)*k.^2 + a3(4)*k.^3;
 figure
hold on;
plot(pr5data(:,1),pr5data(:,2),".");
plot(k,p3);
hold off;
title("least squares polynomial of degree three");
legend("real graph","least squares polynomial of degree three")
 xlabel("distance [m]");
 ylabel("voltage [V]");
 %% comparison of graphs and error analysis 
figure
plot(pr5data(:,1),pr5data(:,2),".");
hold on;
plot(k,p1);
plot(k,p2,"--");
plot(k,p3);
title("comparison of all graphs")
 xlabel("distance [m]");
 ylabel("voltage [V]");
 legend("real graph","linear least squares method","least squares polynomial degree 2","least squares polynomial degree 3");
error_degree3=0;
for i=1:11
   error_degree3 = error_degree3 + (pr5data(i,2)-p3(i))^2; 
end
fprintf("\n\n");
fprintf("the coefficients for linear least squares polynomial method\na0 = %.15f \t a1 = %.15f\n",a1(1),a1(2));
fprintf("the coefficients for least squares polynomial of degree two method\na0 = %.15f \t a1 = %.15f \t a2 = %.15f\n",a2(1),a2(2),a2(3));
fprintf("the coefficients for least squares polynomial of degree three method\na0 = %.15f \t a1 = %.15f \t a2 = %.15f \t a3 = %.15f\n",a3(1),a3(2),a3(3),a3(4));
fprintf("\n\n\n");
fprintf("the error of linear least squares polynomial is %.15f\n",error_linear);
fprintf("the error of least squares polynomial of degree 2 is %.15f\n",error_degree2);
fprintf("the error of least squares polynomial of degree 3 is %.15f\n",error_degree3);