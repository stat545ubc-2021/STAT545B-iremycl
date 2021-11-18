
cancer_test <- data.frame(table(datateachr::cancer_sample$diagnosis))
test1 <- column_top_n(datateachr::cancer_sample, diagnosis, 2)

test_that("Check output", {
  expect_equal(cancer_test$Freq[cancer_test$Var1=="A"],
               test1$c[test1$diagnosis=="A"])
  expect_equal(cancer_test$Freq[cancer_test$Var1=="B"],
               test1$c[test1$diagnosis=="B"])
})

test_that("Check output", {
  expect_equal(cancer_test$Freq[cancer_test$Var1=="A"],
               test1$c[test1$diagnosis=="A"])
  expect_equal(cancer_test$Freq[cancer_test$Var1=="B"],
               test1$c[test1$diagnosis=="B"])
})


test_that("Row Length", {
  expect_true(nrow(data.frame(table(datateachr::vancouver_trees$genus_name))) == n_distinct(datateachr::vancouver_trees$genus_name, na.rm = T))

})
