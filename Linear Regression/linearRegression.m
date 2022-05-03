function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

%Garrett Nowell

%% Pre Tests
xl=numel(x);
yl=numel(y);
%making the length of the arrays

if xl~=yl
    error('Both x & y need to be same length')
    %makes sure that they are the same length before calculating values
end

%% Sorting
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
%sorting function provided

Q1x=floor((xl+1)/4);
Q3x=floor((3*xl+3)/4);
%calculating the Q1 and Q3 index values

Q1=sortedY(Q1x);
Q3=sortedY(Q3x);
%finding the actual values of Q1 & Q3

IQR=Q3-Q1;
%calculating IQR

%% Filtering
fY = [];
fX = []; %zeroes(xL)
index = 1;
for i=1:xl
    if sortedY(i) > Q1-(1.5*IQR) && sortedY(i) < Q3+ (IQR*1.5) %if an array value falls inbetween the accepted range, it will be added to a new array and if not then it will be disregarded
        fY(index)=sortedY(i);
        fX(index)=sortedX(i);
        index = index+1;
    end
end

%% Linear Regression Section

ymean= mean(fY);
xmean= mean(fX); %means of the new arrays
n=numel(fX);%number of terms in the array
sumx=(mean(fX)*n); %this is totally cheating but i think it's funny
sumy=(mean(fY)*n); %again, totally cheating
sumxy=0;
sumx2=0;%presetting the values to add on during the for loop


for k=1:n % sum of x*y & xi^2
    xi=fX(k);
    yi=fY(k);
    sumxy=sumxy+(xi*yi);

    sumx2=sumx2+xi^2;
end

slope= ((n*sumxy)-(sumx*sumy))/((n*sumx2)-(sumx^2));
%equation for solving for slope of the line of best fit

intercept=ymean-slope*xmean;
%equation for solving for y-intercept of the line of best fit

%% R^2 Section

func=@(x) slope.*x + intercept;
%defining the linear function

SSt=0;
SSr=0;

for p=1:n %calculating SSt and SSr
    SSt=SSt+((fY(p)-ymean)^2);
    SSr=SSr+((fY(p)-func(fX(p)))^2);
end
Rsquared=1-(SSr/SSt);
%to solve for Rsquared
end