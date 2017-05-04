# Data Visualization with ggplot2



## Prerequisites
Load the tidyverse.


```r
library(tidyverse)
```

```
## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr
```

```
## Conflicts with tidy packages ----------------------------------------------
```

```
## filter(): dplyr, stats
## lag():    dplyr, stats
```

## Load mpg data
I am putting it into a df called mpg and using ?mpg to get an idea of the structure.


```r
mpg<-mpg
?mpg
str(mpg)
```

```
## Classes 'tbl_df', 'tbl' and 'data.frame':	234 obs. of  11 variables:
##  $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
##  $ model       : chr  "a4" "a4" "a4" "a4" ...
##  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
##  $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
##  $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
##  $ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
##  $ drv         : chr  "f" "f" "f" "f" ...
##  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
##  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
##  $ fl          : chr  "p" "p" "p" "p" ...
##  $ class       : chr  "compact" "compact" "compact" "compact" ...
```

```r
mpg
```

```
## # A tibble: 234 × 11
##    manufacturer      model displ  year   cyl      trans   drv   cty   hwy
##           <chr>      <chr> <dbl> <int> <int>      <chr> <chr> <int> <int>
## 1          audi         a4   1.8  1999     4   auto(l5)     f    18    29
## 2          audi         a4   1.8  1999     4 manual(m5)     f    21    29
## 3          audi         a4   2.0  2008     4 manual(m6)     f    20    31
## 4          audi         a4   2.0  2008     4   auto(av)     f    21    30
## 5          audi         a4   2.8  1999     6   auto(l5)     f    16    26
## 6          audi         a4   2.8  1999     6 manual(m5)     f    18    26
## 7          audi         a4   3.1  2008     6   auto(av)     f    18    27
## 8          audi a4 quattro   1.8  1999     4 manual(m5)     4    18    26
## 9          audi a4 quattro   1.8  1999     4   auto(l5)     4    16    25
## 10         audi a4 quattro   2.0  2008     4 manual(m6)     4    20    28
## # ... with 224 more rows, and 2 more variables: fl <chr>, class <chr>
```

## First Basic Plots

Displacement vs hwy mpg

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

![](test_2_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

Hwy mpg vs displacement

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))
```

![](test_2_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

Class vs drv

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))
```

![](test_2_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

Displacement vs hwy mpg colored by class.
Note the change in the legend.

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=class))
```

![](test_2_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=class=="compact"))+
  #theme(legend.position = "none")
  labs(color="Type")+
  scale_color_manual(labels=c("Not Compact", "Compact"), values= c("red", "blue"))
```

![](test_2_files/figure-html/unnamed-chunk-6-2.png)<!-- -->

Displacement vs hwy mpg scaled by size, alpha, shape, and color

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size=class))
```

```
## Warning: Using size for a discrete variable is not advised.
```

![](test_2_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha=class))
```

![](test_2_files/figure-html/unnamed-chunk-7-2.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape=class))
```

```
## Warning: The shape palette can deal with a maximum of 6 discrete values
## because more than 6 becomes difficult to discriminate; you have 7.
## Consider specifying shapes manually if you must have them.
```

```
## Warning: Removed 62 rows containing missing values (geom_point).
```

![](test_2_files/figure-html/unnamed-chunk-7-3.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color="blue")
```

![](test_2_files/figure-html/unnamed-chunk-7-4.png)<!-- -->

## Faceting

Example facet wrap plots (discrete variable).

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow=2)
```

![](test_2_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

Example facet grid plots (two variables).

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~cyl)
```

![](test_2_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~cyl)
```

![](test_2_files/figure-html/unnamed-chunk-9-2.png)<!-- -->

Faceting questions.
Good reference is http://ggplot2.tidyverse.org/

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
```

![](test_2_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~.)
```

![](test_2_files/figure-html/unnamed-chunk-10-2.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~cyl)
```

![](test_2_files/figure-html/unnamed-chunk-10-3.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~class)
```

![](test_2_files/figure-html/unnamed-chunk-10-4.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow=2, scales="free")
```

![](test_2_files/figure-html/unnamed-chunk-10-5.png)<!-- -->

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cyl+drv, nrow=2)
```

![](test_2_files/figure-html/unnamed-chunk-10-6.png)<!-- -->
