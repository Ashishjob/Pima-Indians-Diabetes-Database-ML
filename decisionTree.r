# Load the dataset
diabetes <- read.csv("C:/Users/Ashis/Downloads/4322_Project/diabetes.csv")

# Convert Outcome to factor with meaningful labels
diabetes$Outcome <- factor(diabetes$Outcome, levels = c(0, 1), labels = c("ND", "D"))

# Inspect the structure of the dataset after conversion
str(diabetes)

# Fit a decision tree model with updated Outcome labels
tree_model <- rpart(Outcome ~ ., data = diabetes)

# Display the decision tree
plot(tree_model)
text(tree_model)
