%2.2 Computer Assignment
%
%To run one of the function first use the following command:
%       hw2dot2 = hw2dot2
%
%Then you can call any of the functions in the following manner:
%       hw2dot2.problem2()
%       hw2dot2.problem3()
%       hw2dot2.problem4()
%       hw2dot2.problem9()
%

function api = hw2dot2()
    api.problem2 = @problem2;
    api.problem3 = @problem3;
    api.problem4 = @problem4;
    api.problem9 = @problem9;
   
end

%% Problem 2
%
%The program problem2() 
%solves the given matrix by Gaussian elimination with scaled 
%partial pivoting using procedures Gauss and Solve
%
%Results:
%The program gives the correct answer to four decimal points when
%compared to matlab's built-in gaussian elimination function.
%
%

function problem2()
A = [0.4096 0.1234 0.3678 0.2943; 
     0.2246 0.3872 0.4015 0.1129;
     0.3645 0.1920 0.3781 0.0643;
     0.1784 0.4002 0.2786 0.3927];
b = [0.4043; 0.1550; 0.4240; 0.2557];
n = length(A);
l = 1:7;
x(n) = 0;

[a,l] = gauss(n,A,l);
x = solve(n,a,l,b,x);

disp('gauss & solve x');
disp(x);
disp('linsolve x');
disp(linsolve(A,b));
end

%% Problem 3
%
%The program problem3() solves the system given in Problem 2 again
%except that the digit 0.3645 becomes 0.3345.
%
%
%Results:
%The reason there is such a huge difference in the solution for
%the matrix when only one digit is slightly changed is that
%the matrix has a condition number,K(A)=9.3588, that is 
%roughly ten times larger than the ideal condition number
%and ill-conditioned linear systems can display large changes 
%in solutions when a small change in the coefficient matrix is made
%

function problem3()
A = [0.4096 0.1234 0.3678 0.2943; 
     0.2246 0.3872 0.4015 0.1129;
     0.3345 0.1920 0.3781 0.0643;
     0.1784 0.4002 0.2786 0.3927];
b = [0.4043; 0.1550; 0.4240; 0.2557];
n = length(A);
l = 1:7;
x(n) = 0;

[a,l] = gauss(n,A,l);
x = solve(n,a,l,b,x);

disp('gauss & solve x');
disp(x);
disp('linsolve x');
disp(linsolve(A,b));

%compute the singular values of the matrix
singulValues = svd(A);
%compute the condition number of the matrix
sMax = max(singulValues);
sMin = min(singulValues);
condNum = sqrt(sMax/sMin);
disp('K(matrix)');
disp(condNum);
end

%% Problem 4
%
%The program problem4() verifies the solution to the (ill-conditioned)
%Hilbert matrix and then solves the system of equations using
%Gauss and Solve for some values of 2 <= n <= 15 to see whether
%the result is predicted. The computational result for n = 2 is compared 
%to the answer done by hand to see what difficulties occured in 
%the computer
%
%
%Results:
%The Hilbert matrix for n = 2, 5, 10 has condition numbers 
% K(A1) = 4.3911, K(A2) = 690.3675 and K(A3) = 4.0031x10^6
% so the respective expected loss in precision is
%   log(4.3911) = 0.6426
%   log(690.3675) = 2.8391
%   log(4.0031x10^6) = 6.6024
%which is consistent to the loss of precision seen when comparing
%to my hand calculation and matlab's built-in gaussian elimination function
%

function problem4()


n1 = 2;
A1 = [1 0.5; 0.5 (1/3)];
b1 = [sum(A1(1,:)); sum(A1(2,:))];


n2 = 5;
for i = 1:5
    for j = 1:5
        A2(i,j) = 1/(i+j-1);
    end
end
b2 = [sum(A2(1,:)); sum(A2(2,:));sum(A2(3,:)); sum(A2(4,:));sum(A2(5,:))];


n3 = 10;
for i = 1:10
    for j = 1:10
        A3(i,j) = 1/(i+j-1);
    end
end

b3 = [sum(A3(1,:)); sum(A3(2,:));sum(A3(3,:)); sum(A3(4,:));sum(A3(5,:));
       sum(A3(6,:)); sum(A3(7,:));sum(A3(8,:)); sum(A3(9,:));sum(A3(10,:))];
   
l1 = 1:n1;
l2 = 1:n2;
l3 = 1:n3;

x1(n1) = 0;
x2(n2) = 0;
x3(n3) = 0;

