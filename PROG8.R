#1
library(readr)
library(dplyr)
# Load the dataset
data <- read_csv("C:/Users/HP/Downloads/patient-feedback.csv")
# Summary statistics for all numeric columns
summary(data)
#View(data)

#2
# Load required libraries
#install.packages("GGally")

library(readr)
library(GGally)
# Load the Fitness dataset (you can replace with your file)
fitness <- read_csv("C:/Users/HP/Downloads/CardioGoodFitness.csv")

# Select only continuous (numeric) variables
numeric_data <- fitness[sapply(fitness, is.numeric)]

# Scatterplot matrix
ggpairs(numeric_data)

# Compute correlation matrix
cor_matrix <- cor(numeric_data)

# Print the correlation matrix
print(cor_matrix)

# Find strongest positive and negative correlation pairs
cor_matrix[lower.tri(cor_matrix, diag = TRUE)] <- NA # Keep only upper triangle
cor_values <- as.data.frame(as.table(cor_matrix))
cor_values <- na.omit(cor_values)

# Strongest positive correlation
strongest_pos <- cor_values[which.max(cor_values$Freq), ]

# Strongest negative correlation
strongest_neg <- cor_values[which.min(cor_values$Freq), ]

# Print results
cat("Strongest Positive Correlation:\n")
print(strongest_pos)
cat("\nStrongest Negative Correlation:\n")
print(strongest_neg)

#View(fitness)