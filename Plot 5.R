###Plot 3

###Load data

df <- read.csv("./data_plot5.csv")

df$manufacturer <- as.factor(df$manufacturer)
df <- df %>%
  mutate(manufacturer = reorder(manufacturer, mileage))

# Create a simple lollipop chart using the mpg dataset
ggplot(df, aes(x = manufacturer, y = mileage)) +
  geom_segment(aes(x = manufacturer, xend = manufacturer, y = 0, yend = mileage), color = "gray")+
  geom_point(color = "orange", size = 3) +  
  labs(title = "Lollipop chart\nAverage city mileage by manufacturer", y = "Avg. Mileage")+
  theme(
    axis.text.x = element_text(angle = 70, hjust = 1),  
    panel.background = element_rect(fill = "white"),  
    panel.grid.major.y = element_line(color = "gray90", linewidth = 0.5),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    axis.title.x = element_blank())
  
  