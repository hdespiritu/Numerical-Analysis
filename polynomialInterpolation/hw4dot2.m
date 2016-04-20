%4.2 Computer Assignment
%
%To run one of the function first use the following command:
%       hw4dot2 = hw4dot2
%
%Then you can call any of the functions in the following manner:
%       hw4dot2.problem1()
%       hw4dot2.problem2()
%       hw4dot2.problem9()
%

function api = hw4dot2()
    api.problem1 = @problem1;
    api.problem2 = @problem2;
    api.problem9 = @problem9;
end

%% Problem 1
%
%The program problem1() uses the Netwon form for polynomial interpolation
%with 21 equally spaced nodes on the interval [-5,5] to find the 
%interpolating polynomial p of degree 20 for the function
%f(x) = (x^2 +1)^-1
%
%Results:
%
%After printing out the the values of f(x) and p(x) at 41 equally
%spaced points, including the nodes p(x) does poorly for the first
%few values but gets better for later values
%
%

function problem1()
format long;
f = @(x) (x^2 + 1)^(-1);
n = 20;
h = 10/20;
coeff = [f(-5)]; 

%initialize array with the y values
for i = 1:n
    coeff = [coeff f(-5+(h*i))];
end

%compute the divided differences of f
for j = 2:n+1
    
    for i = n+1:-1:j
        coeff(i) = (coeff(i) - coeff(i-1))/((-5+(h*i)) - (-5+(h*(i-j))));
    end
end

%evaluate the polynomial at 41 equally spaced points including the nodes 
%and compare the value to the actual function f.
eval = [];
for t = -5:10/40:5
tmp = coeff(n+1);
for i = n: -1:1
  tmp = tmp* (t - (-5 + h*i)) + coeff(i);
end


eval = tmp
f(t)
end


end
%% Problem 2
%
%The program problem2() performs tha same experiment in problem1  except
%using Chebyshev nodes  xi = 5cos(i*pi/20), for i = 0,1,...,20 and
%                       xi = 5cos[(2*i+1)*pi/42], for i = 0,1,...,20
%
%Results:
%
%After printing out the the values of f(x), p1(x) and p2(x) at 41 equally
%spaced points, the chebyshev nodes do better than the equally spaced
%nodes with the second chebyshev nodes doing better than the first
%chebyshev nodes.
%

function  problem2()
format long;
f = @(x) (x^2 + 1)^(-1);
n = 20;
coeff1 = []; 
coeff2 = [];

%initialize array with the y values
for i = 0:n
    coeff1 = [coeff1 f(5*cos(i*pi/20))];
    coeff2 = [coeff2 f(5*cos((2*i+1)*pi/42))];
end

%compute the divided differences of f
for j = 2:n+1
    
    for i = n+1:-1:j
        coeff1(i) = (coeff1(i) - coeff1(i-1))/((5*cos(i*pi/20)) - (5*cos((i-j)*pi/20)));
        coeff2(i) = (coeff2(i) - coeff2(i-1))/((5*cos((2*i+1)*pi/42)) - (5*cos((2*(i-j)+1)*pi/42)));
    end
end

%evaluate the polynomial at 41 equally spaced points 
%and compare the value to the actual function f.
for t = -5:10/40:5
tmp1 = coeff1(n+1);
tmp2 = coeff2(n+1);
for i = n: -1:1
  tmp1 = tmp1* (t - (5*cos(i*pi/20))) + coeff1(i);
  tmp2 = tmp2* (t - (5*cos((2*i+1)*pi/42))) + coeff2(i);
end


eval1 = tmp1
eval2 = tmp2
f(t)
end


end

%% Problem 9
%
%The program problem9() find the poly of degree at most 10 that
%interpolates f(x) = |x| on [-1,1] at 11 equally spaced points and compares
%the value of f(x) and p(x) at 41 equally spaced points. Then the same
%is done with Chebyshev nodes.
%
%Results:
%
%After printing out the the values of f(x) and p(x) at 41 equally
%spaced points, including the nodes p(x) and doing the same for Chebyshev
%nodes I observed that the equally spaced points do a much worse job
%at the ends of the interval whereas the the Chebyshev nodes stay
%consistently good throughout the interval.
%

function problem9()
format long;
f = @(x) abs(x);
n = 10;
h = 2/10;
coeff1 = [f(-1)]; 
coeff2 = [f(cos(0))];
%initialize array with the y values
for i = 1:n
    coeff1 = [coeff1 f(-1+(h*i))];
    coeff2 = [coeff2 f(cos(i*pi/20))];
end

%compute the divided differences of f
for j = 2:n+1
    
    for i = n+1:-1:j
        coeff1(i) = (coeff1(i) - coeff1(i-1))/((-1+(h*i)) - (-1+(h*(i-j))));
        coeff1(i) = (coeff1(i) - coeff1(i-1))/((cos(i*pi/20)) - (cos((i-j)*pi/20)));
    end
end

%evaluate the polynomial at 41 equally spaced points including the nodes 
%and compare the value to the actual function f.
eval = [];
for t = -1:2/40:1
tmp1 = coeff1(n+1);
tmp2 = coeff2(n+1);
for i = n: -1:1
  tmp1 = tmp1* (t - (-1 + h*i)) + coeff1(i);
  tmp2 = tmp2* (t - (cos(i*pi/20)) + coeff2(i));
end


eval1 = f(t) - tmp1
eval2 = f(t) - tmp2


end
end
