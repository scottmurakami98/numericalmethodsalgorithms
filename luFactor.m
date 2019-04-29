function [L,U,P]=luFactor(A)
%luFactor evaluates the LU factorization of a square matrix.

% Scott Murakami
% MECH105
% 3-30-19

%-----------------------------------------------------------------------

% Inputs:
% A = The matrix containing the coefficients of x

% Outputs:
% L = Lower triangular matrix
% U = Upper triangular matrix
% P = The pivot matrix

%-----------------------------------------------------------------------
if nargin ~= 1 %Check that there is only one input
    error('There must be only one input.')
end

[m,n] = size(A);
if m ~= n %Check that input A is a square matrix
    error('LU factorization requires a square matrix.')
end

L = eye(n); %Identity matrix of size n
P = L; %Initial pivot matrix (same as identity L at this stage)
U = A; %Upper triangular matrix (same as A at this stage)

for i = 1:n
    [~,m] = max(abs(U(i:n,i))); %Determine the row containing the maximum abs value 
    m = m+i-1;
    
    if m ~= i
        pivint = U(i,:); %Pivot m and n
        U(i,:) = U(m,:);
        U(m,:) = pivint;
        
        pivint = P(i,:); %Bookkeeping for P
        P(i,:) = P(m,:);
        P(m,:) = pivint;
        if i >1
            pivint = L(i,1:i-1);
            L(i,1:i-1) = L(m,1:i-1);
            L(m,1:i-1) = pivint;
        end
    end
    for j = i+1:n %Row operations
        L(j,i) = U(j,i)/U(i,i); %Operations on L
        U(j,:) = U(j,:)-L(j,i)*U(i,:); %Operations on U (elim)
    end
end

P
U

