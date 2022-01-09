clear all;
clc;
format long;
load current1.dat
load current2.dat
load current3.dat
load current4.dat
%% forward-difference formula
for i=1:1:8
 forward1(i)=(current1(i+1,2)-current1(i,2))/0.0750;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.0750=%f\n",current1(i,1),current1(i+1,2),current1(i,2),forward1(i));
 E1_forward(i)= 0.98*forward1(i)+14.2*current1(i,2);
 fprintf("impressed voltage is %f\n",E1_forward(i));
end 
fprintf("\n current2\n");
for i=1:1:12
 forward2(i)=(current2(i+1,2)-current2(i,2))/0.050;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.050=%f\n",current2(i,1),current2(i+1,2),current2(i,2),forward2(i));
 E2_forward(i)= 0.98*forward2(i)+14.2*current2(i,2);
 fprintf("impressed voltage is %f\n",E2_forward(i));
end
fprintf("\ncurrent3\n");
for i=1:1:24
 forward3(i)=(current3(i+1,2)-current3(i,2))/0.025;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.025=%f\n",current3(i,1),current3(i+1,2),current3(i,2),forward3(i));
 E3_forward(i)= 0.98*forward3(i)+14.2*current3(i,2);
 fprintf("impressed voltage is %f\n",E3_forward(i));
end
fprintf("\ncurrent4\n");
for i=1:1:60
 forward4(i)=(current4(i+1,2)-current4(i,2))/0.010;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.010=%f\n",current4(i,1),current4(i+1,2),current4(i,2),forward4(i));
 E4_forward(i)= 0.98*forward4(i)+14.2*current4(i,2);
 fprintf("impressed voltage is %f\n",E4_forward(i));
end

%% backward-difference formula
fprintf("\nbackward difference formula\n\n");
fprintf("current1\n");
for i=2:1:9
 backward1(i)=(current1(i,2)-current1(i-1,2))/0.0750;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.0750=%f\n",current1(i,1),current1(i,2),current1(i-1,2),backward1(i));
 E1_backward(i)= 0.98*backward1(i)+14.2*current1(i,2);
 fprintf("impressed voltage is %f\n",E1_backward(i));
end
fprintf("\n current2\n");
for i=2:1:13
 backward2(i)=(current2(i,2)-current2(i-1,2))/0.050;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.050=%f\n",current2(i,1),current2(i,2),current2(i-1,2),backward2(i));
 E2_backward(i)= 0.98*backward2(i)+14.2*current2(i,2);
 fprintf("impressed voltage is %f\n",E2_backward(i));
end
fprintf("\ncurrent3\n");
for i=2:1:25
 backward3(i)=(current3(i,2)-current3(i-1,2))/0.025;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.025=%f\n",current3(i,1),current3(i,2),current3(i-1,2),backward3(i));
 E3_backward(i)= 0.98*backward3(i)+14.2*current3(i,2);
 fprintf("impressed voltage is %f\n",E3_backward(i));
end
fprintf("\ncurrent4\n");
for i=2:1:61
 backward4(i)=(current4(i,2)-current4(i-1,2))/0.010;
 fprintf("derivative of current at t=%f is:((%f)-%f)/0.010=%f\n",current4(i,1),current4(i,2),current4(i-1,2),backward4(i));
 E4_backward(i)= 0.98*backward4(i)+14.2*current4(i,2);
 fprintf("impressed voltage is %f\n",E4_backward(i));
