
<!-- README.md is generated from README.Rmd. Please edit that file -->

# columnTopN

<!-- badges: start -->

<!-- badges: end -->

Given a data and a column, this function counts the number of
observations for each factor of the column levels and returns the top n
with the most observations. If n is equal to the number of levels, then
returns the number of observation for each level.

## Installation

You can install the released version of columnTopN from
[GitHub](https://github.com/) with:

``` r
library(devtools)
#> Loading required package: usethis
install_github("stat545ubc-2021/STAT545B-iremycl/columnTopN/")
#> Downloading GitHub repo stat545ubc-2021/STAT545B-iremycl@HEAD
#> rlang    (0.4.11 -> 0.4.12) [CRAN]
#> crayon   (1.4.1  -> 1.4.2 ) [CRAN]
#> cli      (3.0.1  -> 3.1.0 ) [CRAN]
#> glue     (1.4.2  -> 1.5.0 ) [CRAN]
#> pillar   (1.6.3  -> 1.6.4 ) [CRAN]
#> tibble   (3.1.5  -> 3.1.6 ) [CRAN]
#> generics (0.1.0  -> 0.1.1 ) [CRAN]
#> cpp11    (0.4.0  -> 0.4.1 ) [CRAN]
#> tidyr    (1.1.3  -> 1.1.4 ) [CRAN]
#> Installing 9 packages: rlang, crayon, cli, glue, pillar, tibble, generics, cpp11, tidyr
#> Installing packages into '/private/var/folders/v_/50khg2ws2hz7lsxvc8zf_fnh0000gn/T/RtmpC1RbPl/temp_libpathb04e2de26913'
#> (as 'lib' is unspecified)
#> 
#> The downloaded binary packages are in
#>  /var/folders/v_/50khg2ws2hz7lsxvc8zf_fnh0000gn/T//RtmpOnuqJL/downloaded_packages
#>      checking for file ‘/private/var/folders/v_/50khg2ws2hz7lsxvc8zf_fnh0000gn/T/RtmpOnuqJL/remotesb34168a99535/stat545ubc-2021-STAT545B-iremycl-95170e7/columnTopN/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/v_/50khg2ws2hz7lsxvc8zf_fnh0000gn/T/RtmpOnuqJL/remotesb34168a99535/stat545ubc-2021-STAT545B-iremycl-95170e7/columnTopN/DESCRIPTION’
#>   ─  preparing ‘columnTopN’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘columnTopN_0.0.1.1.tar.gz’
#>      
#> 
#> Installing package into '/private/var/folders/v_/50khg2ws2hz7lsxvc8zf_fnh0000gn/T/RtmpC1RbPl/temp_libpathb04e2de26913'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example using the Vancouver trees data from datateachr
package. The function returns the top 3 most common genus type

``` r
library(columnTopN)
library(datateachr)
column_top_n(vancouver_trees, genus_name, 3)
#> Selecting by c
#> # A tibble: 3 × 2
#>   genus_name     c
#>   <chr>      <int>
#> 1 ACER       36062
#> 2 PRUNUS     30683
#> 3 FRAXINUS    7381
```
