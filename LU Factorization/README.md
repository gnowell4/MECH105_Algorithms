## LU Factorization
4/1/2022

**INPUTS**
* A = Coefficient Matrix

**OUTPUTS**
* L = Lower Triangular Matrix
* U = Upper Triangular Matrix
* P = The Permutation Matrix

**How it Works**
1. Checks if matrix dimentions match
2. Creates zeros matrix for each of the output matricies to add values to 
3. Creates loop for if the highest magnitude coefficent is at the top for each column 
4. Proceds with the forward elimination of the matrix
5. Repeats with rest of columns and rows
