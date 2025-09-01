# Install tidyverse (only once; skip if already installed)
#install.packages("tidyverse")

# Load tidyverse
library(tidyverse)

# Read your CSV file into R
# (Make sure pricequotes.csv is in your working directory)
data <- read_csv("C:/Users/HP/Downloads/pricequotes.csv")

# Quick check of first few rows
head(data)

# View full dataset in spreadsheet viewer
View(data)

# Summary statistics
print(summary(data))

# Find n
n_barry <- length(data$Barry_Price)
n_mary  <- length(data$Mary_Price)

# Standard deviation & Standard error
sd_barry <- sd(data$Barry_Price)
sd_mary  <- sd(data$Mary_Price)

se_barry <- sd_barry / sqrt(n_barry)
se_mary  <- sd_mary / sqrt(n_mary)

cat("Mary: SD =", round(sd_mary, 2), "| SE =", round(se_mary, 2), "\n")
cat("Barry: SD =", round(sd_barry, 2), "| SE =", round(se_barry, 2), "\n")

# Boxplot comparison
ggplot(data, aes(x = "Barry", y = Barry_Price)) +
  geom_boxplot(fill = "skyblue") +
  geom_boxplot(aes(x = "Mary", y = Mary_Price), fill = "lightgreen") +
  labs(title = "BoxPlot of Price Quotes", 
       x = "Person", 
       y = "Price") +
  theme_minimal()

# Suppose your dataset is stored in 'data'
#colnames(data)