end
%% Three point midpoint formula
fprintf("\n\n three point midpoint formula\n");
fprintf("\ncurrent1\n\n");
h=0.075;
threepoint1(1)=(1/(2*h))*(-3*current1(1,2)+4*current1(2,2)-current1(3,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current1(1,1),2*h,current1(1,2),current1(2,2),current1(3,2),threepoint1(1));
E1_threepoint(1)=threepoint1(1)*0.98+14.2*current1(1,2);
fprintf("impressed voltage is %f\n",E1_threepoint(1));
for i=2:1:8
   threepoint1(i)=(1/(2*h))*(current1(i+1,2)-current1(i-1,2)); 
     fprintf("derivative of current at t=%f is:1/%f*(%f-%f)=%f\n",current1(i,1),2*h,current1(i+1,2),current1(i-1,2),threepoint1(i));
    E1_threepoint(i)=threepoint1(i)*0.98+14.2*current1(i,2);
    fprintf("impressed voltage is %f\n",E1_threepoint(i));
end
h=-0.075;
threepoint1(9)=(1/(2*h))*(-3*current1(9,2)+4*current1(8,2)-current1(7,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current1(9,1),2*h,current1(9,2),current1(8,2),current1(7,2),threepoint1(9));
 E1_threepoint(9)=threepoint1(9)*0.98+14.2*current1(9,2);
    fprintf("impressed voltage is %f\n",E1_threepoint(9));
    
    
    
fprintf("\ncurrent2\n\n");
h=0.05;
threepoint2(1)=(1/(2*h))*(-3*current2(1,2)+4*current2(2,2)-current2(3,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current2(1,1),2*h,current2(1,2),current2(2,2),current2(3,2),threepoint2(1));
E2_threepoint(1)=threepoint2(1)*0.98+14.2*current2(1,2);
fprintf("impressed voltage is %f\n",E2_threepoint(1));
for i=2:1:12
      threepoint2(i)=(1/(2*h))*(current2(i+1,2)-current2(i-1,2)); 
     fprintf("derivative of current at t=%f is:1/%f*(%f-%f)=%f\n",current2(i,1),2*h,current2(i+1,2),current2(i-1,2),threepoint2(i));
    E2_threepoint(i)=threepoint2(i)*0.98+14.2*current2(i,2);
    fprintf("impressed voltage is %f\n",E2_threepoint(i));
end
h=-0.05;
threepoint2(13)=(1/(2*h))*(-3*current2(13,2)+4*current2(12,2)-current2(11,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current2(13,1),2*h,current2(13,2),current2(12,2),current2(11,2),threepoint2(13));
E2_threepoint(13)=threepoint2(13)*0.98+14.2*current2(13,2);
fprintf("impressed voltage is %f\n",E2_threepoint(13));


fprintf("\ncurrent3\n\n");
h=0.025;
threepoint3(1)=(1/(2*h))*(-3*current3(1,2)+4*current3(2,2)-current3(3,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current3(1,1),2*h,current3(1,2),current3(2,2),current3(3,2),threepoint3(1));
E3_threepoint(1)=threepoint3(1)*0.98+14.2*current3(1,2);
fprintf("impressed voltage is %f\n",E3_threepoint(1));
for i=2:1:24
      threepoint3(i)=(1/(2*h))*(current3(i+1,2)-current3(i-1,2)); 
     fprintf("derivative of current at t=%f is:1/%f*(%f-%f)=%f\n",current3(i,1),2*h,current3(i+1,2),current3(i-1,2),threepoint3(i));
    E3_threepoint(i)=threepoint3(i)*0.98+14.2*current3(i,2);
    fprintf("impressed voltage is %f\n",E3_threepoint(i));
end
h=-0.025;
threepoint3(25)=(1/(2*h))*(-3*current3(24,2)+4*current3(23,2)-current3(22,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current3(25,1),2*h,current3(24,2),current3(23,2),current3(22,2),threepoint3(25));
E3_threepoint(25)=threepoint3(25)*0.98+14.2*current3(25,2);
fprintf("impressed voltage is %f\n",E3_threepoint(25));



fprintf("\ncurrent4\n\n");
h=0.010;
threepoint4(1)=(1/(2*h))*(-3*current4(1,2)+4*current4(2,2)-current4(3,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current4(1,1),2*h,current4(1,2),current4(2,2),current4(3,2),threepoint4(1));
E4_threepoint(1)=threepoint4(1)*0.98+14.2*current4(1,2);
fprintf("impressed voltage is %f\n",E4_threepoint(1));
for i=2:1:60
      threepoint4(i)=(1/(2*h))*(current4(i+1,2)-current4(i-1,2)); 
     fprintf("derivative of current at t=%f is:1/%f*(%f-%f)=%f\n",current4(i,1),2*h,current4(i+1,2),current4(i-1,2),threepoint4(i));
    E4_threepoint(i)=threepoint4(i)*0.98+14.2*current4(i,2);
    fprintf("impressed voltage is %f\n",E4_threepoint(i));
end
h=-0.010;
threepoint4(61)=(1/(2*h))*(-3*current4(60,2)+4*current4(59,2)-current4(58,2));
fprintf("derivative of current at t=%f is:(1/%f)*(-3*%f+4*%f-%f)=%f\n",current4(61,1),2*h,current4(60,2),current4(59,2),current4(58,2),threepoint4(61));
E4_threepoint(61)=threepoint4(61)*0.98+14.2*current4(61,2);
fprintf("impressed voltage is %f\n",E4_threepoint(61));


%% ploting graphs
figure(1)
subplot(3,1,2);
hold on
grid on;
plot(current1(2:end,1),backward1(2:end),'-x');
plot(current2(2:end,1),backward2(2:end),'-o');
plot(current3(2:end,1),backward3(2:end),'-s');
plot(current4(2:end,1),backward4(2:end),'-');
legend('derivative of current1','derivative of current2','derivative of current3','derivative of current4');
xlabel('time');
ylabel('derivative of current');
title('derivative of current versus time graph in backward-differance formula');
hold off
subplot(3,1,1);
hold on
grid on;
plot(current1(1:end-1,1),forward1,'-x');
plot(current2(1:end-1,1),forward2,'-o');
plot(current3(1:end-1,1),forward3,'-s');
plot(current4(1:end-1,1),forward4,'-');
legend('derivative of current1','derivative of current2','derivative of current3','derivative of current4');
xlabel('time');
ylabel('derivative of current');
title('derivative of current versus time graph in forward-differance formula');
hold off;
subplot(3,1,3);
hold on;
grid on;
plot(current1(:,1),threepoint1,'-x');
plot(current2(:,1),threepoint2,'-o');
plot(current3(:,1),threepoint3,'-s');
plot(current4(:,1),threepoint4,'-');
legend('derivative of current1','derivative of current2','derivative of current3','derivative of current4');
xlabel('time');
ylabel('derivative of current');
title('derivative of current versus time graph in threepoint-differance formula');
hold off;


figure(2);
subplot(3,1,1);
hold on;
grid on;
plot(current1(1:end-1,1),E1_forward,'-x');
plot(current2(1:end-1,1),E2_forward,'-o');
plot(current3(1:end-1,1),E3_forward,'-s');
plot(current4(1:end-1,1),E4_forward,'-');
legend('E(t) for current1','E(t) for current2','E(t) for current3','E(t) for current4');
xlabel('time');
ylabel('voltage');
title('impressed voltage versus time graph in forward-differance formula');
hold off;

subplot(3,1,2);
hold on;
grid on;
plot(current1(2:end,1),E1_backward(2:end),'-x');
plot(current2(2:end,1),E2_backward(2:end),'-o');
plot(current3(2:end,1),E3_backward(2:end),'-s');
plot(current4(2:end,1),E4_backward(2:end),'-');
legend('E(t) for current1','E(t) for current2','E(t) for current3','E(t) for current4');
xlabel('time');
ylabel('voltage');
title('impressed voltage versus time graph in backward-differance formula');
hold off;

subplot(3,1,3);
hold on;
grid on;
plot(current1(:,1),E1_threepoint,'-x');
plot(current2(:,1),E2_threepoint,'-o');
plot(current3(:,1),E3_threepoint,'-s');
plot(current4(:,1),E4_threepoint,'-');
legend('E(t) for current1','E(t) for current2','E(t) for current3','E(t) for current4');
xlabel('time');
ylabel('voltage');
title('impressed voltage versus time graph in threepoint-differance formula');
hold off;
%% error analysis
fprintf("\nerror analysis\n\n");
fprintf("errors for forward-diffeence method\n");
fprintf("error of current1 is : %f\n",norm(E1_forward-12)/norm(12));
fprintf("error of current2 is : %f\n",norm(E2_forward-12)/norm(12));
fprintf("error of current3 is : %f\n",norm(E3_forward-12)/norm(12));
fprintf("error of current4 is : %f\n",norm(E4_forward-12)/norm(12));
fprintf("\n\nerrors for backward difference method\n");
fprintf("error of current1 is : %f\n",norm((E1_backward(2:end)-12))/norm(12));
fprintf("error of current2 is : %f\n",norm(E2_backward(2:end)-12)/norm(12));
fprintf("error of current3 is : %f\n",norm(E3_backward(2:end)-12)/norm(12));
fprintf("error of current4 is : %f\n",norm(E4_backward(2:end)-12)/norm(12));
fprintf("\n\nerrors for threepoint midpoint method\n");
fprintf("error of current1 is : %f\n",norm(E1_threepoint-12)/norm(12));
fprintf("error of current2 is : %f\n",norm(E2_threepoint-12)/norm(12));
fprintf("error of current3 is : %f\n",norm(E3_threepoint-12)/norm(12));
fprintf("error of current4 is : %f\n",norm(E4_threepoint-12)/norm(12));
fprintf("\n\nerrors for threepoint midpoint method without endpoints\n");
fprintf("error of current1 is : %f\n",norm(E1_threepoint(2:end-1)-12)/norm(12));
fprintf("error of current2 is : %f\n",norm(E2_threepoint(2:end-1)-12)/norm(12));
fprintf("error of current3 is : %f\n",norm(E3_threepoint(2:end-1)-12)/norm(12));
fprintf("error of current4 is : %f\n",norm(E4_threepoint(2:end-1)-12)/norm(12));