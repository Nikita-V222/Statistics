# Load required libraries
library(dplyr)
library(ggplot2)

# Read the dataset
df <- read.csv("C:/Users/HP/Downloads/treatmentfacility.csv")

# Fix messy column name (rename "CI...." to "CI")
names(df)[names(df) == "CI...."] <- "CI"

# Convert Reengineer column to factor with order
df$Reengineer <- factor(df$Reengineer, levels = c("Prior", "Post"))

# Summary statistics
summary_stats <- df %>%
  group_by(Reengineer) %>%
  summarize(
    n = n(),
    mean_turnover = mean(Employee_Turnover, na.rm = TRUE),
    sd_turnover   = sd(Employee_Turnover, na.rm = TRUE),
    mean_TRFF     = mean(TRFF, na.rm = TRUE),
    sd_TRFF       = sd(TRFF, na.rm = TRUE),
    mean_CI       = mean(CI, na.rm = TRUE),
    sd_CI         = sd(CI, na.rm = TRUE)
  )
print(summary_stats)

# Boxplot for Employee Turnover
ggplot(df, aes(x = Reengineer, y = Employee_Turnover, fill = Reengineer)) +
  geom_boxplot() +
  labs(title = "Employee Turnover Before and After Reengineering") +
  theme_minimal()

# Boxplot for TRFF
ggplot(df, aes(x = Reengineer, y = TRFF, fill = Reengineer)) +
  geom_boxplot() +
  labs(title = "TRFF Before and After Reengineering") +
  theme_minimal()

# Boxplot for CI
ggplot(df, aes(x = Reengineer, y = CI, fill = Reengineer)) +
  geom_boxplot() +
  labs(title = "CI Before and After Reengineering") +
  theme_minimal()

#colnames(df)
View(df)
