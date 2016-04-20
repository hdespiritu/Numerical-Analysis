%8.1 Computer Assignment
%
%To run one of the function first use the following command:
%       hw8dot1 = hw8dot1
%
%Then you can call any of the functions in the following manner:
%       hw8dot1.problem5()
%       hw8dot1.problem8()
%

function api = hw8dot1()
    api.problem5 = @problem5;
    api.problem8 = @problem8;
   
end

%% Problem 5
%
%The program problem5() is a procedure for solving the system AX = B
%in which A, X and B are matrices of order nxn, nxm and nxm, respectively.
%The procedure was tested on three test cases:
%
%   A1 = [11 15 42; 14 5 67; 97 18 49];
%   X1 = [1 9 1;3 0 4;7 1 6];
%   B1 = [350 141 323;498 193 436;494 922 463];
% 
%   A2 = [29 81 77; 16 5 54; 13 32 91];
%   X2 = [9 8; 7 6; 5 4];
%   B2 = [1213 1026; 449 374; 796 660];
%
%   A3 = [1 3 7; 9 8 1; 2 3 9]; 
%   B3 = I   
%   X3 = A3^-1
%
%
%Results:
%
%In all three cases the [x_j1 x_j2 x_j3] vectors matched up with X matrices
%

function problem5()
A1 = [11 15 42; 14 5 67; 97 18 49];
X1 = [1 9 1;3 0 4;7 1 6];
B1 = [350 141 323;498 193 436;494 922 463];

A2 = [29 81 77; 16 5 54; 13 32 91];
X2 = [9 8; 7 6; 5 4];
B2 = [1213 1026; 449 374; 796 660];

A3 = [1 3 7; 9 8 1; 2 3 9];
X3 = [-0.7582    0.0659    0.5824;0.8681    0.0549   -0.6813;-0.1209   -0.0330    0.2088
];
B3 = [1 0 0;0 1 0; 0 0 1];

%apply forward elimination with scaled partial pivoting
%ie find the LU factorization of matrix A
[L1,U1,P1] = lu(A1);
[L2,U2,P2] = lu(A2);
[L3,U3,P3] = lu(A3);

%apply back-substitution using (permuted)columns,b_j, of B to find 
%corresponding columns of X, x_j.
%ie solve Lz_j = P*b_j and Ux_j = z_j for all j.

%apply back-substitution to the columns of B1
z_j1 = linsolve(L1,P1*B1(:,1));%j = 1
z_j2 = linsolve(L1,P1*B1(:,2));%j = 2
z_j3 = linsolve(L1,P1*B1(:,3));%j = 3


x_j1 = linsolve(U1,z_j1);
x_j2 = linsolve(U1,z_j2);
x_j3 = linsolve(U1,z_j3);

%check that [x_j1 x_j2 x_j3] = X1
disp('[x_j1 x_j2 x_j3]');
disp([x_j1 x_j2 x_j3]);
disp('X1');
disp(X1);

%apply back-substitution to the columns of B2
z_j1 = linsolve(L2,P2*B2(:,1));%j = 1
z_j2 = linsolve(L2,P2*B2(:,2));%j = 2

x_j1 = linsolve(U2,z_j1);
x_j2 = linsolve(U2,z_j2);

%check that [x_j1 x_j2] = X2
disp('[x_j1 x_j2]');
disp([x_j1 x_j2]);
disp('X2');
disp(X2);


%apply back-substitution to the columns of X3
z_j1 = linsolve(L3,P3*B3(:,1));%j = 1
z_j2 = linsolve(L3,P3*B3(:,2));%j = 2
z_j3 = linsolve(L3,P3*B3(:,3));%j = 3

x_j1 = linsolve(U3,z_j1);
x_j2 = linsolve(U3,z_j2);
x_j3 = linsolve(U3,z_j3);

%check that [x_j1 ... x_j3] = X3
disp('[x_j1 x_j2 x_j3]');
disp([x_j1 x_j2 x_j3]);
disp('X3');
disp(X3);
end

%% Problem 8
%
%The program problem8() investigates the numerical difficulties in
%inverting the given upper diagonal matrix
%
%Results:
%From looking at the determinant, -1.0240e-05, of the matrix there is 
%reason to believe that the matrix has a very large condition number,
%which if true will cause a large loss of significance when we 
%compute the inverse. It turns out the condition number of this matrix 
%is K(matrix) = 436.6469, which means we can lose up to approximately
%log(436.6469) = 2.6401 digits of significance. This can be troublesome 
%depending on the application.
%

function problem8()
matrix = [-0.0001 5.096 5.101 1.853; 0 3.737 3.740 3.392; 0 0 0.006 5.254; 0 0 0 4.567];

%check determinant of the matrix
determinant = det(matrix);

%compute the singular values of the matrix
singulValues = svd(matrix);
%compute the condition number of the matrix
sMax = max(singulValues);
sMin = min(singulValues);
condNum = sqrt(sMax/sMin);

%check that A=UDV' and B=UDV'
disp('det(matrix)');
disp(determinant);
disp('K(matrix)');
disp(condNum);



end