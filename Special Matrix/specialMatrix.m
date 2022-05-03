function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);
if nargin~=2 %not really any need for this due to new MatLab update but whatever
    error('There needs to be exactly 2 inputs for the function specialMatrix to run')
end 
% Now the real challenge is to fill in the correct values of A
for i=1:n
    for k=1:m 
        if i==1 %starting to make the first row of the matrix
        A(i,k)= k;
        elseif k==1 %column
            A(i,k) = i;
        else
            A(i,k)= A(i,k-1) + A(i-1,k); %adresses the values to the left and up respectivly 
        end
    end
end
end

% Things beyond here are outside of your function
