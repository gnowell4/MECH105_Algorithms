function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

%Garrett Nowell MECH105 Br.B 3/3/22
%% INPUTS:
%func: equation of function that will find the root for in terms of x
%xl: lower guess of root
%xu: upper guess of root
%es: desired relative error for algorithm to stop
%maxit: number of iterations for algorithm to use for it to stop

%% OUTPUTS:
%root: estimated root location
%fx: function value at root location
%ea: approximate relative error
%iter: number of iterations the algoithm ran for

%% FUNCTION:
%Error checks for the algorithm to run correctly
if func(xl)*func(xu)>0
    error('Need to be valid bounds')
end
if xu<=xl %catch to see if the bounds are valid
    error('upper bound needs to be greater than lower bound')
end
if func(xu)==0 %lets user know if upper bound is the root
    error('Good job you know the root already! Try again with different upper bound')
end
if func(xl)==0 %lets user know if lower bound is the root
    error('Good job you know the root already! Try again with different lower bound')
end
if nargin<3
    error('at least 3 input arguments required');
end
if nargin<4 || isempty(es) %if there is no input for the desired relative error
    es=.0001; %will be set to a default of 0.0001% as instructions designated
end
if nargin<5 || isempty(maxit) %if there is no input for the desired maximum number of iterations the algorithm runs for
    maxit=200; %set at 200 as stated by instructions
end
%not including criteria for vargin due to Dr. B saying it was not necessary

xr= xl; %to start the loop
ea= 100; %just to make a valid value for ea to start the loop
iter = 0; %start of the number of iterations and will be added to each time the loop runs
while(1) % this while loop will continue to run until the either ea is less than the es or until the number of iterations is greater than maxit
if  ea<=es || iter>=maxit || func(xr)==0
    break
end
    iter=iter+1;
xold=xr; %will be used in order to calculate the approx relative error
 xr=xu-((func(xu)*(xl-xu)) /(func(xl)-func(xu))); %equation of false position method
if func(xr)==0
    ea=0;
    break
end
ea=abs((xr-xold)/xr)*100; %calculating the realtive error of the iteration
replace=func(xl)*func(xu);
if replace>=0
    xold=xu;
    xu=xr;
elseif replace<=0
    xold=xl;
    xl=xr;
end
end
root=xr;
fx=func(xr);
end
