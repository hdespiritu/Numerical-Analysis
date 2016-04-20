%8.2 Computer Assignment
%
%To run one of the function first use the following command:
%       hw8dot2 = hw8dot2
%
%Then you can call any of the functions in the following manner:
%       hw8dot2.problem10()
%       hw8dot2.problem12()
%       hw8dot2.problem13()
%

function api = hw8dot2()
    api.problem10 = @problem10;
    api.problem12 = @problem12;
    api.problem13 = @problem13;
   
end

%% Problem 10
%
%The program problem10()computes the singular value decompositions of the
%given matrices and verifies that each result satisfies the equation
%A = UDV'
%
%Results:
%A = UDV' and B = UDV' matched exactly for 4 decimal values of accuracy
%
%

function problem10()
matrixA = [1 1; 0 1; 1 0];
matrixB = [1 3 -2; 2 7 5; -2 -3 4; 5 -3 -2];
S_a = matrixA'*matrixA;
S_b = matrixB'*matrixB;

%compute singular value decompositions of matrix A and matrix B
[U_a,D_a,V_a] = svd(matrixA);
[U_b,D_b,V_b] = svd(matrixB);

%check that A=UDV' and B=UDV'
disp('matrix A');
disp(matrixA);
disp('UDV''');
disp(U_a*D_a*V_a');
disp('matrix B');
disp(matrixB);
disp('UDV''');
disp(U_b*D_b*V_b');







end
%% Problem 12
%
%The program problem12() computes the singular value decomposition of the
%the given matrices.
%
%
%Results:
%A = UDV' , B = UDV' ,  C = UDV' amatched exactly for 
%4 decimal values of accuracy
%

function  problem12()
matrixA = [2 1 -2];
matrixB = [3;4];
matrixC = [-5/2 + 3*sqrt(3); 5/2*sqrt(3) + 3];


%compute singular value decompositions
%of matrix A, matrix B and matrix C
[U_a,D_a,V_a] = svd(matrixA);
[U_b,D_b,V_b] = svd(matrixB);
[U_c,D_c,V_c] = svd(matrixC);

%check that A=UDV' and B=UDV' and C = UDV'
disp('matrix A');
disp(matrixA);
disp('UDV''');
disp(U_a*D_a*V_a');
disp('matrix B');
disp(matrixB);
disp('UDV''');
disp(U_b*D_b*V_b');
disp('matrix C');
disp(matrixC);
disp('UDV''');
disp(U_c*D_c*V_c');
end

%% Problem 13
%
%The program problem13() computes the eigenvalues, singular values and
%condition number of a given matrix
%
%
%Results:
%The matrix has eigenvalues 1, 2 and 3
%singular values 817.7597, 2.4750 and 0.0030(negligible)
%and condition number 525.2129
%

function  problem13()
matrix = [-149 -50 -154; 537 180 546; -27 -9 -25];

%compute the eigenvalues of the matrix
[V,D] = eig(matrix);
eigenvalues = diag(D);
%compute the singular values of the matrix
singulValues = svd(matrix);
%compute the condition number of the matrix
sMax = max(singulValues);
sMin = min(singulValues);
condNum = sqrt(sMax/sMin);

disp('eigenvalues of matrix');
disp(eigenvalues);
disp('singular values of matrix');
disp(singulValues);
disp('condition number of matrix');
disp(condNum);
end
