function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

[r,c]=size(A); %breaking matrix into rows and colums respectfully
if r~=c %making sure that it's a square matrix
    error('Matrix has to have same size rows and columns you weirdo')
end

L=eye(r); %starting with the identity matrix for A
U=A; %this will be changed based on the coeficients used
P=eye(c); % pivot matrix is the same as the identity matrix at the start
%Pivoting
for p=1:c-1 %this is because you only need to elimiate one less than the total number of rows
    coefs = abs(U(p:end,p)); %creates an array of the magnitude of the coefitients in the first column
    [lame,index] = max(coefs); %lame is a the value of the max function not the actual location which is what we want, ignore "lame"
    
    %will check to see if largest value is at top and if not then it will switch 
   if index~=p %if largest coeficient isn't the first
   old=U(p,:);
   oldp=P(p,:);
    U(p,:)=U(index+p-1,:);
    U(index+p-1,:)=old;
    %
    P(p,:)=P(index+p-1,:);
    P(index+p-1,:)=oldp;
   end

   %Forward elimination loop
   for e= p+1:c %for which iteration this is on, it will multiply the 
    hamilton = U(e,p)/U(p,p); %this is the coefitient that youre multiplying each coresponding row by to be able to eliminate the first value.
    L(e,p)=hamilton; %replacing the values in lower matrix with the multiplier
    U(e,p)=0; %setting it just so the first value is "cancelled" out
    U(e,p+1:c)=U(e,p+1:c)-hamilton*(U(p,p+1:c));
   end
end







