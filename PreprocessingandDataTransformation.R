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

# Are there any missing values?
anyNA(CustomerData)

# Total number of missing values in the dataset
sum(is.na(CustomerData))

# Number of missing values per column
colSums(is.na(CustomerData))

# Install and load the visdat package (if not already)
library(visdat)

# Visualize missing data
vis_miss(CustomerData)
