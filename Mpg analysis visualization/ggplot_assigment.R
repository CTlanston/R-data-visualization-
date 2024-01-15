# Loading necessary libraries
library(tidyverse)
library(readr)


# Read the file using read_table() instead of read_table2()
df <- read.csv('"C:\\Program Files\\RStudio\\data viz\\mpg.csv"')



#plot1 correlation coefficient matrix
library(ggplot2)
library(GGally)

cols_to_plot <- c('mpg', 'weight', 'horsepower', 'acceleration')
df_subset <- df[cols_to_plot]
# Creating pairplot using GGally
ggpairs(df_subset)


#plot 2 creat boxplot 
library(ggplot2)

ggplot(df, aes(x = as.factor(cylinders), y = mpg)) +
  geom_boxplot() +
  labs(title = 'mpg Distribution by Cylinders', x = 'cylinders', y = 'mpg') +
  theme_minimal()


#plot 3 Creating scatter plot
ggplot(df, aes(x = weight, y = mpg, color = horsepower, size = horsepower)) +
  geom_point(aes(color = horsepower), alpha = 0.7, show.legend = TRUE) +
  scale_color_viridis_c() +
  labs(title = 'mpg vs. Weight colored by Horsepower') +
  theme_minimal() +
  theme(legend.position = "right") +
  coord_fixed(ratio = 0.1, xlim = c(min(df$weight), max(df$weight)), ylim = c(min(df$mpg), max(df$mpg)))


#plot 4 Define number of bins
names(df)
# Creating line plot
ggplot(df, aes(x = `Model_Year`, y = mpg, color = acceleration_bin)) +
  geom_line(aes(group = acceleration_bin)) +
  scale_color_brewer(palette = "Set3") +
  labs(title = 'mpg Trend over Model Years by Acceleration Bins') +
  theme_minimal() +
  theme(legend.position = "top", legend.justification = "left", legend.box.just = "right")