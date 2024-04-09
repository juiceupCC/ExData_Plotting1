# Load the necessary libraries
library(ggplot2)
library(data.table)

# Assuming filtered_data is already in your environment
# Convert character columns to numeric
# This will introduce NAs for non-numeric values which we will then remove

filtered_data[, Global_active_power := as.numeric(Global_active_power)]
filtered_data[, Global_reactive_power := as.numeric(Global_reactive_power)]
filtered_data[, Voltage := as.numeric(Voltage)]
filtered_data[, Global_intensity := as.numeric(Global_intensity)]
filtered_data[, Sub_metering_1 := as.numeric(Sub_metering_1)]
filtered_data[, Sub_metering_2 := as.numeric(Sub_metering_2)]
# Sub_metering_3 is already numeric

# Remove rows with NA values in the Global_active_power column
filtered_data <- na.omit(filtered_data, cols = "Global_active_power")

# Create the histogram plot using ggplot2 for the Global_active_power column
plot <- ggplot(filtered_data, aes(x = Global_active_power)) +
  geom_histogram(binwidth = 0.01, fill = "red", color = "red") + # Adjust the binwidth as needed
  theme_minimal() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14))

# Save the plot to a PNG file
png("plot2.png", width = 480, height = 480)
print(plot)
dev.off()


