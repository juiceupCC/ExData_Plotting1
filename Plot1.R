# Load the necessary libraries
library(ggplot2)
library(data.table)

# Assuming filtered_data is already in your environment
# If it's not, read the data from the file (you need to uncomment the below lines)
# file_path <- "path/to/your/filtered_data.csv"  # Replace with the path to your data file
# filtered_data <- fread(file_path, select = c("Global_active_power"))  # Specify the column you need

# Ensure that the 'Global_active_power' column is numeric
filtered_data[, Global_active_power := as.numeric(Global_active_power)]

# Check for NA values that may have been introduced during conversion and handle them if necessary
# This is an optional step depending on how you want to handle NAs in your dataset
# filtered_data <- na.omit(filtered_data)

# Create the histogram plot using ggplot2
plot <- ggplot(filtered_data, aes(x = Global_active_power)) +
  geom_histogram(binwidth = 0.5, fill = "red", color = "red") +
  theme_minimal() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14))

# Save the plot to a PNG file
png("plot1.png", width = 480, height = 480)
print(plot)
dev.off()

