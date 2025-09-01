#install.packages("tidyverse")
library(tidyverse)

# Read CSV
data <- read_csv("C:/Users/HP/Downloads/fishstory.csv")

# Paired t-test
t_test_result <- t.test(data$Price1980, data$Price1970, paired = TRUE)
print(t_test_result)

# Mean difference
mean_diff <- mean(data$Price1980 - data$Price1970, na.rm = TRUE)
cat("Mean difference in price (1980 - 1970):", mean_diff, "\n")

# Confidence interval
cat("95% Confidence Interval:", t_test_result$conf.int, "\n")

