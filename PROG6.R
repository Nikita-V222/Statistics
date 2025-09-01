library(ggplot2)
library(dplyr)
library(readr)

# Load dataset
data <- read.csv("C:/Users/HP/Downloads/medicalmalpractice.csv")
summary(data$Amount)

# Histogram (log scale)
ggplot(data, aes(x = log10(Amount))) +
  geom_histogram(fill = "lightblue", bins = 20) +
  labs(title = "Histogram of Claim Amounts (Log Scale)",
       x = "Log Amount", y = "Frequency")

# Boxplot for top 3 specialties
top3_specialty <- data %>%
  count(Specialty, name = "n") %>%
  slice_max(n, n = 3) %>%
  pull(Specialty)

data %>%
  filter(Specialty %in% top3_specialty) %>%
  ggplot(aes(x = Specialty, y = Amount, fill = Specialty)) +
  geom_boxplot() +
  coord_flip() +
  theme_minimal()

# Percentage of specific specialties
total <- length(data$Specialty)
spec_percent <- data %>%
  group_by(Specialty) %>%
  summarise(n = n(), pct = 100 * n / total) %>%
  filter(Specialty %in% c("Anesthesiology", "Dermatology", "Orthopedic Surgery"))
print(spec_percent)

# Correlation between Age and Amount
cor.test(data$Age, data$Amount)

#View(data)
#head(data)
