%5.4 Computer Assignment
%
%To run one of the function first use the following command:
%       hw5dot4 = hw5dot4
%
%Then you can call any of the functions in the following manner:
%       hw5dot4.problem1()
%       hw5dot4.problem2()
%

function api = hw5dot4()
    api.problem1 = @problem1;
    api.problem2 = @problem2;
end

%% Problem 1
%
%The program problem1() evaluates the integral of a function f(x)
%over the interval [a,b] using "Method of Undetermined Coefficients"
%   
%
%Results:
%
%In order to change the interval of integration from [-1,1] to [a,b],
%we need to use the transformation x = 0.5(b-a)*t + 0.5*(b-a).
%I tried the program on the functions f(x) = 1, f(x) = x and 
%f(x) = x^2 over the interval [0,2] and I printed out the result.
%
%

function problem1()
a = 0;
b = 2;
f1 = @(x) 1;
f2 = @(x) x;
f3 = @(x) x^2;
g = @(x) 0.5*(b-a)*x + (a+b);

fprintf('integral of f(x) = 1 on [0,2]\n');
integ = 0.5*(b-a)*((5/9)*f1(g(-(3/5)^0.5)) + (8/9)*f1(g(0)) + (5/9)*f1(g((3/5)^0.5))

fprintf('integral of f(x) = x on [0,2]\n');
integ = 0.5*(b-a)*((5/9)*f2(g(-(3/5)^0.5)) + (8/9)*f2(g(0)) + (5/9)*f2(g((3/5)^0.5))

fprintf('integral of f(x) = x^2 on [0,2]\n');
integ = 0.5*(b-a)*((5/9)*f3(g(-(3/5)^0.5)) + (8/9)*f3(g(0)) + (5/9)*f3(g((3/5)^0.5))

end
%% Problem 2
%
%The program problem2() tests the implementation of the gaussian quadrature
%after a change of intervals from problem one on the integral over the following 
%function 
%
%
% b) f(x) = e^(-cos^2(x)) on the interval [0,2]
%
%Results:
%
%After approximating the integrals of the functions f(x) = e^(-cos^2(x)) on 
%the interval [0,2] I got that 
%

function  problem2()
a = 0;
b = 2;
f1 = @(x) exp(-(cos(x))^2);
g = @(x) 0.5*(b-a)*x + (a+b);

fprintf('integral of f(x) = e^(-cos^2(x)) on [0,2]\n');
integ = 0.5*(b-a)*((5/9)*f1(g(-(3/5)^0.5)) + (8/9)*f1(g(0)) + (5/9)*f1(g((3/5)^0.5))

end

