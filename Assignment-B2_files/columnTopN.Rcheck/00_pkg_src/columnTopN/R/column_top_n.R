#' @title Column Top n
#'
#' Given a data and a column, this function counts the number of observations for each factor of the column levels and returns the top n with the most observations. If n is equal to the number of levels, then returns the number of observation for each level.
#'
#' @param data is input data frame
#' @param column is a column of data to be used for counting
#' @param n is the number of top levels to return
#'
#' @examples
#' column_top_n(datateachr::vancouver_trees, genus_name, 3)
#' column_top_n(datateachr::cancer_sample, diagnosis, 2)
#'
#' @import datateachr
#' @import tidyr
#' @import dplyr
#'
#' @return a table with columns column (given as argument in function) and c (the count of observation) for each n (top) row
#' @export

column_top_n <- function(data, col, n){
  if (n > nrow(data) ){
    stop("Error, n cannot be bigger than number of rows: ", nrow(data))
  }
  data %>%
    drop_na({{col}}) %>%
    group_by({{col}}) %>%
    summarise(c = n())%>%
    arrange(desc(c)) %>%
    top_n(n)
}
