library("readxl")
library("ggplot2")
library("dplyr")
library("tidyr")
library("rlang")

df<- read_excel('world-population.xlsm') 

# Line Chart
ggplot(df, aes(x=Year, y=Population)) +
  geom_line()+ ggtitle("World Population by Year")
# Step Chart
ggplot(df, aes(x=Year, y=Population)) +
  geom_step()+ ggtitle("World Population by Year")