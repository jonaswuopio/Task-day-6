###Task day 7

##import data data

df <- read.csv("./data_plot1.csv")

##load package

library(dplyr)
library(ggplot2)

##Name to factor from character

df$name <- factor(df$name)

# 1. Violin plot + boxplot

ggplot(df, aes(x = myaxis, y = value, fill = name)) +  
  geom_violin(trim = FALSE) +        
  scale_fill_manual(values = c("A" = "indianred1", 
                               "B" = "limegreen", 
                               "C" = "turquoise3",
                               "D" = "darkorchid1")) +  #I don´t have time to figure out the exact colors
  geom_boxplot(width = 0.1, outlier.shape = NA) +
  labs(title = "Boxplot + Violin", 
       x = "name", 
       y = "value") +
  theme_minimal()+
  theme(
    legend.position = "none", 
    panel.border = element_rect(color = "black", fill = NA, linewidth = 1))


