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

For odd $j=2m+1$:

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

For 0-degree outputs:

<hr>

The matrix of $c_{0; \ i_1 \ i_2 \ 1}$ matches $c_{1; \ i_1 \ i_2}$:

$c_{0; \ i_1 \ i_2 \ 1} = 
	  \delta_{i_1     \ i_2 + 1} \cdot i_1!
	+ \delta_{i_1 + 1 \ i_2    } \cdot i_2!
$.

|   |   |   |    |     |     |
|---|---|---|----|-----|-----|
|   | 1 | 2 | 3  | 4   | 5   |
| 1 |   | 2 |    |     |     |
| 2 | 2 |   | 6  |     |     |
| 3 |   | 6 |    | 24  |     |
| 4 |   |   | 24 |     | 120 |
| 5 |   |   |    | 120 |     |

The matrix of $c_{0; \ i_1 \ i_2 \ 2}$ matches $2 \cdot c_{2; \ i_1 \ i_2}$:

|   |   |    |     |     |      |
|---|---|----|-----|-----|------|
|   | 1 | 2  | 3   | 4   | 5    |
| 1 | 2 |    | 6   |     |      |
| 2 |   | 8  |     | 24  |      |
| 3 | 6 |    | 36  |     | 120  |
| 4 |   | 24 |     | 192 |      |
| 5 |   |    | 120 |     | 1200 |

The matrix of $c_{0; \ i_1 \ i_2 \ 3} = 3! \cdot c_{3; \ i_1 \ i_2}$: 

|   |    |     |     |      |      |
|---|----|-----|-----|------|------|
|   | 1  | 2   | 3   | 4    | 5    |
| 1 |    | 6   |     | 24   |      |
| 2 | 6  |     | 36  |      | 120  |
| 3 |    | 36  |     | 216  |      |
| 4 | 24 |     | 216 |      | 1440 |
| 5 |    | 120 |     | 1440 |      |

The matrix of $c_{0; \ i_1 \ i_2 \ 4} = 4! \cdot c_{4; \ i_1 \ i_2}$:

|   |     |     |      |      |       |
|---|-----|-----|------|------|-------|
|   | 1   | 2   | 3    | 4    | 5     |
| 1 |     |     | 24   |      | 120   |
| 2 |     | 24  |      | 192  |       |
| 3 | 24  |     | 216  |      | 1440  |
| 4 |     | 192 |      | 1728 |       |
| 5 | 120 |     | 1440 |      | 14400 |

The matrix of $c_{0; \ i_1 \ i_2 \ 5} = 5! \cdot c_{5; \ i_1 \ i_2}$:

|   |     |      |      |       |       |
|---|-----|------|------|-------|-------|
|   | 1   | 2    | 3    | 4     | 5     |
| 1 |     |      |      | 120   |       |
| 2 |     |      | 120  |       | 1200  |
| 3 |     | 120  |      | 1440  |       |
| 4 | 120 |      | 1440 |       | 14400 |
| 5 |     | 1200 |      | 14400 |       |

From this we see the rule emerge:

$c_{0; \ i_1 \ i_2 \ i_3} = i_3! \cdot c_{i_3; \ i_1 \ i_2}$

By commutivity of multiplication we know this is just as true for any other terms:

$c_{0; \ i_1 \ i_2 \ i_3} = i_1! \cdot c_{i_1; \ i_2 \ i_3} = i_2! \cdot c_{i_2; \ i_3 \ i_1} = i_3! \cdot c_{i_3; \ i_1 \ i_2}$

<hr>

Now for 3-input 1-degree outputs:

$c_{1; \ i_1 \ i_2 \ 1} = \left[ \begin{array}{c|cccccc}
			&	1	&	2	&	3	&	4	&	5	&	...	\\
	\hline
	1		&	3	&		&	6 	&		&		&		\\
	2		&		& 10 	&		&	24 	&		&		\\
	3		& 6 	&		& 42 	&		& 120 	&		\\
	4		&		& 24 	&		& 216 	&		&	...	\\
	5		&		&		& 120 	&		& 1320	&		\\
	...		&		&		&		&	...	&		&	...	
\end{array} \right]$

