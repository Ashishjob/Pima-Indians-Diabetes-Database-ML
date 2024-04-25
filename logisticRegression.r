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