[a1,l1] = gauss(n1,A1,l1);
x1 = solve(n1,a1,l1,b1,x1);

disp('gauss & solve x1');
disp(x1');
disp('linsolve x1');
disp(linsolve(A1,b1));

[a2,l2] = gauss(n2,A2,l2);
x2 = solve(n2,a2,l2,b2,x2);

disp('gauss & solve x2');
disp(x2');
disp('linsolve x2');
disp(linsolve(A2,b2));

[a3,l3] = gauss(n3,A3,l3);
x3 = solve(n3,a3,l3,b3,x3);

disp('gauss & solve x3');
disp(x3');
disp('linsolve x3');
disp(linsolve(A3,b3));

%compute the singular values of the matrix
singulValues1 = svd(A1);
singulValues2 = svd(A2);
singulValues3 = svd(A3);
%compute the condition number of the matrix
sMax1 = max(singulValues1);
sMin1 = min(singulValues1);
condNum1 = sqrt(sMax1/sMin1);

sMax2 = max(singulValues2);
sMin2 = min(singulValues2);
condNum2 = sqrt(sMax2/sMin2);

sMax3 = max(singulValues3);
sMin3 = min(singulValues3);
condNum3 = sqrt(sMax3/sMin3);


disp('K(A1)');
disp(condNum1);
disp('K(A2)');
disp(condNum2);
disp('K(A3)');
disp(condNum3);
end

%% Problem 9
%
%The program problem9() solves the given augmented matrix using
%Gauss and Solve and then using procedure Naive_Gauss to compare
%the results
%
%
%Results:
%Without the scaled partial pivoting the forward elimination and 
%back-subsitution done by Naive_Gauss causes there to be alot of 
%significant digits to be lost, whereas scaled partial pivoting
%and backsubstitution (done by Gauss & solve) retains the significant
%digits to allow the answer to match matlab's built-in gaussian
%elimination function to four decimal digits.
%
%

function problem9()
A = [0.0001 -5.0300 5.8090 7.8320;
     2.2660 1.9950 1.2120 8.0080;
     8.8500 5.6810 4.5520 1.3020;
     6.7750 -2.2530 2.9080 3.9700];
b = [9.5740; 7.2190; 5.7300; 6.2910];
n = length(A);
l = 1:7;
x1(n) = 0;

[a,l] = gauss(n,A,l);
x1 = solve(n,a,l,b,x1);


x2 = naiveGauss(n,A,b);

disp('linsolve x');
disp(linsolve(A,b)');
disp('gauss & solve x');
disp(x1);
disp('naiveGauss');
disp(x2);


end

%performs scaled partial pivoting
function [a,l] = gauss(n,a,l)
s(n) = 0;
for i = 1:n
    l(i) = i;
    smax = 0;
    for j = 1: n
        smax = max(smax,abs(a(i,j)));
    end
    s(i) = smax;
end
for k = 1:n-1
    rmax = 0;
    for i = k: n
        r = abs(a(l(i),k)/s(l(i)));
        if(r > rmax)
            rmax = r;
            j = i;
        end
    end
    tmp = l(j);
    l(j) = l(k);
    l(k) = tmp;
    
    for i = k+1 : n
        xmult = a(l(i),k)/a(l(k),k);
        a(l(i),k) = xmult;
        for j = k+1 : n
            a(l(i),j) = a(l(i),j) - xmult*a(l(k),j);
        end
    end
end

end%performs back subsitution  
function [x] = solve(n, a, l, b, x)
for k = 1: n-1
    for i = k+1 : n
        b(l(i)) = b(l(i)) - a(l(i),k)*b(l(k));
    end
end
x(n) = b(l(n))/a(l(n),n);
for i = (n-1):-1:1
    sum = b(l(i));
    for j = i+1 : n
        sum = sum - a(l(i),j)*x(j);
    end
    x(i) = sum/a(l(i),i);
end
end

%performs forward elimination
function x = naiveGauss(n, A, b)
for k = 1:n-1
    for i = k+1:n
        xmult = A(i,k)/A(k,k);
        A(i,k) = xmult;
        for j = k + 1: n
            A(i,j) = A(i,j) - xmult*A(k,j);
        end
        b(i) = b(i) - xmult*b(k);
    end
end
x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    sum = b(i);
    for j = i+1: n
        sum = sum - A(i,j)*x(j);
    end
    x = [x (sum/A(i,i))];
end

end