###Plot 2

###Load data

df <- read.csv("./data_plot2.csv")

### Scatterplot Area vs population with smooth line

ggplot(df, aes(x = area, y = poptotal, color = state, size = popdensity)) +  
  geom_point() +
  geom_smooth(method = "loess", se = FALSE, color = "blue", size = 1) +
  labs(
    title = "Scatterplot", 
    subtitle = "Area vs population",
    x = "Area",
    y = "Population") +
  theme(
    plot.subtitle = element_text(size = 10),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 1),
    panel.background = element_rect(fill = "white"),  # Set background to white
    panel.grid.major = element_line(color = "gray90", linewidth = 0.5),  # Major grid lines in light grey
    panel.grid.minor = element_line(color = "gray95", linewidth = 0.25))




  
