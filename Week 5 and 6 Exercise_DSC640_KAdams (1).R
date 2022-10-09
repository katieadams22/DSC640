install.packages("treemap")
install.packages("Rcpp")
library(treemap)

df<- read.csv('unemployement-rate-1948-2010.csv') 
head(df)

# Tree Map
treemap(df, #Your data frame object
        index=c("Value"),  #A list of your categorical variables
        vSize = "Year",  #This is your quantitative variable
        type="index", #Type sets the organization and color scheme of your treemap
        palette = "Reds",  #Select your color palette from the RColorBrewer presets or make your own.
        title="Unemployment Rate Frequencies from 1948-2010", #Customize your title
        fontsize.title = 14 #Change the font size of the title
)
# Area Chart
library(ggplot2)

p <- ggplot(df, aes(x=Value))

p + geom_area(stat = "bin") + ggtitle("Unemployment Rate from 1948 to 2010")+xlab("Unemployment Rate")


# Stacked Area Chart
plot = ggplot(df, aes(x=Year, y=Value, fill=Period))

plot + geom_area()

plot + 
  geom_area(colour="black", size=.2, alpha=.8) +
  theme_bw() +
  scale_x_continuous(breaks=seq(1948,2010,1)) +
  scale_y_continuous(breaks=seq(0,2000000,100000)) +
  ggtitle("Unemployment Rate from 1948 to 2010") +
  labs(x="Year", y="Value")+
  ylab("Unemployment Rate")+
  theme(axis.text.x = element_text(angle = 45))

