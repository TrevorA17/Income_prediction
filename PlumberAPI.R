# Load model and training data levels once at the top
loaded_gbm_model <- readRDS("./models/saved_gbm_model.rds")
train_data <- read.csv("data/sgdata.csv", colClasses = c(
  Sex = "factor",
  Marital_status = "factor",
  Age = "numeric",
  Education = "factor",
  Occupation = "factor",
  Settlement_size = "factor"
))

#* @post /predict
function(Sex, Marital_status, Age, Education, Occupation, Settlement_size) {
  
  new_data <- data.frame(
    Sex = factor(Sex, levels = levels(train_data$Sex)),
    Marital_status = factor(Marital_status, levels = levels(train_data$Marital_status)),
    Age = as.numeric(Age),
    Education = factor(Education, levels = levels(train_data$Education)),
    Occupation = factor(Occupation, levels = levels(train_data$Occupation)),
    Settlement_size = factor(Settlement_size, levels = levels(train_data$Settlement_size))
  )
  
  # Handle missing due to mismatched levels
  if (any(is.na(new_data))) {
    # Impute with mode if Occupation is missing (or any other fallback)
    if (is.na(new_data$Occupation)) {
      new_data$Occupation <- names(sort(table(train_data$Occupation), decreasing = TRUE))[1]
    }
  }
  
  prediction <- predict(loaded_gbm_model, newdata = new_data)
  return(list(prediction = prediction))
}
