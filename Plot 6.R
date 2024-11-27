##Plot 6

library(ggrepel) #package to avoid overlap in point labels

df <- read.csv("./data_plot6.csv")

df <- df %>%
  mutate(logP = -log10(pvalue))  # Create a new column for -log10 of pvalue

ggplot(df, aes(x = log2FoldChange, y = logP)) +
  # Points with color mapping based on significance and direction (positive or negative)
  geom_point(aes(color = ifelse(log2FoldChange > 0 & logP > 5, "red", 
                                ifelse(log2FoldChange < 0 & logP > 5, "blue", "black"))),
             alpha = 0.7, size = 2) +
  scale_color_manual(values = c("red"="red","blue"="blue", "black"="black")) +  # Red for positive significant, black for negative, gray for non-significant
  theme_minimal() +
  labs(title = "Volcano Plot",
       x = "log2FC",
       y = "-Log10(P-value)") +
  theme(
    legend.position = "none",
    panel.background = element_rect(fill = "gray90"),  
    panel.grid.major = element_blank(),  
    panel.grid.minor = element_blank(),
    plot.title = element_text(hjust = 0.5),  # Center the title
  ) +
  # Add labels to points where -log10(p-value) > 5 and adjust labels to not overlap
  geom_text_repel(aes(label = ifelse(logP > 5, as.character(gene_symbol), "")),
                  size = 3, color = "black", 
                  box.padding = 0.35, point.padding = 0.5, max.overlaps = 18)

