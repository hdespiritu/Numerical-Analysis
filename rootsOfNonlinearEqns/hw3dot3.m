%3.3 Computer Assignment
%
%To run one of the function first use the following command:
%       hw3dot3 = hw3dot3
%
%Then you can call any of the functions in the following manner:
%       hw3dot3.problem6()
%       hw3dot3.problem10()
%       
%

function api = hw3dot3()
    api.problem6 = @problem6;
    api.problem10 = @problem10;
end

%% Problem 6
%
%The program problem6() uses the secant method and newton's method to 
%find a root for the equation   f1(x) = x^3 + 3*x + 1 and the
%equation f2(x) = 3*x^2 - 2*cos(x).
%
%


function problem6()
%Consider some of the points discussed in Sec 3.3 in 
%paragraph 'Comparison of Methods' on p147 in book

%Part a
f1 = @(x) x^3 + 3*x + 1;
f1Deriv = @(x) 3*x^2 + 3;
error = 1e-8;
a1 = 2;
b1 = newtonsMethod(a1,f1,f1Deriv,error,1);
n = 20;

%Part b
f2 = @(x) x^3 - 2*sin(x);
f2Deriv = @(x) 3*x^2 - 2*cos(x);
a2 = 0.5;
b2 = newtonsMethod(a2,f2,f2Deriv,error,1);
n = 20;

%compare secant method with newton's method for f1 
secantMethod(a1,b1,f1,error,n);
newtonsMethod(a1,f1,f1Deriv, error,n);

%compare secant method with newton's method for f2
secantMethod(a2,b2,f2,error,n);
newtonsMethod(a2,f2,f1Deriv, error,n);
end

%% Problem 10
%
%The program problem10() uses the secant method to 
%find a root for the equation   f1(x) = arctan(x) to observe whether 
%the ratio of errors e_n+1/(e_n*e_n-1) converges to -0.5f''(r)/f'(r).
%


function problem10()

f = @(x) atan(x);
fDeriv = @(x) 1/(1+x^2);
f2Deriv = @(x) -(2*x)/(1+x^2)^2;
r = 0;

a1 = -1;
b1 = 1;
error = 1e-8;
n = 20;
c = -0.5 * f2Deriv(r)/fDeriv(r);

secantMethod(a1,b1,f,error,n);

end

function [a, f_a] = secantMethod(a,b,fxn,error,n)
format long;
disp('\n Secant Method: \n');

f_a = fxn(a);
f_b = fxn(b);

for i = 2:n
%we want |f(a)| <= |f(b)| 
if abs(f_a) > abs(f_b)
    %interchange x0 and x1
    tmp = a;
    a = b;
    b = tmp;
    
    %interchange f_a and f_b
    tmp = f_a;
    f_a = f_b;
    f_b = tmp;
end

d = (b - a)/(f_b - f_a);
% error = abs(d) %for problem10
b = a;
f_b = f_a;
d = d*f_a;

%check for convergence
if abs(d) < error
    disp('Convergence');
    return;
end
    
a = a - d
f_a = fxn(a)
end
end

function [root] = newtonsMethod(x0, fxn, fxnDeriv, error,n)
x = x0;
for i = 1:n
    %make sure we don't get an overflow by making sure derivative is not
    %too small
    if abs(fxnDeriv(x)) < 1e-15
        disp('Derivative too small');
        return;
    end
    d = fxn(x)/fxnDeriv(x);
    root = x - d;
    
    %if the desired accuracy is reached before max number of iterations,
    %return the approximate root
    if(fxn(x)/fxnDeriv(x) <= error)
        disp('Convergence');
        return;
    end
    x = root;
end
end