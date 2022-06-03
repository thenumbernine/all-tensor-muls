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
But for what it's worth, I'm not considering 0-degree tensors in another other formulas below, which are banded matrices.  If I did then they would have an additional top and left row and column of nonzero values.

For one input of degree $i_1$, the number of outputs is 1 $j$-degree tensor, so $c_{j; \ i_1} = \delta_{j \ i_i}$.

For two inputs of degrees $i_1$ and $i_2$:

<hr>

The number of 0-degree outputs is a 1-banded matrix:
$c_{0; \ i_1 \ i_2} = 
	\delta_{i_1 \ i_2} \cdot i_1!
$.
$c_{0; \ i_1 \ i_2} = 
	\delta_{i_1 \ i_2} \cdot \frac{1}{0!} \cdot ncr(i_1, 0) \cdot i_1!
$.

|   |  |  |  |  |   |
|---|--|--|--|--|---|
|   |1 |2 |3 |4 |...|
|1  |1 |  |  |  |   |
|2  |  |2 |  |  |   |
|3  |  |  |6 |  |   |
|4  |  |  |  |24|   |
|...|  |  |  |  |...|

<hr>

The number of 1-degree outputs is a 2-banded matrix: 
$c_{1; \ i_1 \ i_2} = 
	\delta_{i_1 \ i_2 + 1} \cdot i_1! 
	+ \delta_{i_1 + 1 \ i_2} \cdot i_2!
$.

|   |  |  |  |   |   |
|---|--|--|--|---|---|
|   |1 |2 |3 |4  |...|
|1  |  |2 |  |   |   |
|2  |2 |  |6 |   |   |
|3  |  |6 |  |24 |   |
|4  |  |  |24|   |...|
|...|  |  |  |...|   |

<hr>

The number of 2-degree outputs is a 3-banded matrix: 
$c_{2; \ i_1 \ i_2} = 
	  \delta_{i_1 \ i_2} \cdot i_1 \cdot i_1! 
	+ \delta_{i_1 \ i_2 + 2} \cdot \frac{i_1!}{2} 
	+ \delta_{i_1 + 2 \ i_2} \cdot \frac{i_2!}{2}
$.
$c_{2; \ i_1 \ i_2} =
	  \delta_{i_1     \ i_2    } \cdot \frac{1}{1!} \cdot ncr(i_1, 1) \cdot i_1! 
	+ \delta_{i_1     \ i_2 + 2} \cdot \frac{1}{2!} \cdot ncr(i_2, 0) \cdot i_1! 
	+ \delta_{i_1 + 2 \ i_2    } \cdot \frac{1}{2!} \cdot ncr(i_1, 0) \cdot i_2!
$.

|   |  |  |  |   |   |   |
|---|--|--|--|---|---|---|
|   |1 |2 |3 |4  |5  |   |
|1  |1 |  |3 |   |   |   |
|2  |  |4 |  |12 |   |   |
|3  |3 |  |18|   |60 |   |
|4  |  |12|  |96 |   |...|
|5  |  |  |60|   |600|   |
|...|  |  |  |...|   |...|

<hr>

The number of 3-degree outputs is a 4-banded matrix:
$c_{3; \ i_1 \ i_2 } =
	  \delta_{i_1     \ i_2 + 1} \cdot \frac{i_1! \cdot i_2}{2}
	+ \delta_{i_1 + 1 \ i_2    } \cdot \frac{i_2! \cdot i_1}{2}
	+ \delta_{i_1     \ i_2 + 3} \cdot \frac{i_1!}{3!}
	+ \delta_{i_1 + 3 \ i_2    } \cdot \frac{i_2!}{3!}
$.
$c_{3; \ i_1 \ i_2 } =
	  \delta_{i_1     \ i_2 + 1} \cdot \frac{1}{2!} \cdot ncr(i_2, 1) \cdot i_1!
	+ \delta_{i_1 + 1 \ i_2    } \cdot \frac{1}{2!} \cdot ncr(i_1, 1) \cdot i_2!
	+ \delta_{i_1     \ i_2 + 3} \cdot \frac{1}{3!} \cdot ncr(i_2, 0) \cdot i_1!
	+ \delta_{i_1 + 3 \ i_2    } \cdot \frac{1}{3!} \cdot ncr(i_1, 0) \cdot i_2!
