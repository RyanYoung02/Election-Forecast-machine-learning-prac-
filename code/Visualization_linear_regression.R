# Load ggplot2 for visualization
library(ggplot2)

# Predict on the test set for Biden
predicted_percentage_biden <- predict(linear_model_biden, newdata = test_set_2024)

# Create a data frame with actual and predicted values
results_biden <- data.frame(Actual = test_set_2024$Biden_poll, Predicted = predicted_percentage_biden)

# Create scatter plot of actual vs. predicted values for Biden
ggplot(results_biden, aes(x = Actual, y = Predicted)) +
    geom_point() +
    geom_point(color = 'blue')+
    geom_abline(intercept = 0, slope = 1, color = 'red') +
    ggtitle('Actual vs Predicted for Biden') +
    xlab('Actual Vote Percentage') +
    ylab('Predicted Vote Percentage')

# Do the same for Trump
predicted_percentage_trump <- predict(linear_model_trump, newdata = test_set_2024)
results_trump <- data.frame(Actual = test_set_2024$Trump_poll, Predicted = predicted_percentage_trump)
ggplot(results_trump, aes(x = Actual, y = Predicted)) +
    geom_point(color='red') +
    geom_abline(intercept = 0, slope = 1, color = 'blue') +
    ggtitle('Actual vs Predicted for Trump') +
    xlab('Actual Vote Percentage') +
    ylab('Predicted Vote Percentage')



# Calculate residuals for Biden
residuals_biden <- results_biden$Actual - results_biden$Predicted

# Plot residuals for Biden
ggplot() +
    geom_histogram(aes(x = residuals_biden), bins = 30, fill = 'blue', alpha = 0.5) +
    ggtitle('Residuals for Biden') +
    xlab('Residuals') +
    ylab('Frequency')

# Calculate and plot residuals for Trump in a similar way
