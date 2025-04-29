# Save the GBM model to a file
saveRDS(gbm_model, "./models/saved_gbm_model.rds")

# Load the saved GBM model
loaded_gbm_model <- readRDS("./models/saved_gbm_model.rds")

# Example of new data for prediction (adjust this to match your dataset)
new_data <- data.frame(
  Sex = factor(0, levels = levels(train_data$Sex)),                  # Sex as factor (0 or 1)
  Marital_status = factor("single", levels = levels(train_data$Marital_status)),  # single or non-single
  Age = 40,
  Education = factor("high school", levels = levels(train_data$Education)),  # Make sure this matches your training data levels
  Occupation = factor("skilled employee", levels = levels(train_data$Occupation)),  # Adjust for valid categories in the model
  Settlement_size = factor(1, levels = levels(train_data$Settlement_size))  # Settlement_size as factor (0, 1, 2)
)

# Use the loaded GBM model to make predictions
predictions_loaded_model <- predict(loaded_gbm_model, newdata = new_data)

# Print the predictions
print(predictions_loaded_model)

#Debugging
# Check the loaded model
print(loaded_gbm_model)

# Check the structure of new_data
str(new_data)

# Check for missing values in new_data
any(is.na(new_data))


# Identify which columns have missing values in new_data
colSums(is.na(new_data))

# Replace missing value in Occupation with the most frequent value
most_frequent_occupation <- names(sort(table(new_data$Occupation), decreasing = TRUE))[1]
new_data$Occupation[is.na(new_data$Occupation)] <- most_frequent_occupation

# Make predictions again after handling missing values
predictions_loaded_model <- predict(loaded_gbm_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)

