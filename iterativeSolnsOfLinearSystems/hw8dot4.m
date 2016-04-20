%8.4 Computer Assignment
%
%To run one of the function first use the following command:
%       hw8dot4 = hw8dot4
%
%Then you can call any of the functions in the following manner:
%       hw8dot4.problem2()
%       hw8dot4.problem3()
%       hw8dot4.problem4()
%       
%

function api = hw8dot4()
    api.problem2 = @problem2;
    api.problem3 = @problem3;
    api.problem4 = @problem4;
   
end

%% Problem 2
%
%The program problem2() 
%uses the Jacobi, Gauss-Seidel, and SOR (omega = 1.1) iterative methods to
%solve the given linear system ot four decimal places (rounded) of
%accuracy. A comparison for the number of iterations needed for 
%each of the different methods was done. (The exact solution of the
%linear system is [1, -1, 1, -1]).
%
%


function problem2()
A = [7 1 -1 2;
     1 8 0 -2;
     -1 0 4 -1;
     2 -2 -1 6];
b = [3;-5;4;-3];
n = size(A);
x(n) = 0;
omega = 1.1;

[x1,k1] = Jacobi(A,b,x);
[x2,k2] = GaussSeidel(A,b,x);
[x3,k3] = SOR(A,b,x,omega);

disp('Jacobi');
disp(k1);
disp('Gauss-Seidel');
disp(k2);
disp('SOR(omega=1.1)');
disp(k3);
end

%% Problem 3
%
%The program problem3() uses the Jacobi, Gauss-Seidel, and the SOR 
%(omega = 1.4) iterative metods, to solve the given linear system to four
%decimal places of accuracy.A comparison for the number of iterations needed for 
%each of the different methods was done. (The exact solution of the
%linear system is [1, -1, 1, -1]).
%
%


function problem3()
A = [7 3 -1 2;
     3 8 1 -4;
    -1 1 4 -1;
     2 -4 -1 6];
b = [-1 0 -3 1];
n = length(A);
x(n) = 0;
omega =1.4;

[x1,k1] = Jacobi(A,b,x);
[x2,k2] = GaussSeidel(A,b,x);
[x3,k3] = SOR(A,b,x,omega);

disp('Jacobi');
disp(k1);
disp('Gauss-Seidel');
disp(k2);
disp('SOR(omega=1.4)');
disp(k3);
end

%% Problem 4
%
%The program problem4() solves the given system of linear equations using
%the SOR iterative method with values of omega = 1, 0.1, 2.
%The number of iterations for convergence was plotted versus the values
%of omega to determine which value of omega resulted in the fastest
%convergence.
%
%


function problem4()

A = [7 3 -1 2;
     3 8 1 -4;
    -1 1 4 -1;
     2 -4 -1 6];
b = [-1 0 -3 1];
n = length(A);
x(n) = 0;
k = [];
for omega = 1:0.1:2
   [~,k_i] = SOR(A,b,x,omega);
   k = [k k_i];
end



figure
plot(1:0.1:2,k);
title('omega vs. num iterations');
xlabel('omega');
ylabel('# of iterations');

end

function [x,k] = Jacobi(A,b,x)
kmax = 100;
delta = 10e-10;
epsilon = 0.5e-4;
n = size(A);
for k = 1: kmax
    y = x;
    for i = 1:n
        sum = b(i);
        diag = A(i,i);
        if abs(diag) < delta
            disp('diagonal element too small');
            return;
        end
        for j = 1:n
            if j ~= i
                sum = sum - A(i,j)*y(j);
            end
        end
        x(i) = sum/diag;
    end
    fprintf('k: %d\nx:\n',k);
    disp(x);
    if norm(x-y) < epsilon
        fprintf('k: %d\nx:\n',k);
        disp(x);
        return;
    end
end
disp('maximum iterations reached');
end

function [x,k] = GaussSeidel(A,b,x)
kmax = 100;
delta = 10e-10;
epsilon = 0.5e-4;
n = size(A);
for k = 1: kmax
    y = x;
    for i = 1:n
        sum = b(i);
        diag = A(i,i);
        if abs(diag) < delta
            disp('diagonal element too small');
            return;
        end
        for j = 1: i-1
            sum = sum - A(i,j)*x(j);
        end
        for j = i+1 : n
            sum = sum - A(i,j)*x(j);
        end
        x(i) = sum/diag;
    end
    fprintf('k: %d\nx:\n',k);
    disp(x);
    if norm(x-y) < epsilon
        fprintf('k: %d\nx:\n',k);
        disp(x);
        return;
    end
end
disp('maximum iterations reached');
end

function [x,k] = SOR(A,b,x,omega)
kmax = 100;
delta = 10e-10;
epsilon = 0.5e-4;
n = size(A);
for k = 1: kmax
    y = x;
    for i = 1:n
        sum = b(i);
        diag = A(i,i);
        if abs(diag) < delta
            disp('diagonal element too small');
            return;
        end
        for j = 1: i-1
            sum = sum - A(i,j)*x(j);
        end
        for j = i+1 : n
            sum = sum - A(i,j)*x(j);
        end
        x(i) = sum/diag;
        x(i) = omega*x(i) + (1-omega)*y(i);
    end
    fprintf('k: %d\nx:\n',k);
    disp(x);
    if norm(x-y) < epsilon
        fprintf('k: %d\nx:\n',k);
        disp(x);
        return;
    end
end
disp('maximum iterations reached');
end

