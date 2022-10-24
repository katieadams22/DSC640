# Import Libraries
library(ggplot2)
library(readxl)
library(tidyverse)
library(dplyr)
library(gapminder)
library(hrbrthemes)
library(viridis)

# Import datasets
df<- read.csv('unemployement-rate-1948-2010.csv') 
df_crime <- read.csv('crimerates-by-state-2005.csv')
df_house <- read.csv('Housing_Data.csv')
df_life <- read_excel('Life_Expectancy_World.xlsx')

# 1 scatterplot
# https://www.sharpsightlabs.com/blog/scatter-plot-in-r-ggplot2/
p <- ggplot(data = df_house, aes(x = GrLivArea, y = SalePrice)) +
  geom_point()+ ggtitle("Sale Price and Ground Living Area in Housing Data")+ 
  labs(y = "Sale Price ($ USD)", x = "Ground Living Area (Square Feet)")
p

# 1 bubble chart
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, fill=continent)) +
  geom_point(alpha=0.5, shape=21, color="black") +
  scale_size(range = c(.1, 24), name="Population (M)") +
  scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") +
  theme_ipsum() +
  theme(legend.position="bottom") +
  ylab("Life Expectancy") +
  xlab("GDP Per Capita") +
  ggtitle("Life Expectancy and GDP Per Capita") +
  theme(legend.position = "none")

# 1 density plot chart
p <- ggplot(df_crime, aes(x=murder)) + 
  geom_density()+ggtitle("Density of Murders in the US")+xlab("Murders")
p

