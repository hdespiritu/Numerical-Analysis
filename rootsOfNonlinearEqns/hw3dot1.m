%3.1 Computer Assignment
%
%To run one of the function first use the following command:
%       hw3dot1 = hw3dot1
%
%Then you can call any of the functions in the following manner:
%       hw3dot1.problem2()
%       hw3dot1.problem3()
%

function api = hw3dot1()
    api.problem2 = @problem2;
    api.problem3 = @problem3;
end

%% Problem 2
%
%The program problem2() uses the bisection method to find a root 
%of the equation   f(x) = 9*x^4 + 18*x^3 + 38*x^2 - 57*x + 14
%in the interval [0,1] with an error of at most 0.5e-8
%
%Results:
%
%Twenty-eight iterations of the bisection algorithm are calculated
%to find the approximate root x = 0.33333333 for the equation
%f(x) = 9*x^4 + 18*x^3 + 38*x^2 - 57*x + 14 
%in the interval [0,1] with an error of at most 0.5e-8
%

function [root,i] = problem2()
format long;

a = 0; b = 1; %endpoints of the interval [a,b]
errorBound = 0.5e-8; %max error of the approximate root
fxn = @(x)9*x^4 + 18*x^3 + 38 * x^2 - 57*x + 14; 

%pass the endpoints, errorBound and fxn to the bisection algorithm
%which returns the approximate root and the number of iterations executed
[root,i] = bisection(a, b, errorBound, fxn);
end

%% Problem 3
%
%The program problem3() attempts to find a root of the equation tanx = x 
%on the intervals [4,5] and [1,2] by using the bisection method 
%
%Results:
%
%Twenty-eight iterations of the bisection algorithm are calculated
%to find the approximate root x = 1.57079633 for the equation
%f(x) = tan(x) - x in the interval [4,5] with an error of at most 0.5e-8.
%In the interval [1,2], the bisection algorithm diverged to the value
%x = 4.49340946 after twenty-eight iterations.
%

function [root1, root2,i1,i2] = problem3()
format long;

%endpoints of the intervals
a1 = 4; b1 = 5;
a2 = 1; b2 =  2;
errorBound = 0.5e-8; %max error of approximate root
fxn = @(x) tan(x) - x;

%pass the endpoints, errorBound and fxn to the bisection algorithm
%which returns the approximate root and the number of iterations executed
[root1,i1] = bisection(a1, b1, errorBound, fxn);
[root2,i2] = bisection(a2, b2, errorBound, fxn);
end

%the function below takes as inputs the endpoints of an interval, 
%an error bound and a function and applies the bisection algorithm
%to return an approximate root and the number of iterations executed
function [c,i] = bisection(a, b, errorBound, f)
format long;

i = 0; %number of iterations calculated

%keep going until interval is satisfactorily small
while abs(b - a) >= errorBound
    i = i + 1
    c = 0.5*(b+a)  %find midpoint of [a,b]
    u =  f(a); %compute u = f(a)
    v = f(b);  %compute v = f(b)
    w = f(c);  %compute w = f(c)
    if w == 0 %c is the root, so return
        return
    elseif u*w < 0  %left half contains root, so set b = c
            b = c;
    else            %right half contains root, so set a = c
            a = c;
    end
end

%best estimate of root, where [a,b] is the last interval in the
%procedure
c = 0.5*(a+b)
end