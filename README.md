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
expr: ${{{ A} ^a}} {{{ B} ^a}}$	degree: 0
expr: ${{{ A} ^a}} {{{ B} ^b}}$	degree: 2

for degrees: {2, 1}
expr: ${{{{ A} ^a} ^b}} {{{ B} ^a}}$	degree: 1
expr: ${{{{ A} ^a} ^b}} {{{ B} ^b}}$	degree: 1
expr: ${{{{ A} ^a} ^b}} {{{ B} ^c}}$	degree: 3

for degrees: {2, 2}
expr: ${{{{ A} ^a} ^b}} {{{{ B} ^a} ^b}}$	degree: 0
expr: ${{{{ A} ^a} ^b}} {{{{ B} ^b} ^a}}$	degree: 0
expr: ${{{{ A} ^a} ^b}} {{{{ B} ^c} ^a}}$	degree: 2
expr: ${{{{ A} ^a} ^b}} {{{{ B} ^c} ^b}}$	degree: 2
expr: ${{{{ A} ^a} ^b}} {{{{ B} ^b} ^c}}$	degree: 2
expr: ${{{{ A} ^a} ^b}} {{{{ B} ^a} ^c}}$	degree: 2
expr: ${{{{ A} ^a} ^b}} {{{{ B} ^c} ^d}}$	degree: 4

for degrees: {3, 1}
expr: ${{{{{ A} ^a} ^b} ^c}} {{{ B} ^a}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{ B} ^c}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{ B} ^b}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{ B} ^d}}$	degree: 4

for degrees: {3, 2}
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^a} ^b}}$	degree: 1
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^b} ^c}}$	degree: 1
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^c} ^b}}$	degree: 1
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^b} ^a}}$	degree: 1
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^c} ^a}}$	degree: 1
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^a} ^c}}$	degree: 1
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^b} ^d}}$	degree: 3
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^d} ^b}}$	degree: 3
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^d} ^a}}$	degree: 3
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^c} ^d}}$	degree: 3
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^d} ^c}}$	degree: 3
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^a} ^d}}$	degree: 3
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{ B} ^d} ^e}}$	degree: 5

for degrees: {3, 3}
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^a} ^b} ^c}}$	degree: 0
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^b} ^c} ^a}}$	degree: 0
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^c} ^a} ^b}}$	degree: 0
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^b} ^a} ^c}}$	degree: 0
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^c} ^b} ^a}}$	degree: 0
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^a} ^c} ^b}}$	degree: 0
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^a} ^c}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^a} ^d} ^c}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^a} ^b}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^a} ^d} ^b}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^c} ^d} ^a}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^b} ^a}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^c} ^a}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^b} ^c}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^c} ^b}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^c} ^b} ^d}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^c} ^d} ^b}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^c} ^a} ^d}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^b} ^d} ^a}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^b} ^c} ^d}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^a} ^c} ^d}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^b} ^d} ^c}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^b} ^a} ^d}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^a} ^b} ^d}}$	degree: 2
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^c} ^e}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^a} ^e}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^e} ^a}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^e} ^b}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^c} ^d} ^e}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^a} ^d} ^e}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^e} ^c}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^b} ^e}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^b} ^d} ^e}}$	degree: 4
expr: ${{{{{ A} ^a} ^b} ^c}} {{{{{ B} ^d} ^e} ^f}}$	degree: 6

