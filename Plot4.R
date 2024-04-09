# Load the necessary libraries
library(ggplot2)
library(data.table)

# Assuming filtered_data is already in your environment
# If not, you'd have to read it from a file as demonstrated in previous examples

# Ensure Global_intensity is a numeric column
filtered_data[, Global_intensity := as.numeric(Global_intensity)]

# Remove rows with NA values
filtered_data <- na.omit(filtered_data, cols = "Global_intensity")

# Create a time series line plot for Global_intensity
plot <- ggplot(filtered_data, aes(x = DateTime, y = Global_intensity)) +
  geom_line(color = "red") + # Add a line plot, change color if needed
  labs(x = "DateTime", y = "Global Intensity (Amps)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

# Save the plot to a PNG file
png("plot4.png", width = 480, height = 480)
print(plot)
dev.off()