$c_{1; i_1 \ i_2 \ 1} =
	  \delta_{i_1 \ i_2 + 2} \cdot i_1!
	+ \delta_{i_1 + 2 \ i_2} \cdot i_2!
	+ \delta_{i_1 \ i_2} \cdot i_1! \cdot (2 i_1 + 1)
$.

$c_{1; \ i_1 \ i_2 \ 2} = \left[ \begin{array}{c|cccccc}
		&	1	&	2	&	3	&	4	&	5	&	...	\\
	\hline
	1	&		&	10	&		&	24	&		&		\\
	2	&	10	&		&	48	&		&	120	&		\\
	3	&		&	48	&		&	264	&		&	...	\\
	4	&	24	&		&	264	&		& 1680	&		\\
	5	&		&	120	&		& 1680	& 		&	...	\\
	...	&		&		&	...	&		&	...	&		
\end{array} \right]$

$c_{1; i_1 \ i_2 \ 2} = 
	    \delta_{i_1 \ i_2 + 3} \cdot i_1!
	  + \delta_{i_1 + 3 \ i_2} \cdot i_2!
	  + \delta_{i_1 \ i_2 + 1} \cdot i_1! \cdot (3 \cdot i_2 + 2)
	  + \delta_{i_1 + 1 \ i_2} \cdot i_2! \cdot (3 \cdot i_1 + 2)
$.

$c_{1; \ i_1 \ i_2 \ 3} = \left[ \begin{array}{c|cccccc}
		&	1	&	2	&	3	&	4	&	5	&	...	\\
	\hline
	1	&	6	&		&	42	&		&	120	&		\\
	2	&		&	48	&		&	264	&		&	...	\\
	3	&	42	&		&	324	&		& 1800	&		\\
	4	&		&	264	&		& 2304	& 		&	...	\\
	5	&	120	&		& 1800	& 		& 18000	&		\\
	...	&		&	...	&		&	...	&		&	...	
\end{array} \right]$

$c_{1; \ i_1 \ i_2 \ 3} =
	  \delta_{i_1 \ i_2} \cdot ...
	+ \delta_{i_1 \ i_2 + 2} \cdot i_1! \cdot (4 i_2 + 3)
	+ \delta_{i_1 + 2 \ i_2} \cdot i_2! \cdot (4 i_1 + 3)
	+ \delta_{i_1 \ i_2 + 4} \cdot i_1!
	+ \delta_{i_1 + 4 \ i_2} \cdot i_2!
$.

$c_{1; \ i_1 \ i_2 \ 4} = \left[ \begin{array}{c|cccccc}
		&	1	&	2	&	3	&	4	&	5	&	...	\\
	\hline
	1	&		&	24	&		&	216	&		&		\\
	2	&	24	&		&	264	&		& 1680	&		\\
	3	&		&	264	&		& 2304	& 		&	...	\\
	4	&	216	&		& 2304	& 		& 20160	&		\\
	5	&		& 1680	& 		& 20160	& 		&	...	\\
	...	&		&		&	...	&		&	...	&		
\end{array} \right]$
$c_{1; \ i_1 \ i_2 \ 5} = \left[ \begin{array}{c|cccccc}
		&	1	&	2	&	3	&	4	&	5	&	...	\\
	\hline
	1	&		&		&	120	&		& 1320	&		\\
	2	&		&	120	&		& 1680	& 		&	...	\\
	3	&	120	&		& 1800	& 		& 18000	&		\\
	4	&		& 1680	& 		& 20160	& 		&	...	\\
	5	& 1320	& 		& 18000	& 		& 216000 &		\\
	...	&		&	...	&		&	...	&		&	...	
\end{array} \right]$

