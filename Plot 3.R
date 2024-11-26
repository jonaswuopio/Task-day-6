###Plot 3

###Load data

df <- read.csv("./data_plot3.csv")


ggplot(df, aes(x = cty, y = hwy, color = "darkred", size = )) +
  geom_point() +
  labs(title = "Counts plot\nmpg: city vs highway mileage") +
  theme(legend.position = "none", 
        panel.border = element_rect(color = "black", fill = NA, linewidth = 1),
        panel.background = element_rect(fill = "white"),  # Set background to white
        panel.grid.major = element_line(color = "gray90", linewidth = 0.5),  # Major grid lines in light grey
        panel.grid.minor = element_line(color = "gray95", linewidth = 0.25))