$.
$c_{3; \ i_1 \ i_2} = 
	\overset{1}{\underset{k=0}{\Sigma}} \left(
		  \delta_{i_1 \ i_2 + 2k+1} \cdot \frac{1}{(2+k)!} \cdot ncr(i_2, 1-k) \cdot i_1!
		+ \delta_{i_1 + 2k+1 \ i_2} \cdot \frac{1}{(2+k)!} \cdot ncr(i_1, 1-k) \cdot i_2!
	\right)
$.

|   |  |  |   |   |    |     |     |   |
|---|--|--|---|---|----|-----|-----|---|
|   |1 |2 |3  |4  |5   |6    |7    |...|
|1  |  |1 |   |4  |    |     |     |   |
|2  |1 |  |6  |   |20  |     |     |   |
|3  |  |6 |   |36 |    |120  |     |   |
|4  |4 |  |36 |   |240 |     |840  |   |
|5  |  |20|   |240|    |1800 |     |...|
|6  |  |  |120|   |1800|     |15120|   |
|7  |  |  |   |840|    |15120|     |...|
|...|  |  |   |   |... |     |...  |   |

<hr>

The number of 4-degree outputs is a 5-banded matrix:
$c_{4; \ i_1 \ i_2 } =
	  \delta_{i_1     \ i_2    } \cdot \frac{i_1! \cdot i_1!}{(i_1 - 2)! \cdot 2! \cdot 2}
	+ \delta_{i_1     \ i_2 + 2} \cdot \frac{i_1! \cdot i_2}{3!}
	+ \delta_{i_1 + 2 \ i_2    } \cdot \frac{i_2! \cdot i_1}{3!}
	+ \delta_{i_1     \ i_2 + 4} \cdot \frac{i_1!}{4!}
	+ \delta_{i_1 + 4 \ i_2    } \cdot \frac{i_2!}{4!}
$.
$c_{4; \ i_1 \ i_2 } =
	  \delta_{i_1     \ i_2    } \cdot \frac{1}{2!} \cdot ncr(i_2, 2) \cdot i_1!
	+ \delta_{i_1     \ i_2 + 2} \cdot \frac{1}{3!} \cdot ncr(i_2, 1) \cdot i_1!
	+ \delta_{i_1 + 2 \ i_2    } \cdot \frac{1}{3!} \cdot ncr(i_1, 1) \cdot i_2!
	+ \delta_{i_1     \ i_2 + 4} \cdot \frac{1}{4!} \cdot ncr(i_2, 0) \cdot i_1!
	+ \delta_{i_1 + 4 \ i_2    } \cdot \frac{1}{4!} \cdot ncr(i_1, 0) \cdot i_2!
$.
$c_{4; \ i_1 \ i_2} =
	\overset{2}{\underset{k=0}{\Sigma}} \left(
		\delta_{i_1 \ i_2 + 2k} \cdot \frac{1}{(k+2)!} \cdot ncr(i_2, 2-k) \cdot i_1!
	\right)
	+ 
	\overset{2}{\underset{k=1}{\Sigma}} \left(
		\delta_{i_1 + 2k \ i_2} \cdot \frac{1}{(k+2)!} \cdot ncr(i_1, 2-k) \cdot i_2!
	\right)
$.

|   |  |            |                   |                        |                             |                                  |                                       |    |
|---|--|------------|-------------------|------------------------|-----------------------------|----------------------------------|---------------------------------------|----|
|   |1 | 2          | 3                 | 4                      | 5                           | 6                                | 7                                     |... |
|1  |0 |            | 1                 |                        | 5                           |                                  |                                       |    |
|2  |  | 1          |                   | 8 = 2 * 4              |                             | 30 = 6 * 5                       |                                       |    |
|3  |1 |            | 9 =(3 * 2)* 3 / 2 |                        | 60 = 3 *(5 * 4)             |                                  | 210 = 7 * 6 * 5                       |    |
|4  |  | 8 = 4 * 2  |                   | 72 =(4 * 3)*(4 * 3)/ 2 |                             | 480 = 4 *(6 * 5 * 4)             |                                       |... |
|5  |5 |            | 60 =(5 * 4)* 3    |                        | 600 =(5 * 4)*(5 * 4 * 3)/ 2 |                                  | 4200 = 5 *(7 * 6 * 5 * 4)             |    |
|6  |  | 30 = 6 * 5 |                   | 480 =(6 * 5 * 4)* 4    |                             | 5400 =(6 * 5)*(6 * 5 * 4 * 3)/ 2 |                                       |... |
|7  |  |            | 210 = 7 * 6 * 5   |                        | 4200 =(7 * 6 * 5 * 4)* 5    |                                  | 52920 =(7 * 6)*(7 * 6 * 5 * 4 * 3)/ 2 |    |
|...|  |            |                   | ...                    |                             | ...                              |                                       |... |

