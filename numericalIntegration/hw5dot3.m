%5.3 Computer Assignment



%% Problem 1
%
%The program problem1() finds approximate values for integrals
%of the functions 
%
%       f(x) = 4/(1+x^2), on the interval [0,1]
%       g(x) = 8*((1-x^2)^0.5 - x), on the interval [0, 1/(2^0.5)]
%
%using the adaptive Simpson scheme with epsilon = 0.5x10^(-5)
%and level_max = 4.
%
%Results:
%
%Both integrals gave an approximation of pi:
%       the integral of f on the interval [0,1] gave 3.1415927 and
%       the integral of g on the interval [0,1/2^0.5] gave 3.1415925
%
%I also sketched both f(x) and g(x) by plotting 100 points in their 
%respective intervals and I plotted the points where the intervals
%are split.
%

function problem1()
format long
f1 = @(x) 4/(1+x^2);
a1 = 0; b1 = 1;

f2 = @(x) 8*((1-x^2)^0.5 - x);
a2 = 0; b2 = 1/(2^0.5);

epsilon = 0.5e-5;
levelMax = 4;
level = 0;


disp('integral of f(x) = 4/(1+x^2) on the interval [0,1]:');
[integral,partitions1] = Simpson(f1,a1,b1,epsilon,level,levelMax,[]);
disp(single(integral));
disp('integral of g(x) = 8*((1-x^2)^0.5 - x) on the interval [0, 1/(2^0.5)]:');
[integral,partitions2] = Simpson(f2,a2,b2,epsilon,level,levelMax,[]);
disp(single(integral));

%display the segmentation points
disp('partitions1:');
disp(single(partitions1));
disp('partitions2:');
disp(single(partitions2));

%
%Plot segmentation of of intervals
%
figure; 
hold;
x = 0:1e-2:1;
plot(x,4./(1+x.^2));
xlabel('x');
ylabel('y');
title('f(x) = 4/(1+x^2)');
for idx = 1:length(partitions1)
plot([partitions1(idx) partitions1(idx)], [0 f1(partitions1(idx))],'r');
h = plot(partitions1(idx), f1(partitions1(idx)),'Xk');
set(h,'linewidth',2);
end

figure; 
hold; 
x = 0:1e-2:1/2^0.5;
plot(x,8*((1-x.^2).^0.5 - x));
xlabel('x');
ylabel('y');
title('g(x) = 8*((1-x^2)^{0.5} - x)');
for idx = 1:length(partitions2)
plot([partitions2(idx) partitions2(idx)], [0 f2(partitions2(idx))],'r');
h = plot(partitions2(idx), f2(partitions2(idx)),'Xk');
set(h,'linewidth',2);
end
end

function [result, partitions] = Simpson(f,a,b,epsilon, level, level_max, partitions)
level = level + 1;
h = b-a;
c = (a+b)/2;


oneSimpson = h*(f(a) + 4*f(c) + f(b))/6;
d = (a+c)/2;
e = (c+b)/2;

partitions = [partitions [a,b,c,d,e]];

twoSimpson = h*(f(a) + 4*f(d) + 2*f(c) + 4*f(e) + f(b))/12;
if level >= level_max
    result = twoSimpson;
    %disp('maximum level reached');
else
    if abs(twoSimpson - oneSimpson) < 15*epsilon
        result = twoSimpson + (twoSimpson - oneSimpson)/15;
    else
        leftSimpson = Simpson(f,a,c,epsilon/2,level, level_max, partitions);
        rightSimpson = Simpson(f,c,b,epsilon/2,level, level_max, partitions);
        result = leftSimpson + rightSimpson;
    end
end
end
