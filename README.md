Look at all combinations of $n$ many multiplications of tensors of degree $i_1 ... i_n$.
Bin the results by output degree.

command-line options:

```text
maxdegree=# (3 by default) - maximum degree of input tensors.
numvars=# (4 by default) - maximum number of input tensors.

output=exprs - Show all unique expressions.
output=exprs_latex - Show all unique expressions in LaTeX.
output=count (default) - Show counts per-output-degree.
output=count_md - Show counts per-output-degree in a markdown table (like you see below).

factors (false by default) - Print the prime factorization of the counts.
```

Let $c_{j; i_1 ... i_n}$ be the total number of unique $j$-degree output tensors for $n$ input tensors of degree $i_1 ... i_n$.

For no inputs, the only output is a single 0-degree tensor, the value 0 itself, so the number of 1-degree outputs is 1 and all other counts are zero: $c_{j;} = \delta_{j \ 0}$.

For one input of degree $i_1$, the number of outputs is 1 $j$-degree tensor, so $c_{j; \ i_1} = \delta_{j \ i_i}$.

For two inputs of degrees $i_1$ and $i_2$:

The number of 0-degree outputs is $c_{0; \ i_1 \ i_2} = \delta_{i_1 \ i_2} \cdot i_1!$.

The number of 1-degree outputs is $c_{1; \ i_1 \ i_2} = \delta_{i_1 \ i_2 + 1} \cdot i_1! + \delta_{i_1 + 1 \ i_2} \cdot i_2!$.

The number of 2-degree outputs is $c_{2; \ i_1 \ i_2} = \delta_{i_1 \ i_2} \cdot i_1 \cdot i_1! + \delta_{i_1 \ i_2 + 2} \cdot \frac{i_1!}{2} + \delta_{i_1 + 2 \ i_2} \cdot \frac{i_2!}{2}$.

Input degrees vs counts per degree:

|  |  |  |  | |0    |1    |2     |3    |4     |5    |6    |7   |8   |9  |10 |11 |12 |
|--|--|--|--|-|-----|-----|------|-----|------|-----|-----|----|----|---|---|---|---|
|1 |1 |  |  | |1    |     |1     |     |      |     |     |    |    |   |   |   |   |
|2 |1 |  |  | |     |2    |      |1    |      |     |     |    |    |   |   |   |   |
|2 |2 |  |  | |2    |     |4     |     |1     |     |     |    |    |   |   |   |   |
|3 |1 |  |  | |     |     |3     |     |1     |     |     |    |    |   |   |   |   |
|3 |2 |  |  | |     |6    |      |6    |      |1    |     |    |    |   |   |   |   |
|3 |3 |  |  | |6    |     |18    |     |9     |     |1    |    |    |   |   |   |   |
|1 |1 |1 |  | |     |3    |      |1    |      |     |     |    |    |   |   |   |   |
|2 |1 |1 |  | |2    |     |5     |     |1     |     |     |    |    |   |   |   |   |
|2 |2 |1 |  | |     |10   |      |8    |      |1    |     |    |    |   |   |   |   |
|2 |2 |2 |  | |8    |     |30    |     |12    |     |1    |    |    |   |   |   |   |
|3 |1 |1 |  | |     |6    |      |7    |      |1    |     |    |    |   |   |   |   |
|3 |2 |1 |  | |6    |     |24    |     |11    |     |1    |    |    |   |   |   |   |
|3 |3 |1 |  | |     |42   |      |54   |      |15   |     |1   |    |   |   |   |   |
|3 |2 |2 |  | |     |48   |      |62   |      |16   |     |1   |    |   |   |   |   |
|3 |3 |2 |  | |36   |     |186   |     |120   |     |21   |    |1   |   |   |   |   |
|3 |3 |3 |  | |     |324  |      |558  |      |216  |     |27  |    |1  |   |   |   |
|1 |1 |1 |1 | |3    |     |6     |     |1     |     |     |    |    |   |   |   |   |
|2 |1 |1 |1 | |     |12   |      |9    |      |1    |     |    |    |   |   |   |   |
|2 |2 |1 |1 | |10   |     |34    |     |13    |     |1    |    |    |   |   |   |   |
|2 |2 |2 |1 | |     |68   |      |78   |      |18   |     |1   |    |   |   |   |   |
|2 |2 |2 |2 | |60   |     |272   |     |156   |     |24   |    |1   |   |   |   |   |
|3 |1 |1 |1 | |6    |     |27    |     |12    |     |1    |    |    |   |   |   |   |
|3 |2 |1 |1 | |     |54   |      |68   |      |17   |     |1   |    |   |   |   |   |
|3 |3 |1 |1 | |42   |     |204   |     |129   |     |22   |    |1   |   |   |   |   |
|3 |2 |2 |1 | |48   |     |234   |     |142   |     |23   |    |1   |   |   |   |   |
|3 |3 |2 |1 | |     |408  |      |666  |      |246  |     |29  |    |1  |   |   |   |
|3 |3 |3 |1 | |324  |     |1998  |     |1638  |     |405  |    |36  |   |1  |   |   |
|3 |2 |2 |2 | |     |468  |      |740  |      |264  |     |30  |    |1  |   |   |   |
|3 |3 |2 |2 | |372  |     |2220  |     |1776  |     |428  |    |37  |   |1  |   |   |
|3 |3 |3 |2 | |     |3996 |      |7992 |      |3852 |     |666 |    |45 |   |1  |   |
|3 |3 |3 |3 | |3348 |     |23976 |     |23976 |     |7704 |    |999 |   |54 |   |1  |

