Let $c_{j; i_1 ... i_n}$ be the total number of unique $j$-degree output tensors for $n$ input tensors of degree $i_1 ... i_n$.

For no inputs, the only output is a single 0-degree tensor, the value 0 itself, so the number of 1-degree outputs is 1 and all other counts are zero: $c_{j;} = \delta_{j \ 0}$.
But for what it's worth, I'm not considering 0-degree tensors in another other formulas below, which are banded matrices.  If I did then they would have an additional top and left row and column of nonzero values.

For one input of degree $i_1$, the number of outputs is 1 $j$-degree tensor, so $c_{j; \ i_1} = \delta_{j \ i_i}$.

<hr>

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

For three inputs of degrees $i_1$, $i_2$, and $i_3$:

<hr>

The $i_3 = 1$ matrix of $i_1, i_2$ is:

|   |   |   |    |     |     |
|---|---|---|----|-----|-----|
|   | 1 | 2 | 3  | 4   | 5   |
| 1 |   | 2 |    |     |     |
| 2 | 2 |   | 6  |     |     |
| 3 |   | 6 |    | 24  |     |
| 4 |   |   | 24 |     | 120 |
| 5 |   |   |    | 120 |     |

The $i_3 = 2$ matrix is:

|   |   |    |     |     |      |
|---|---|----|-----|-----|------|
|   | 1 | 2  | 3   | 4   | 5    |
| 1 | 2 |    | 6   |     |      |
| 2 |   | 8  |     | 24  |      |
| 3 | 6 |    | 36  |     | 120  |
| 4 |   | 24 |     | 192 |      |
| 5 |   |    | 120 |     | 1200 |

The $i_3 = 3$ matrix is:

|   |    |     |     |      |      |
|---|----|-----|-----|------|------|
|   | 1  | 2   | 3   | 4    | 5    |
| 1 |    | 6   |     | 24   |      |
| 2 | 6  |     | 36  |      | 120  |
| 3 |    | 36  |     | 216  |      |
| 4 | 24 |     | 216 |      | 1440 |
| 5 |    | 120 |     | 1440 |      |

The $i_3 = 4$ matrix is:

|   |     |     |      |      |       |
|---|-----|-----|------|------|-------|
|   | 1   | 2   | 3    | 4    | 5     |
| 1 |     |     | 24   |      | 120   |
| 2 |     | 24  |      | 192  |       |
| 3 | 24  |     | 216  |      | 1440  |
| 4 |     | 192 |      | 1728 |       |
| 5 | 120 |     | 1440 |      | 14400 |

The $i_3 = 5$ matrix is:

|   |     |      |      |       |       |
|---|-----|------|------|-------|-------|
|   | 1   | 2    | 3    | 4     | 5     |
| 1 |     |      |      | 120   |       |
| 2 |     |      | 120  |       | 1200  |
| 3 |     | 120  |      | 1440  |       |
| 4 | 120 |      | 1440 |       | 14400 |
| 5 |     | 1200 |      | 14400 |       |

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


