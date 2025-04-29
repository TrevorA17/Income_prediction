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

# Install package if needed
library(caTools)

# Set seed for reproducibility
set.seed(123)

# Split: 70% training, 30% testing
split <- sample.split(CustomerData$Income, SplitRatio = 0.7)

# Create training and test sets
train_data <- subset(CustomerData, split == TRUE)
test_data <- subset(CustomerData, split == FALSE)

# Check sizes
nrow(train_data)
nrow(test_data)
