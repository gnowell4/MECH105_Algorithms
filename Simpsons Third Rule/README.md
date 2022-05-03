## Simpsons 1/3 Rule
4/11/2022

**INPUTS**
* x = the vector of equally spaced independent variable
* y = the verctor of function valuies with respect to x

**OUTPUTS**
* I = the numerical intergral calculated

**How it Works**
1. Checks for correct size and spacing for the input arrays
2. Determines if theres an even or odd number of values in the array 
3. If even number array length, simpsons 1/3 composite rule will be preformed normally
4. If odd number array length, simpsons 1/3 composite rule will be applied exept the last segment of data which will use trapizoidal rule
