## False Position
3/33/2022

**INPUTS**:
* func: equation of function that will find the root for in terms of x
* xl: lower guess of root
* xu: upper guess of root
* es: desired relative error for algorithm to stop
* maxit: number of iterations for algorithm to use for it to stop

**OUTPUTS**:
* root: estimated root location
* fx: function value at root location
* ea: approximate relative error
* iter: number of iterations the algoithm ran for

**How it Works**
1. Checks for valid bounds, if bounds are the roots, and if number of inputs is at least 3
2. Sets preset values for stopping criteria and max number of iterations if they are not specified for the user
3. Creates a loop for iterating the false position method
4. Defines the root that was calculated and the actual value of the function evaluated at the estimated root
