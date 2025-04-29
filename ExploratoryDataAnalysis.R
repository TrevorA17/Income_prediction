# Load customer data with specified column classes
CustomerData <- read.csv("data/sgdata.csv", colClasses = c(
  Sex = "factor",                  # 0 or 1, treat as categorical
  Marital_status = "factor",      # single or non-single
  Age = "numeric",
  Education = "factor",           # high school or university
  Income = "numeric",
  Occupation = "factor",          # skilled employee or unemployed
  Settlement_size = "factor"      # 0, 1, 2 - treat as categorical size class
))

# View the structure of the dataset
str(CustomerData)

# Preview the data
head(CustomerData)

View(CustomerData)

# Measures of Frequency
# Frequency of each category
table(CustomerData$Sex)
table(CustomerData$Marital_status)
table(CustomerData$Education)
table(CustomerData$Occupation)
table(CustomerData$Settlement_size)

# Proportions
prop.table(table(CustomerData$Sex))
prop.table(table(CustomerData$Marital_status))

# Measures of Central Tendency
# Mean
mean(CustomerData$Age)
mean(CustomerData$Income)

# Median
median(CustomerData$Age)
median(CustomerData$Income)

# Mode function (custom)
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

get_mode(CustomerData$Age)
get_mode(CustomerData$Income)

# Measures of Distribution
# Range
range(CustomerData$Age)
range(CustomerData$Income)

# Standard Deviation
sd(CustomerData$Age)
sd(CustomerData$Income)

# Variance
var(CustomerData$Age)
var(CustomerData$Income)

# Skewness and Kurtosis (need e1071 package)
library(e1071)

skewness(CustomerData$Income)
kurtosis(CustomerData$Income)

# Measures of Relationship
# Correlation between Age and Income
cor(CustomerData$Age, CustomerData$Income)

# Cross-tabulation between categorical variables
table(CustomerData$Sex, CustomerData$Marital_status)

# Visualization (optional, if you're using plots)
plot(CustomerData$Age, CustomerData$Income, main="Age vs Income", xlab="Age", ylab="Income")

# One-way ANOVA: Does Income differ by Education level?
anova_edu <- aov(Income ~ Education, data = CustomerData)
summary(anova_edu)

# One-way ANOVA: Does Income differ by Occupation?
anova_occ <- aov(Income ~ Occupation, data = CustomerData)
summary(anova_occ)

# One-way ANOVA: Does Income differ by Sex?
anova_sex <- aov(Income ~ Sex, data = CustomerData)
summary(anova_sex)

# Tukey HSD post-hoc test
TukeyHSD(anova_edu)
TukeyHSD(anova_occ)

# Boxplot to visualize income differences
boxplot(Income ~ Education, data = CustomerData, main = "Income by Education", col = "lightblue")
boxplot(Income ~ Occupation, data = CustomerData, main = "Income by Occupation", col = "lightgreen")

# Load ggplot2
library(ggplot2)

# Bar plot for Education
ggplot(CustomerData, aes(x = Education)) +
  geom_bar(fill = "steelblue") +
  ggtitle("Frequency of Education Levels")

# Bar plot for Occupation
ggplot(CustomerData, aes(x = Occupation)) +
  geom_bar(fill = "darkgreen") +
  ggtitle("Frequency of Occupation")

# Histogram for Income
ggplot(CustomerData, aes(x = Income)) +
  geom_histogram(fill = "orange", bins = 10) +
  ggtitle("Histogram of Income")

# Boxplot for Age
ggplot(CustomerData, aes(y = Age)) +
  geom_boxplot(fill = "purple") +
  ggtitle("Boxplot of Age")

ggplot(CustomerData, aes(x = Age, y = Income)) +
  geom_point(color = "dodgerblue") +
  ggtitle("Age vs Income")

ggplot(CustomerData, aes(x = Education, y = Income)) +
  geom_boxplot(fill = "salmon") +
  ggtitle("Income by Education")

ggplot(CustomerData, aes(x = Age, y = Income, color = Sex)) +
  geom_point(size = 3) +
  ggtitle("Age vs Income by Sex")

ggplot(CustomerData, aes(x = Education, fill = Marital_status)) +
  geom_bar(position = "stack") +
  ggtitle("Education by Marital Status")
