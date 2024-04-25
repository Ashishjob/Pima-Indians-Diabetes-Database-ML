# Load required libraries
library(ggplot2)

# Load the dataset
diabetes <- read.csv("C:/Users/Ashis/Downloads/4322_Project/diabetes.csv")

# Inspect the structure of the dataset
str(diabetes)

# Display the first few rows of the dataset
head(diabetes)

# Example: Scatterplot of Glucose vs. Insulin
plot(diabetes$Glucose, diabetes$Insulin, 
     xlab = "Glucose", ylab = "Insulin",
     main = "Scatterplot of Glucose vs. Insulin")

# Fit a linear regression model
lm_model <- lm(Insulin ~ Glucose, data = diabetes)

# Summary of the linear regression model
summary(lm_model)

# Coefficients of the linear regression model
coefficients(lm_model)

# Predicted vs. Actual Plot
plot(diabetes$Glucose, diabetes$Insulin, 
     xlab = "Glucose", ylab = "Insulin",
     main = "Predicted vs. Actual",
     col = "blue")
abline(lm_model, col = "red")

# Assess model performance (e.g., R-squared)
rsquared <- summary(lm_model)$r.squared
cat("R-squared:", rsquared, "\n")

# Example: Predict Insulin for a new Glucose value (e.g., 150)
new_data <- data.frame(Glucose = 150)
predicted_insulin <- predict(lm_model, newdata = new_data)
cat("Predicted Insulin for Glucose = 150:", predicted_insulin, "\n")
