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
