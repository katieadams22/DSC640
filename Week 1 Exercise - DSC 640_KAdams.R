library("readxl")
library("ggplot2")
library("dplyr")
library("tidyr")
library("rlang")

df<- read_excel('obama-approval-ratings.xls') #use this if you want to import xls
# Basic barplot                                                                                             
p<-ggplot(data=df, aes(x=Issue, y=Approve))+ geom_bar(stat="identity") + ggtitle("Approved by Issue")
p

# Horizontal bar plot
p + coord_flip()

# Stacked Bar Chart
df %>% tidyr::pivot_longer(!Issue, names_to = "Rating", values_to = "Count") %>% ggplot(aes(fill=Rating, y=Count, x=Issue)) + geom_bar(position="stack", stat="identity")

# Pie Chart
ggplot(df, aes(x="", y=Approve, fill=Issue)) + geom_bar(stat="identity", width=1)+coord_polar("y", start=0) + ggtitle("Approved by Issue")

# Donut Chart

# Increase the value to make the hole bigger
# Decrease the value to make the hole smaller
hsize <- 2

df <- df %>% 
        +     mutate(x = hsize)

ggplot(df, aes(x = hsize, y = Approve, fill = Issue)) +
        +     geom_col() +
        +     coord_polar(theta = "y") +
        +     xlim(c(0.2, hsize + 0.5))+ ggtitle("Approved by Issue")
