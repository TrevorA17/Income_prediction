# Save the GBM model to a file
saveRDS(gbm_model, "./models/saved_gbm_model.rds")

# Load the saved GBM model
loaded_gbm_model <- readRDS("./models/saved_gbm_model.rds")

# Example of new data for prediction
new_data <- data.frame(
  Age = 30,
  Education = "high school",  # Adjust for valid categories in the model
  Occupation = "skilled employee"
)

# Use the loaded GBM model to make predictions
predictions_loaded_model <- predict(loaded_gbm_model, newdata = new_data)

# Print the predictions
print(predictions_loaded_model)
