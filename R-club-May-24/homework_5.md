# Homework 5



##Load the libraries

```r
library(tidyverse)
library(stargazer)
library(ggstance)
library(modelr)
sessionInfo()
```

```
## R version 3.3.2 (2016-10-31)
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## Running under: macOS Sierra 10.12.4
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
##  [1] modelr_0.1.0    ggstance_0.3    stargazer_5.2   dplyr_0.5.0    
##  [5] purrr_0.2.2     readr_1.0.0     tidyr_0.6.1     tibble_1.2     
##  [9] ggplot2_2.2.1   tidyverse_1.1.1
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.9      plyr_1.8.4       forcats_0.2.0    tools_3.3.2     
##  [5] digest_0.6.11    jsonlite_1.2     lubridate_1.6.0  evaluate_0.10   
##  [9] nlme_3.1-128     gtable_0.2.0     lattice_0.20-34  psych_1.6.12    
## [13] DBI_0.5-1        yaml_2.1.14      parallel_3.3.2   haven_1.0.0     
## [17] xml2_1.1.1       stringr_1.1.0    httr_1.2.1       knitr_1.15.1    
## [21] hms_0.3          rprojroot_1.2    grid_3.3.2       R6_2.2.0        
## [25] readxl_0.1.1     foreign_0.8-67   rmarkdown_1.4    reshape2_1.4.2  
## [29] magrittr_1.5     backports_1.0.5  scales_0.4.1     htmltools_0.3.5 
## [33] rvest_0.3.2      assertthat_0.1   mnormt_1.5-5     colorspace_1.3-2
## [37] stringi_1.1.2    lazyeval_0.2.0   munsell_0.4.3    broom_0.4.1
```

```r
diamonds<-diamonds
```

## 7.3.4 Exercises

1. Explore the distribution of each of the x, y, and z variables in diamonds. What do you learn? Think about a diamond and how you might decide which dimension is the length, width, and depth.


```r
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = x), binwidth = 0.5)
```

![](homework_5_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)
```

![](homework_5_files/figure-html/unnamed-chunk-2-2.png)<!-- -->

```r
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = z), binwidth = 0.5)
```

![](homework_5_files/figure-html/unnamed-chunk-2-3.png)<!-- -->





```r
ggplot(data = diamonds, mapping = aes(x = x, colour = cut)) +
  geom_freqpoly(binwidth = 0.1)
```

![](homework_5_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```r
Premium<-filter(diamonds, cut=="Premium")

ggplot(data = Premium) +
  geom_histogram(mapping = aes(x = x), binwidth = 0.5)
```

![](homework_5_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

```r
ggplot(data = Premium) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)
```

![](homework_5_files/figure-html/unnamed-chunk-4-3.png)<!-- -->

```r
ggplot(data = Premium) +
  geom_histogram(mapping = aes(x = z), binwidth = 0.5)
```

![](homework_5_files/figure-html/unnamed-chunk-4-4.png)<!-- -->

```r
ggplot(data=diamonds)+
  geom_histogram(mapping=aes(x=x, fill=cut), binwidth = 0.8, position="dodge")
```

![](homework_5_files/figure-html/unnamed-chunk-4-5.png)<!-- -->

2. Explore the distribution of price. Do you discover anything unusual or surprising? (Hint: Carefully think about the binwidth and make sure you try a wide range of values.)


```r
cheap<-filter(diamonds, price<500)

ggplot(data=cheap)+
  geom_histogram(mapping = aes(x = price), binwidth = 25)
```

![](homework_5_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

3. How many diamonds are 0.99 carat? How many are 1 carat? What do you think is the cause of the difference?


```r
diamonds %>%
  filter(carat >= 0.99, carat <= 1) %>%
  count(carat)
```

```
## # A tibble: 2 × 2
##   carat     n
##   <dbl> <int>
## 1  0.99    23
## 2  1.00  1558
```

4. Compare and contrast coord_cartesian() vs xlim() or ylim() when zooming in on a histogram. What happens if you leave binwidth unset? What happens if you try and zoom so only half a bar shows?


```r
ggplot(data=diamonds) + 
  geom_histogram(mapping = aes(x = price), binwidth = 10) +
  coord_cartesian(xlim = c(500, 1000))
```

![](homework_5_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

```r
ggplot(data=diamonds) + 
  geom_histogram(mapping = aes(x = price), binwidth = 20) +
  coord_cartesian(xlim = c(15000, 18000), ylim = c(0, 25))
```

![](homework_5_files/figure-html/unnamed-chunk-7-2.png)<!-- -->

##7.4.1 Exercises

1. What happens to missing values in a histogram? What happens to missing values in a bar chart? Why is there a difference?

geom_bar will plot the values separately, geom_hist removes the values and tells you.

2. What does na.rm = TRUE do in mean() and sum()?

removes the missing values prior to calculation.

##7.5.1.1 Exercises

1. Use what you’ve learned to improve the visualisation of the departure times of cancelled vs. non-cancelled flights.

2. What variable in the diamonds dataset is most important for predicting the price of a diamond? How is that variable correlated with cut? Why does the combination of those two relationships lead to lower quality diamonds being more expensive?

3. Install the ggstance package, and create a horizontal boxplot. How does this compare to using coord_flip()?


```r
ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = cut, y = price)) +
  coord_flip()
```

![](homework_5_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

  
4. One problem with boxplots is that they were developed in an era of much smaller datasets and tend to display a prohibitively large number of “outlying values”. One approach to remedy this problem is the letter value plot. Install the lvplot package, and try using geom_lv() to display the distribution of price vs cut. What do you learn? How do you interpret the plots?

5. Compare and contrast geom_violin() with a facetted geom_histogram(), or a coloured geom_freqpoly(). What are the pros and cons of each method?

6. If you have a small dataset, it’s sometimes useful to use geom_jitter() to see the relationship between a continuous and categorical variable. The ggbeeswarm package provides a number of methods similar to geom_jitter(). List them and briefly describe what each one does.

##7.5.2.1 Exercises

1. How could you rescale the count dataset above to more clearly show the distribution of cut within colour, or colour within cut?

2. Use geom_tile() together with dplyr to explore how average flight delays vary by destination and month of year. What makes the plot difficult to read? How could you improve it?

3. Why is it slightly better to use aes(x = color, y = cut) rather than aes(x = cut, y = color) in the example above?

##7.5.3.1 Exercises

1. Instead of summarising the conditional distribution with a boxplot, you could use a frequency polygon. What do you need to consider when using cut_width() vs cut_number()? How does that impact a visualisation of the 2d distribution of carat and price?

2. Visualise the distribution of carat, partitioned by price.

3. How does the price distribution of very large diamonds compare to small diamonds. Is it as you expect, or does it surprise you?

4. Combine two of the techniques you’ve learned to visualise the combined distribution of cut, carat, and price.

5. Two dimensional plots reveal outliers that are not visible in one dimensional plots. For example, some points in the plot below have an unusual combination of x and y values, which makes the points outliers even though their x and y values appear normal when examined separately.
