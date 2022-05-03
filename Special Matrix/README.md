## Special Matrix
1/31/2022

**INPUTS** 
* n = number of rows in special matrix
* m = number of columns in special matrix

**OUTPUTS**
* A = Special matrix with dimentions n x m

**Criteria For Special Matrix** 
* The value of each element in the first row is the number of the column.
* The value of each element in the first column is the number of the row.
* The rest of the elements each has a value equal to the sum of the element above it and element to the left.

**How it Works**
1. Creates zeros array with dimentions n x m
2. Checks for 2 inputs
3. Creates first row then preforms the new values of using values above and to the left of them
