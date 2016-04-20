%5.1 Computer Assignment
%
%To run one of the function first use the following command:
%       hw5dot1 = hw4dot1
%
%Then you can call any of the functions in the following manner:
%       hw5dot1.problem1()
%       hw5dot1.problem2()
%       hw5dot1.problem3()
%       hw5dot1.problem5()
%

function api = hw5dot1()
    api.problem1 = @problem1;
    api.problem2 = @problem2;
    api.problem3 = @problem3;
    api.problem5 = @problem5;
end

%% Problem 1
%
%The program problem1() calculates the definite integral of a
%function f over the the interval [a,b] using the composite trapezoid rule
%with n equal subintervals. 
%
%Results:
%
%I tried the program on the function f(x) = x over the interval [0,1]
%with n = 2 equal subintervals and I printed out the result.
%
%

function problem1()
f = @(x) x
a = 0;
b = 1;
n = 2;
h = 1/n;

sum = 0;
for i = 0:n-1
   sum = sum + (h/2) *[f(a+h*i) + f(a+(h)*(i+1))];
end
%return integral
disp('integral of f(x) = x on [0,1]');
disp(sum);

end
%% Problem 2
%
%The program problem2() tests the implementation of the composite
%trapezoid rule from problem one on the integral over the following 
%functions using n = 2 equal subintervals:
%
% a) f(x) = sinx on the interval [0,pi]
% b) f(x) = e^x on the interval [0,1]
%
%Results:
%
%After approximating the integrals of the functions f(x) = sinx on 
%the interval [0,pi] and f(x) = e^x on the interval [0,1] and 
%comparing it to the actual value I got that 

%error of approximation of integral of sin(x) on [0,pi]
%     1.5000
% 
% error of approximation of integral of e^x on [0,1]
%     0.0356

function  problem2()
n = 2;
h = 1/n;

f1 = @(x) sin(x);
a1 = 0;
b1 = pi;

f2 = @(x) exp(x);
a2 = 0;
b2 = 1;


sum1 = 0;
sum2 = 0;
for i = 0:n-1
   sum1 = sum1 + (h/2) *[f1(a1+h*(b1-a1)*i) + f1(a1+(h)*(b1-a1)*(i+1))];
   sum2 = sum2 + (h/2) *[f2(a2+h*i) + f2(a2+(h)*(i+1))];
end
%return integral
disp('error of approximation of integral of sin(x) on [0,pi]');
disp(abs(sum1 - integral(f1,a1,b1)));
disp('error of approximation of integral of e^x on [0,1]');
disp(abs(sum2 - integral(f2,a2,b2)));


end

%% Problem 3
%
%The program problem3() computes pi from the integral of 
%the function f(x) = c/(1+x)^2 on the interval [a,b] where c is a constant.
%
%Results:
%
%By choosing a = 0, b = 1 and c = 4 I was able to compute pi from 
%an integral of the form stated above using the composite trapezoid rule with
%n=2 equal subintervals.
%
%

function problem3()
f = @(x) 4/(1+x^2)
a = 0;
b = 1;
n = 2;
h = 1/n;

sum = 0;
for i = 0:n-1
   sum = sum + (h/2) *[f(a+h*i) + f(a+(h)*(i+1))];
end
%return integral
disp('pi approximation:');
disp(sum);
end


%% Problem 5
%
%The program problem5() computes the gaussian probability integral
%by using small and large values for the lower and upper limits and 
%using the trapezoid rule for n =100 equal subintervals. The gaussian
%interval is then computed after first making the change of variable
% x = -lnt
%
%
%Results:
%
%By choosing a1 = 0, b1 = 10, 100, 1000  and 
%a2 = 0.01, 0.001, 0.0001 and b = 1 for the original function and 
%the function after applying the change of variables, respectively,
%I was able to use the composite trapezoid rule with
%n=100 equal subintervals to get an approximation of the gaussian
%probability integral with the following errors:
%
%error of approximation of integral of exp(-x^2) on [0,10]
    0.7976

% error of approximation of integral of exp(-(log(x))^2)/x on [0.01,1]
%     0.0089
% 
% error of approximation of integral of exp(-x^2) on [0,100]
%     0.8774
% 
% error of approximation of integral of exp(-(log(x))^2)/x on [0.001,1]
%    8.7879e-04
% 
% error of approximation of integral of exp(-x^2) on [0,1000]
%     0.8812
% 
% error of approximation of integral of exp(-(log(x))^2)/x on [0.0001,1]
%    8.0299e-05

function problem5()
n = 100;
h = 1/n;

f1 = @(x) exp(-x.^2);
a1 = 0;
b1 = 10;

%apply change of variables x = -lnt
f2 = @(x) exp(-(log(x)).^2)./x;
a2 = 0.01;
b2 = 1;


sum1 = 0;
sum2 = 0;
for i = 0:n-1
   sum1 = sum1 + (h/2) *[f1(a1+h*(b1-a1)*i) + f1(a1+(h)*(b1-a1)*(i+1))];
   sum2 = sum2 + (h/2) *[f2(a2+h*(b2-a2)*i) + f2(a2+(h)*(b2-a2)*(i+1))];
end
%return integral
disp('error of approximation of integral of exp(-x^2) on [0,10]');
disp(abs(sum1 - integral(f1,a1,b1)));
disp('error of approximation of integral of exp(-(log(x))^2)/x on [0.01,1]');
disp(abs(sum2 - integral(f2,a2,b2)));

sum1 = 0;
sum2 = 0;
a2 = 0.001;
b1 = 100;
for i = 0:n-1
   sum1 = sum1 + (h/2) *[f1(a1+h*(b1-a1)*i) + f1(a1+(h)*(b1-a1)*(i+1))];
   sum2 = sum2 + (h/2) *[f2(a2+h*(b2-a2)*i) + f2(a2+(h)*(b2-a2)*(i+1))];
end
%return integral
disp('error of approximation of integral of exp(-x^2) on [0,100]');
disp(abs(sum1 - integral(f1,a1,b1)));
disp('error of approximation of integral of exp(-(log(x))^2)/x on [0.001,1]');
disp(abs(sum2 - integral(f2,a2,b2)));

sum1 = 0;
sum2 = 0;
a2 = 0.0001;
b1 = 1000;
for i = 0:n-1
   sum1 = sum1 + (h/2) *[f1(a1+h*(b1-a1)*i) + f1(a1+(h)*(b1-a1)*(i+1))];
   sum2 = sum2 + (h/2) *[f2(a2+h*(b2-a2)*i) + f2(a2+(h)*(b2-a2)*(i+1))];
end
%return integral
disp('error of approximation of integral of exp(-x^2) on [0,1000]');
disp(abs(sum1 - integral(f1,a1,b1)));
disp('error of approximation of integral of exp(-(log(x))^2)/x on [0.0001,1]');
disp(abs(sum2 - integral(f2,a2,b2)));
end

