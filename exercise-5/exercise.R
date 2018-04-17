# Exercise 5: dplyr grouped operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- group_by(flights, month) %>%
  select(month, dep_delay)

# Which month had the greatest average departure delay?
dep_delay_mean <- summarize(dep_delay_by_month, mean = mean(dep_delay, na.rm = T)) 

# If your above data frame contains just two columns (e.g., "month", and "delay" in that order), you can create
# a scatterplot by passing that data frame to the 'plot()' function
plot(dep_delay_mean)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
group_by(flights, dest) %>%
  summarize(mean = mean(arr_delay, na.rm = T)) %>%
  arrange(-mean)

# You can look up these airports in the `airports` data frame!


# Which city was flown to with the highest average speed?
city_avg_speed <- group_by(flights, dest) %>%
  summarize(mean_speed = mean(dist / (hour + (minute/60)), na.rm = T))

