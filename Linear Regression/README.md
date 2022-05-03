## Linear Regression
4/17/2022

**INPUTS**
* x: x-values for our data set
* y: y-values for our data set

**OUTPUTS**
* fX: x-values with outliers removed
* fY: y-values with outliers removed
* slope: slope from the linear regression y=mx+b
* intercept: intercept from the linear regression y=mx+b
* Rsquared: R^2, a.k.a. coefficient of determination

**How it Works**
1. Checks to see if both arrays are correct sizes and orders in increasing order
2. Calculates IQR of the data and removes data that is considers an outlire based on the 1.5xIQR test
3. Calculates all sums required for calculating slope and intercept
4. Calculates linear regression line in y=mx+b form
5. Calculates R^2 value of the line