Prime factorization of the above:

|  |  |  |  | |0            |1            |2                |3              |4                |5           |6             |7        |8        |9     |10      |11 |12 |
|--|--|--|--|-|-------------|-------------|-----------------|---------------|-----------------|------------|--------------|---------|---------|------|--------|---|---|
|1 |1 |  |  | |1            |             |1                |               |                 |            |              |         |         |      |        |   |   |
|2 |1 |  |  | |             |2            |                 |1              |                 |            |              |         |         |      |        |   |   |
|2 |2 |  |  | |2            |             |2,2              |               |1                |            |              |         |         |      |        |   |   |
|3 |1 |  |  | |             |             |3                |               |1                |            |              |         |         |      |        |   |   |
|3 |2 |  |  | |             |2,3          |                 |2,3            |                 |1           |              |         |         |      |        |   |   |
|3 |3 |  |  | |2,3          |             |2,3,3            |               |3,3              |            |1             |         |         |      |        |   |   |
|1 |1 |1 |  | |             |3            |                 |1              |                 |            |              |         |         |      |        |   |   |
|2 |1 |1 |  | |2            |             |5                |               |1                |            |              |         |         |      |        |   |   |
|2 |2 |1 |  | |             |2,5          |                 |2,2,2          |                 |1           |              |         |         |      |        |   |   |
|2 |2 |2 |  | |2,2,2        |             |2,3,5            |               |2,2,3            |            |1             |         |         |      |        |   |   |
|3 |1 |1 |  | |             |2,3          |                 |7              |                 |1           |              |         |         |      |        |   |   |
|3 |2 |1 |  | |2,3          |             |2,2,2,3          |               |11               |            |1             |         |         |      |        |   |   |
|3 |3 |1 |  | |             |2,3,7        |                 |2,3,3,3        |                 |3,5         |              |1        |         |      |        |   |   |
|3 |2 |2 |  | |             |2,2,2,2,3    |                 |2,31           |                 |2,2,2,2     |              |1        |         |      |        |   |   |
|3 |3 |2 |  | |2,2,3,3      |             |2,3,31           |               |2,2,2,3,5        |            |3,7           |         |1        |      |        |   |   |
|3 |3 |3 |  | |             |2,2,3,3,3,3  |                 |2,3,3,31       |                 |2,2,2,3,3,3 |              |3,3,3    |         |1     |        |   |   |
|1 |1 |1 |1 | |3            |             |2,3              |               |1                |            |              |         |         |      |        |   |   |
|2 |1 |1 |1 | |             |2,2,3        |                 |3,3            |                 |1           |              |         |         |      |        |   |   |
|2 |2 |1 |1 | |2,5          |             |2,17             |               |13               |            |1             |         |         |      |        |   |   |
|2 |2 |2 |1 | |             |2,2,17       |                 |2,3,13         |                 |2,3,3       |              |1        |         |      |        |   |   |
|2 |2 |2 |2 | |2,2,3,5      |             |2,2,2,2,17       |               |2,2,3,13         |            |2,2,2,3       |         |1        |      |        |   |   |
|3 |1 |1 |1 | |2,3          |             |3,3,3            |               |2,2,3            |            |1             |         |         |      |        |   |   |
|3 |2 |1 |1 | |             |2,3,3,3      |                 |2,2,17         |                 |17          |              |1        |         |      |        |   |   |
|3 |3 |1 |1 | |2,3,7        |             |2,2,3,17         |               |3,43             |            |2,11          |         |1        |      |        |   |   |
|3 |2 |2 |1 | |2,2,2,2,3    |             |2,3,3,13         |               |2,71             |            |23            |         |1        |      |        |   |   |
|3 |3 |2 |1 | |             |2,2,2,3,17   |                 |2,3,3,37       |                 |2,3,41      |              |29       |         |1     |        |   |   |
|3 |3 |3 |1 | |2,2,3,3,3,3  |             |2,3,3,3,37       |               |2,3,3,7,13       |            |3,3,3,3,5     |         |2,2,3,3  |      |1       |   |   |
|3 |2 |2 |2 | |             |2,2,3,3,13   |                 |2,2,5,37       |                 |2,2,2,3,11  |              |2,3,5    |         |1     |        |   |   |
|3 |3 |2 |2 | |2,2,3,31     |             |2,2,3,5,37       |               |2,2,2,2,3,37     |            |2,2,107       |         |37       |      |1       |   |   |
|3 |3 |3 |2 | |             |2,2,3,3,3,37 |                 |2,2,2,3,3,3,37 |                 |2,2,3,3,107 |              |2,3,3,37 |         |3,3,5 |        |1  |   |
|3 |3 |3 |3 | |2,2,3,3,3,31 |             |2,2,2,3,3,3,3,37 |               |2,2,2,3,3,3,3,37 |            |2,2,2,3,3,107 |         |3,3,3,37 |      |2,3,3,3 |   |1  |


