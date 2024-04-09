library(data.table)


file_path <- "/Users/jommy/Desktop/data-cleaning/data-cleaning/household_power_consumption.txt" 

 
  # 使用 fread 读取特定的日期数据
   data <- fread(file_path, 
 +               sep = ";", 
 +               na.strings = "??", 
 +               colClasses = list(Date="IDate", Time="character"),
 +               select = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
 +                          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
 +                          "Sub_metering_3")
 + )
    
    data[, Date := as.IDate(Date, format = "%d/%m/%Y")]
    
    filtered_data <- data[Date %in% as.IDate(c("2007-02-01", "2007-02-02"))]
    filtered_data[, DateTime := as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")]
    head(filtered_data)