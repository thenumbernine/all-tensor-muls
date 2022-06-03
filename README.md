Look at all combinations of N many multiplications of tensors of degree I1 ... IN.
Bin the results by output degree.

command-line options:

```text
output=exprs - Show all unique expressions.
output=count - Show counts per-output-degree.
output=markdown - Show counts per-output-degree in a markdown table (like you see below).

factors - Print the prime factorization of the counts.
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

```text
for degrees: {1, 1}
A^a * B^a	degree: 0
A^a * B^b	degree: 2

for degrees: {2, 1}
A^ab * B^a	degree: 1
A^ab * B^b	degree: 1
A^ab * B^c	degree: 3

for degrees: {2, 2}
A^ab * B^ab	degree: 0
A^ab * B^ba	degree: 0
A^ab * B^ca	degree: 2
A^ab * B^cb	degree: 2
A^ab * B^bc	degree: 2
A^ab * B^ac	degree: 2
A^ab * B^cd	degree: 4

for degrees: {3, 1}
A^abc * B^a	degree: 2
A^abc * B^c	degree: 2
A^abc * B^b	degree: 2
A^abc * B^d	degree: 4

for degrees: {3, 2}
A^abc * B^ab	degree: 1
A^abc * B^bc	degree: 1
A^abc * B^cb	degree: 1
A^abc * B^ba	degree: 1
A^abc * B^ca	degree: 1
A^abc * B^ac	degree: 1
A^abc * B^bd	degree: 3
A^abc * B^db	degree: 3
A^abc * B^da	degree: 3
A^abc * B^cd	degree: 3
A^abc * B^dc	degree: 3
A^abc * B^ad	degree: 3
A^abc * B^de	degree: 5

for degrees: {3, 3}
A^abc * B^abc	degree: 0
A^abc * B^bca	degree: 0
A^abc * B^cab	degree: 0
A^abc * B^bac	degree: 0
A^abc * B^cba	degree: 0
A^abc * B^acb	degree: 0
A^abc * B^dac	degree: 2
A^abc * B^adc	degree: 2
A^abc * B^dab	degree: 2
A^abc * B^adb	degree: 2
A^abc * B^cda	degree: 2
A^abc * B^dba	degree: 2
A^abc * B^dca	degree: 2
A^abc * B^dbc	degree: 2
A^abc * B^dcb	degree: 2
A^abc * B^cbd	degree: 2
A^abc * B^cdb	degree: 2
A^abc * B^cad	degree: 2
A^abc * B^bda	degree: 2
A^abc * B^bcd	degree: 2
A^abc * B^acd	degree: 2
A^abc * B^bdc	degree: 2
A^abc * B^bad	degree: 2
A^abc * B^abd	degree: 2
A^abc * B^dce	degree: 4
A^abc * B^dae	degree: 4
A^abc * B^dea	degree: 4
A^abc * B^deb	degree: 4
A^abc * B^cde	degree: 4
A^abc * B^ade	degree: 4
A^abc * B^dec	degree: 4
A^abc * B^dbe	degree: 4
A^abc * B^bde	degree: 4
A^abc * B^def	degree: 6
```
