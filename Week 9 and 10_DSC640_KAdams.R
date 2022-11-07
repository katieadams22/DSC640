# Import Libraries
library(ggplot2)
library(readxl)
library(tidyverse)
library(rnaturalearth)
library(rnaturalearthdata)
theme_set(theme_bw())
library(sf)
library(reshape2)
library(reshape)
library(plotly)

# Heat Map
df <- read.csv("Housing_Data.csv")
data <- cor(df[sapply(df,is.numeric)])
data1 <- melt(data)
head(data1)
ggplot(data1, aes(x = X1,
                  y = X2,
                  fill = value))+
                  geom_tile()+
                  ggtitle("Heat Map of Housing Features")+
                  xlab("House Features")+
                  ylab("House Features") 

# Spatial Chart
world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)
ggplot(data = world) +
  geom_sf(aes(fill = pop_est)) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt")+ ggtitle("World Population Density")

# Contour Chart
fig <- plot_ly(z = ~volcano, type = "contour", colorscale='Viridis')
fig <- fig %>% colorbar(title = "Depth \n in meters")

fig