<hr>

The number of 5-degree outputs is a 6-banded matrix:
$c_{5; \ i_1 \ i_2 } =
	  \delta_{i_1     \ i_2 + 1} \cdot \frac{1}{3!} \cdot ncr(i_2, 2) \cdot i_1!
	+ \delta_{i_1 + 1 \ i_2    } \cdot \frac{1}{3!} \cdot ncr(i_1, 2) \cdot i_2!
	+ \delta_{i_1     \ i_2 + 3} \cdot \frac{1}{4!} \cdot ncr(i_2, 1) \cdot i_1!
	+ \delta_{i_1 + 3 \ i_2    } \cdot \frac{1}{4!} \cdot ncr(i_1, 1) \cdot i_2!
	+ \delta_{i_1     \ i_2 + 5} \cdot \frac{1}{5!} \cdot ncr(i_2, 0) \cdot i_1!
	+ \delta_{i_1 + 5 \ i_2    } \cdot \frac{1}{5!} \cdot ncr(i_1, 0) \cdot i_2!
$.
$c_{5; \ i_1 \ i_2} =
	\overset{2}{\underset{k=0}{\Sigma}} \left(
		  \delta_{i_1 \ i_2 + 2k+1} \cdot \frac{1}{(k+3)!} \cdot ncr(i_2, 2-k) \cdot i_1!
		+ \delta_{i_1 + 2k+1 \ i_2} \cdot \frac{1}{(k+3)!} \cdot ncr(i_1, 2-k) \cdot i_2!
	\right)
$.

<hr>

So for odd $j=2m+1$:

$c_{2m+1; \ i_1 \ i_2} =
	\overset{m}{\underset{k=0}{\Sigma}} \left(
		  \delta_{i_1 \ i_2 + 2k+1} \cdot \frac{ncr(i_2, m-k) \cdot i_1!}{(m+k+1)!}
		+ \delta_{i_1 + 2k+1 \ i_2} \cdot \frac{ncr(i_1, m-k) \cdot i_2!}{(m+k+1)!}
	\right)
$.

for even $j=2m$:

$c_{2m; \ i_1 \ i_2} =
	\overset{m}{\underset{k=0}{\Sigma}} \left(
		\delta_{i_1 \ i_2 + 2k} \cdot \frac{ncr(i_2, m-k) \cdot i_1!}{(m+k)!}
	\right)
	+ 
	\overset{m}{\underset{k=1}{\Sigma}} \left(
		\delta_{i_1 + 2k \ i_2} \cdot \frac{ncr(i_1, m-k) \cdot i_2!}{(m+k)!}
	\right)
$.

<hr>

|     |   |            |                 |                     |                          |                   |                      |                          |     |
|-----|---|------------|-----------------|---------------------|--------------------------|-------------------|----------------------|--------------------------|-----|
|     | 1 | 2          | 3               | 4                   | 5                        | 6                 | 7                    | 8                        | ... |
| 1   |   | 0          |                 | 1                   |                          | 6                 |                      |                          |     |
| 2   | 0 |            | 1               |                     | 10                       |                   | 42 = 6 * 7           |                          |     |
| 3   |   | 1          |                 | 12 = 4 * 3          |                          | 90 = 6 * 5 * 3    |                      | 336 = 6 * 7 * 8          |     |
| 4   | 1 |            | 12 = 4 * 3      |                     | 120 = 5 * 4 * 6          |                   | 840 = 7 * 6 * 5 * 4  |                          |     |
| 5   |   | 10 = 5 * 2 |                 | 120 = 5 * 4 * 6     |                          | 1200 = 6 * 5 * 40 |                      | 8400 = 8 * 7 * 6 * 5 * 5 |     |
| 6   | 6 |            | 90 = 6 * 5 * 3  |                     | 1200 = 6 * 5 * 40        |                   | 12600                |                          | ... |
| 7   |   | 42 = 6 * 7 |                 | 840 = 7 * 6 * 5 * 4 |                          | 12600             |                      | 141120                   |     |
| 8   |   |            | 336 = 6 * 7 * 8 |                     | 8400 = 8 * 7 * 6 * 5 * 5 |                   | 141120               |                          | ... |
| ... |   |            |                 |                     |                          | ...               |                      | ...                      |     |

<hr>

# Input degrees vs counts per degree:

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




