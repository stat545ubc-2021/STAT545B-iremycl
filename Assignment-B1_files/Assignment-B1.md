Assignment-B1
================
Irem YUCEL
01/11/2021

## Exercise 1: Make a function and Exercise 2: Document your Function

I used the below code snippet frequently, so I want to make this a
function. The code does the following:

1)  Takes a column x from the data frame data
2)  Removes the NA values
3)  Counts the number of observations for each level of the column
4)  Arranges in the descending order
5)  Takes the top n categories with the most number of observations.

<!-- end list -->

``` r
library(tibble)
library(dplyr)
library(tidyr)
library(datateachr)
library(testthat)

# data %>% 
#   drop_na(x) %>%
#   group_by(x) %>%
#   summarise(c = n())%>%
#   arrange(desc(c)) %>%
#   top_n(n)
  


#An example how the code works:
  
ex_data = tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5,
  "a", 8,  8.5,
  "b", 1,  4.6,
  "c", 5,  3.7,
  "c", 1,  8.5,
  "c", 7,  8.5,
  "c", 4,  5.6,
  "c", 6,  8.5,
  "c", 7,  5.6,
  "b", 3,  8.5,
  "c", 1,  3.7,
  "b", 0,  8.5,
  "b", 1,  1.2,
)


test_snippet = ex_data %>% 
  drop_na(x) %>%
  group_by(x) %>%
  summarise(n = n())%>%
  arrange(desc(n)) %>%
  top_n(2)

print(test_snippet)
```

    ## # A tibble: 2 × 2
    ##   x         n
    ##   <chr> <int>
    ## 1 c         7
    ## 2 b         5

``` r
#Converting the snippet to a function

#' @title Column top n
#' 
#' Given a data and a column, this function counts the number of observations for each factor of the column levels and returns the top n with the most observations. If n is equal to the number of levels, then returns the number of observation for each level.

#' @param data is input data frame
#' @param column is a column of data to be used for counting
#' @param n is the number of top levels to return

#' @return a table with columns column(given as argument in function) and c (the count of observation) for each n (top) row

column_top_n <- function(data, col, n){
  if (n > nrow(ex_data) ){
    stop("Error, n cannot be bigger than number of rows: ", nrow(data))
  }
  data %>%
  drop_na({{col}}) %>%
  group_by({{col}}) %>%
  summarise(c = n())%>%
  arrange(desc(c)) %>%
  top_n(n)
}
```

## Exercise 3: Include examples

``` r
column_top_n(ex_data, x, 2) #Example data I generated
```

    ## Selecting by c

    ## # A tibble: 2 × 2
    ##   x         c
    ##   <chr> <int>
    ## 1 c         7
    ## 2 b         5

``` r
column_top_n(vancouver_trees, genus_name, 3)#Vancouver trees data from datateachr package, returns the top 3 most common genus type
```

    ## Selecting by c

    ## # A tibble: 3 × 2
    ##   genus_name     c
    ##   <chr>      <int>
    ## 1 ACER       36062
    ## 2 PRUNUS     30683
    ## 3 FRAXINUS    7381

``` r
column_top_n(cancer_sample, diagnosis, 2) #Cancer sample data from datateachr package, in this case, the function is used to return the number of observations since there are 2 categories.
```

    ## Selecting by c

    ## # A tibble: 2 × 2
    ##   diagnosis     c
    ##   <chr>     <int>
    ## 1 B           357
    ## 2 M           212

## Exercise 4: Test Function

``` r
#Test: Correct output
cancer_test <- data.frame(table(cancer_sample$diagnosis))
print(cancer_test)
```

    ##   Var1 Freq
    ## 1    B  357
    ## 2    M  212

``` r
test1 <- column_top_n(cancer_sample, diagnosis, 2)
```

    ## Selecting by c

``` r
print(test1)
```

    ## # A tibble: 2 × 2
    ##   diagnosis     c
    ##   <chr>     <int>
    ## 1 B           357
    ## 2 M           212

``` r
test_that("Check output", {
  expect_equal(cancer_test$Freq[cancer_test$Var1=="A"],  
    test1$c[test1$diagnosis=="A"]) 
  expect_equal(cancer_test$Freq[cancer_test$Var1=="B"],  
    test1$c[test1$diagnosis=="B"])
})
```

    ## Test passed 😸

``` r
#Test: Large n given as input:
test_that("Large n", {
  expect_error(column_top_n(ex_data, x, 40))
})
```

    ## Test passed 😸

``` r
#Test: Expect each of unique values in given column is included in fr
test_that("Row Length", {
  expect_true(nrow(data.frame(table(vancouver_trees$genus_name))) == n_distinct(vancouver_trees$genus_name, na.rm = T))
  
})
```

    ## Test passed 🌈
