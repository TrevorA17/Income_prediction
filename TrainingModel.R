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

# Install and load the boot package
library(boot)

# Bootstrapping function (for linear regression)
boot_fn <- function(data, indices) {
  boot_data <- data[indices, ]
  model <- lm(Income ~ Age + Education + Occupation, data = boot_data)
  return(coef(model))  # Return coefficients (you can return other stats)
}

# Bootstrapping with 1000 iterations
set.seed(123)
boot_results <- boot(data = train_data, statistic = boot_fn, R = 1000)

# Summary of bootstrap results
summary(boot_results)

library(caret)
# Set the seed for reproducibility
set.seed(123)

# Define cross-validation settings
train_control <- trainControl(method = "cv", number = 5)  # 5-fold cross-validation

# Train a linear regression model with cross-validation
model <- train(Income ~ Age + Education + Occupation, data = train_data, 
               method = "lm", trControl = train_control)

# View the model results (e.g., RMSE, Rsquared)
print(model)

# Cross-validation results: RMSE, R^2, and MAE (Mean Absolute Error)
model$results