example: all tensor producs of up to 2 variables each with up to 3 degree:

for degrees: {1, 1}

expr: ${{{ A} _a}} {{{ B} _a}}$	degree: 0 (inner product)

expr: ${{{ A} _a}} {{{ B} _b}}$	degree: 2 (outer product)



for degrees: {2, 1}

expr: ${{{{ A} _a} _b}} {{{ B} _a}}$	degree: 1 (vector-matrix left-multiply)

expr: ${{{{ A} _a} _b}} {{{ B} _b}}$	degree: 1 (vector-matrix right-multiply)

expr: ${{{{ A} _a} _b}} {{{ B} _c}}$	degree: 3 (outer product)



for degrees: {2, 2}

expr: ${{{{ A} _a} _b}} {{{{ B} _a} _b}}$	degree: 0 (Frobenius inner of A and B, i.e. tr(A' B))

expr: ${{{{ A} _a} _b}} {{{{ B} _b} _a}}$	degree: 0 (Frobenius inner of A and B', i.e. tr(A B))

expr: ${{{{ A} _a} _b}} {{{{ B} _c} _a}}$	degree: 2 (B A = (A' B')')

expr: ${{{{ A} _a} _b}} {{{{ B} _c} _b}}$	degree: 2 (A B' = (B A')')

expr: ${{{{ A} _a} _b}} {{{{ B} _b} _c}}$	degree: 2 (A B = (B' A')')

expr: ${{{{ A} _a} _b}} {{{{ B} _a} _c}}$	degree: 2 (B' A = (A' B)')

expr: ${{{{ A} _a} _b}} {{{{ B} _c} _d}}$	degree: 4 (outer product)



for degrees: {3, 1}

expr: ${{{{{ A} _a} _b} _c}} {{{ B} _a}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{ B} _c}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{ B} _b}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{ B} _d}}$	degree: 4



for degrees: {3, 2}

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _a} _b}}$	degree: 1

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _b} _c}}$	degree: 1

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _c} _b}}$	degree: 1

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _b} _a}}$	degree: 1

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _c} _a}}$	degree: 1

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _a} _c}}$	degree: 1

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _b} _d}}$	degree: 3

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _d} _b}}$	degree: 3

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _d} _a}}$	degree: 3

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _c} _d}}$	degree: 3

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _d} _c}}$	degree: 3

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _a} _d}}$	degree: 3

expr: ${{{{{ A} _a} _b} _c}} {{{{ B} _d} _e}}$	degree: 5



for degrees: {3, 3}

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _a} _b} _c}}$	degree: 0

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _b} _c} _a}}$	degree: 0

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _c} _a} _b}}$	degree: 0

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _b} _a} _c}}$	degree: 0

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _c} _b} _a}}$	degree: 0

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _a} _c} _b}}$	degree: 0

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _a} _c}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _a} _d} _c}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _a} _b}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _a} _d} _b}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _c} _d} _a}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _b} _a}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _c} _a}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _b} _c}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _c} _b}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _c} _b} _d}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _c} _d} _b}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _c} _a} _d}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _b} _d} _a}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _b} _c} _d}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _a} _c} _d}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _b} _d} _c}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _b} _a} _d}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _a} _b} _d}}$	degree: 2

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _c} _e}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _a} _e}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _e} _a}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _e} _b}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _c} _d} _e}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _a} _d} _e}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _e} _c}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _b} _e}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _b} _d} _e}}$	degree: 4

expr: ${{{{{ A} _a} _b} _c}} {{{{{ B} _d} _e} _f}}$	degree: 6




