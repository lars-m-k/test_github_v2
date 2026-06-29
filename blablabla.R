# ============================================
# Test R Script for GitHub Setup
# Author: Your Name
# Date: Sys.Date()
# ============================================

# Clear workspace
rm(list = ls())

# Set seed for reproducibility
set.seed(123)

# ---- Create some example data ----
n <- 100
df <- data.frame(
  id = 1:n,
  x = rnorm(n, mean = 10, sd = 2),
  y = rnorm(n, mean = 5, sd = 1.5)
)

# Add a derived variable
df$z <- df$x + df$y

# Quick look
print(head(df))
summary(df)

# ---- Basic plot ----
# Create a scatter plot and save it
png(filename = "scatter_plot.png", width = 800, height = 600)
plot(df$x, df$y,
     main = "Test Scatter Plot",
     xlab = "X values",
     ylab = "Y values",
     col = "steelblue",
     pch = 19)
abline(lm(y ~ x, data = df), col = "red", lwd = 2)
dev.off()

# ---- Save data to file ----
write.csv(df, file = "test_data.csv", row.names = FALSE)

# ---- Simple function ----
calculate_summary <- function(data) {
  return(list(
    mean_x = mean(data$x),
    mean_y = mean(data$y),
    correlation = cor(data$x, data$y)
  ))
}

# Run function
results <- calculate_summary(df)
print(results)

# ---- Save results ----
sink("results.txt")
cat("Summary Results\n")
print(results)
sink()

# ---- Session info ----
sessionInfo()

# ---- End of script ----
