# Load libraries
library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)

# ===============================
# 1. Load dataset
# ===============================
data <- read_csv("C:/Users/HP/Downloads/fishstory.csv")

# Check column names
print(colnames(data))

# ===============================
# 2. Paired t-test (1980 vs 1970)
# ===============================
t_test_result <- t.test(data$Price1980, data$Price1970, paired = TRUE)
print(t_test_result)

# Mean difference
mean_diff <- mean(data$Price1980 - data$Price1970, na.rm = TRUE)
cat("Mean difference in price (1980 - 1970):", mean_diff, "\n")

# Confidence interval
cat("95% Confidence Interval:", t_test_result$conf.int, "\n")

# ===============================
# 3. Convert to long format
# ===============================
long_data <- data %>%
  pivot_longer(cols = c(Price1970, Price1980), 
               names_to = "Year", 
               values_to = "Price") %>%
  mutate(Year = ifelse(Year == "Price1970", 1970, 1980))

# ===============================
# 4. Line plot (average fish prices per year)
# ===============================
ggplot(long_data, aes(x = Year, y = Price)) +
  stat_summary(fun = mean, geom = "line", color = "orange", linewidth = 1.2) +
  stat_summary(fun = mean, geom = "point", color = "orange", size = 3) +
  labs(title = "Average Fish Prices (1970 vs 1980)",
       x = "Year",
       y = "Average Price") +
  theme_minimal()

# ===============================
# 5. Boxplot (distribution across species per year)
# ===============================
ggplot(long_data, aes(x = factor(Year), y = Price)) +
  geom_boxplot(fill = "skyblue", color = "darkblue", outlier.colour = "red") +
  labs(title = "Distribution of Fish Prices (1970 vs 1980)",
       x = "Year",
       y = "Price") +
  theme_minimal()
