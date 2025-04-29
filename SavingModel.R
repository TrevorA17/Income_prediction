# Save the GBM model to a file
saveRDS(gbm_model, "./models/saved_gbm_model.rds")

# Load the saved GBM model
loaded_gbm_model <- readRDS("./models/saved_gbm_model.rds")
