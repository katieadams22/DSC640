# Import Libraries
library(ggplot2)
library(readxl)
library(tidyverse)
theme_set(theme_bw())
devtools::install_github("ACDIVOCATech/bulletchartr")
library(plotly)

# 1 histogram
hist(diamonds$price, xlab = "price")

# 1 box plot
diamonds_gathered <- diamonds %>% gather(metric, level, -carat)
diamonds_cut_clarity <- diamonds_gathered %>% filter(metric %in% c("cut", "clarity"))
ggplot(diamonds_cut_clarity, aes(x = level, y = carat)) + geom_boxplot() +
  scale_y_log10() + facet_wrap(~ metric, scales = "free_x")

# 1 bullet chart
fig <- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  value = 220000,
  domain = list(x = c(0, 1), y= c(0, 1)),
  title = list(text = "<b>Price USD</b>"),
  delta = list(reference = 200000),
  gauge = list(
    shape = "bullet",
    axis = list(range = list(NULL, 250000)),
    threshold = list(
      line = list(color = "red", width = 2),
      thickness = 0.75,
      value = 180000),
    steps = list(
      list(range = c(0, 150), color = "lightgray"),
      list(range = c(150, 250), color = "gray"))),
  height = 150, width = 600) 
fig <- fig %>%
  layout(margin = list(l= 100, r= 10))

fig

# 1 additional chart of your choice - Violin Chart
ggplot(diamonds, aes(x=clarity, y=price, fill=clarity)) + ggtitle("Diamond Clarity vs Price") + geom_violin()