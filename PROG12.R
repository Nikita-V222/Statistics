# Load dataset
data(mtcars)

# Convert cylinders to factor
mtcars$cyl <- as.factor(mtcars$cyl)

# --- 1. ANOVA ---
anova_result <- aov(mpg ~ cyl, data = mtcars)
summary(anova_result)

# --- 2. Mann-Whitney Test (4 vs 6 cylinders) ---
cyl4 <- subset(mtcars, cyl == "4")$mpg
cyl6 <- subset(mtcars, cyl == "6")$mpg
mann_whitney_result <- wilcox.test(cyl4, cyl6, exact = FALSE)
mann_whitney_result

# --- 3. Kruskal-Wallis Test ---
kruskal_result <- kruskal.test(mpg ~ cyl, data = mtcars)
kruskal_result

#View(mtcars)