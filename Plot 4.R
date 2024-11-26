###Plot 3

###Load data

df <- read.csv("./data_plot4.csv")

##Add z-score as a column

df <- df %>% mutate(mpg_z = round((mpg - mean(mpg))/sd(mpg), 2)) %>%
  mutate(mpg_z_type = case_when(.$mpg_z < 0 ~ 'below',
                                TRUE ~ 'above')) %>%
  arrange(mpg_z) %>%
  mutate_at(vars(car_name), function(x) factor(x, levels = .$car_name))


# The divergent plot
ggplot(df, aes(x = mpg_z, y = car_name)) +
  geom_segment(aes(x = 0, xend = mpg_z, y = car_name, yend = car_name), color = "gray") +  
  geom_bar(stat = "identity", aes(fill = mpg_z_type), width = 0.9) +  
  scale_fill_manual(
    values = c("above" = "darkseagreen3", "below" = "indianred1"),
    labels = c("above" = "Above average", "below" = "Below average")
  ) +  
  labs(x = "MPG (Z-score)", 
       y = "Car Name", 
       fill = "Mileage") +
  theme_minimal()+
  theme(
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5),
    plot.title = element_text(hjust = 0.5),  
    axis.text.y = element_text(size = 8),   
    axis.title.x = element_text(size = 12),  
    axis.title.y = element_text(size = 12),  
    panel.grid.minor.x = element_blank(),    
    panel.grid.major.y = element_line(color = "gray", size = 0.5)) 

