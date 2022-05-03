function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

xl=numel(x);
yl=numel(y);
%this counts the number of values in each of the vectors 
a=min(x);
b=max(x);
%the bounds of the integration
I=0;
deltax=x(2)-x(1);
spacing= x(1):deltax:b;
spa=spacing~=x;
check=zeros([1 xl]);
if spa~=check
    error('uneven spacing of x vector')
end

if xl~=yl
    error('Both x & y need to be same length')
    %makes sure that they are the same length before calculating values
end

evenoroddcheck=rem(xl-1,2); %this tests to see if the number of segments (number of intervals-1) is odd or even

if evenoroddcheck==0
    for k=1:2:xl-2
        Iold=((x(k+2)-x(k))/6)*(y(k)+4*y(k+1)+y(k+2));
        I=I+Iold;
        
    end
elseif xl==2
    warning('trapezoidal rule will be used for this array')
    t=(b-a)*((y(xl)+y(xl-1))/2);
    I=t;
else
    warning('trapezoidal rule will be used for the last segment of the data')
    for k=1:2:xl-3
        Iold=((x(k+2)-x(k))/6)*(y(k)+4*y(k+1)+y(k+2));
        t=(x(xl)-x(xl-1))*((y(xl)+y(xl-1))/2);
        I=I+Iold;
    end
I=I+t;
end