<hr>

```text
for degrees: {1, 1, 1} counts per result degree: 1->3 3->1
for degrees: {2, 1, 1} counts per result degree: 0->2 2->5 4->1
for degrees: {2, 2, 1} counts per result degree: 1->10 3->8 5->1
for degrees: {2, 2, 2} counts per result degree: 0->8 2->30 4->12 6->1
for degrees: {3, 1, 1} counts per result degree: 1->6 3->7 5->1
for degrees: {3, 2, 1} counts per result degree: 0->6 2->24 4->11 6->1
for degrees: {3, 3, 1} counts per result degree: 1->42 3->54 5->15 7->1
for degrees: {3, 2, 2} counts per result degree: 1->48 3->62 5->16 7->1
for degrees: {3, 3, 2} counts per result degree: 0->36 2->186 4->120 6->21 8->1
for degrees: {3, 3, 3} counts per result degree: 1->324 3->558 5->216 7->27 9->1
for degrees: {4, 1, 1} counts per result degree: 2->12 4->9 6->1
for degrees: {4, 2, 1} counts per result degree: 1->24 3->44 5->14 7->1
for degrees: {4, 3, 1} counts per result degree: 0->24 2->132 4->96 6->19 8->1
for degrees: {4, 4, 1} counts per result degree: 1->216 3->384 5->168 7->24 9->1
for degrees: {4, 2, 2} counts per result degree: 0->24 2->144 4->106 6->20 8->1
for degrees: {4, 3, 2} counts per result degree: 1->264 3->480 5->198 7->26 9->1
for degrees: {4, 4, 2} counts per result degree: 0->192 2->1272 4->1152 6->320 8->32 10->1
for degrees: {4, 3, 3} counts per result degree: 0->216 2->1440 4->1278 6->342 8->33 10->1
for degrees: {4, 4, 3} counts per result degree: 1->2304 3->5112 5->2736 7->528 9->40 11->1
for degrees: {4, 4, 4} counts per result degree: 0->1728 2->13824 4->15336 6->5472 8->792 10->48 12->1
for degrees: {5, 1, 1} counts per result degree: 3->20 5->11 7->1
for degrees: {5, 2, 1} counts per result degree: 2->60 4->70 6->17 8->1
for degrees: {5, 3, 1} counts per result degree: 1->120 3->300 5->150 7->23 9->1
for degrees: {5, 4, 1} counts per result degree: 0->120 2->840 4->840 6->260 8->29 10->1
for degrees: {5, 5, 1} counts per result degree: 1->1320 3->3000 5->1800 7->400 9->35 11->1
for degrees: {5, 2, 2} counts per result degree: 1->120 3->320 5->162 7->24 9->1
for degrees: {5, 3, 2} counts per result degree: 0->120 2->960 4->990 6->296 8->31 10->1
for degrees: {5, 4, 2} counts per result degree: 1->1680 3->3960 5->2280 7->472 9->38 11->1
for degrees: {5, 5, 2} counts per result degree: 0->1200 2->9720 4->11400 6->4400 8->690 10->45 12->1
for degrees: {5, 3, 3} counts per result degree: 1->1800 3->4320 5->2466 7->498 9->39 11->1
for degrees: {5, 4, 3} counts per result degree: 0->1440 2->11880 4->13680 6->5064 8->756 10->47 12->1
for degrees: {5, 5, 3} counts per result degree: 1->18000 3->49320 5->34200 7->9120 9->1070 11->55 13->1
for degrees: {5, 4, 4} counts per result degree: 1->20160 3->54720 5->37224 7->9696 9->1112 11->56 13->1
for degrees: {5, 5, 4} counts per result degree: 0->14400 2->136800 4->186120 6->84840 8->16680 10->1540 12->65 14->1
for degrees: {5, 5, 5} counts per result degree: 1->216000 3->684000 5->558360 7->181800 9->27800 11->2100 13->75 15->1
```
