# Load the dataset
diabetes <- read.csv("C:/Users/Ashis/Downloads/4322_Project/diabetes.csv")

# Inspect the structure of the dataset
str(diabetes)

# Set seed for reproducibility
set.seed(123)

# Split the data into training (80%) and testing (20%) sets
train_index <- sample(1:nrow(diabetes), 0.8 * nrow(diabetes), replace = FALSE)
train_data <- diabetes[train_index, ]
test_data <- diabetes[-train_index, ]

# Define the logistic regression model formula
formula <- Outcome ~ .

# Build the logistic regression model
logit_model <- glm(formula, data = train_data, family = binomial)

# Make predictions on the test dataset
predictions <- predict(logit_model, newdata = test_data, type = "response")

# Convert predicted probabilities to binary predictions (0 or 1)
predicted_classes <- ifelse(predictions >= 0.5, 1, 0)

# Evaluate model performance (e.g., accuracy)
accuracy <- mean(predicted_classes == test_data$Outcome)
print(paste("Accuracy of Logistic Regression model:", round(accuracy * 100, 2), "%"))

# Install and load the pROC package if not already installed
# install.packages("pROC")
library(pROC)

# Make predictions on the test dataset
predictions <- predict(logit_model, newdata = test_data, type = "response")

# Create a ROC curve object
roc_curve <- roc(test_data$Outcome, predictions)

# Plot the ROC curve
plot(roc_curve, main = "ROC Curve for Logistic Regression Model",
     col = "blue", lwd = 2)

# Add a reference line for a random classifier (no skill)
abline(a = 0, b = 1, lty = 2, col = "red")

# Add labels and legend
legend("bottomright", legend = c("Logistic Regression Model", "Random Classifier"),
       col = c("blue", "red"), lty = c(1, 2), lwd = c(2, 1),
       title = "Model", cex = 0.8)
