%3.2 Computer Assignment
%
%To run one of the function first use the following command:
%       hw3dot2 = hw3dot2
%
%Then you can call any of the functions in the following manner:
%       hw3dot2.problem1()
%       hw3dot2.problem15()
%       hw3dot2.problem16()
%


function api = hw3dot2()
    api.problem1 = @problem1;
    api.problem15 = @problem15;
    api.problem16 = @problem16; 
end

%% Problem 1
%
%The program problem1() uses one iteration of Newton's method to  
%find a root for the equations  
%                    f(x) = tanx -x             with x0 = 7 
%                    g(x) = exp(x) - (x+9)^0.5  with x0 = 2
%


function problem1()

x0_f = 7;
f = @(x) tan(x) - x;
fDeriv = @(x) sec(x)^2 - 1;

x0_g = 2;
g = @(x) exp(x) - (x + 9)^0.5;
gDeriv = @(x) exp(x) - 1/(2*(x+9)^0.5);

n = 1; %number of iterations of Newton's method
error = 0;%not needed for this problem

fRoot = newtonsMethod(x0_f, f, fDeriv, error, n);
gRoot = newtonsMethod(x0_g, g, gDeriv, error, n);

fprintf('\n(root,f(root)): (%f , %f) \n(root,g(root)): (%f, %f) \n\n',fRoot,f(fRoot),gRoot,g(gRoot));
end

%% Problem 15
%
%The program problem15() uses Newton's method to find a root 
%for the equation  f(x) = 0.5x^2 + x + 1 - exp(x) starting with x0 = 1
%                  
%


function problem15()
x0 = 1;
f = @(x) 0.5*x^2 + x + 1 - exp(x);
fDeriv = @(x) x + 1 - exp(x);

n = 20; 
error = 0.5e-8;

root = newtonsMethod(x0,f,fDeriv,error, n)
end

%% Problem 16
%
%The program problem16() uses Newton's method to attempt to find a root 
%for the equation  f(x) = x^5 - 9*x^4 - x^3 + 17*x^2 - 8*x - 8
%starting with x0 = 0
%                  
%


function problem16()

x0 = 0;
f = @(x) x^5 - 9*x^4 - x^3 + 17*x^2 - 8*x - 8;
fDeriv = @(x) 5*x^4 - 36*x^3 - 3*x^2 + 34*x - 8;

n = 20; 
error = 0.5e-8;

root = newtonsMethod(x0,f,fDeriv,error, n);
disp(root);
end

function [x] = newtonsMethod(x0, fxn, fxnDeriv, error,n)
x = x0;
for i = 1:n
    %make sure we don't get an overflow by making sure derivative is not
    %too small
    if abs(fxnDeriv(x)) < error
        disp('Derivative too small');
        return;
    end
    d = fxn(x)/fxnDeriv(x);
    x = x - d;
    
    %if the desired accuracy is reached before max number of iterations,
    %return the approximate root
    if(abs(d) <= error)
        disp('Convergence');
        return;
    end
end
end
