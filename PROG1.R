install.packages("tidyverse")
library(tidyverse)

# Load dataset
data(mtcars)
head(mtcars)

# Compute correlation between mpg and hp
correlation <- cor(mtcars$mpg, mtcars$hp)
print(paste("Correlation between mpg and hp is:", round(correlation, 2)))

# Scatter plot with regression line
library(ggplot2)
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(shape = 4, color = "blue", size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "MPG vs HorsePower",
       x = "HorsePower (HP)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

View(mtcars)
