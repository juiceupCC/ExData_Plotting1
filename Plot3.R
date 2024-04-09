# Load the necessary libraries
library(ggplot2)
library(data.table)

# Assuming filtered_data is already in your environment
# If not, you'd have to read it from a file as demonstrated in previous examples

# Ensure Global_active_power is a numeric column
filtered_data[, Global_active_power := as.numeric(Global_active_power)]

# Remove rows with NA values
filtered_data <- na.omit(filtered_data, cols = "Global_active_power")

# Create a time series line plot
plot <- ggplot(filtered_data, aes(x = DateTime, y = Global_active_power)) +
  geom_line() + # Add a line plot
  labs(x = "DateTime", y = "Global Active Power (kilowatts)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

# Save the plot to a PNG file
png("plot3.png", width = 480, height = 480)
print(plot)
dev.off()
