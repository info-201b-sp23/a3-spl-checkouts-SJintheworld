library(dplyr)
library(ggplot2)
data <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data.csv")

  material_counts <- data.frame(table(data$MaterialType))
ggplot(material_counts, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Comparison of Material Types",
       x = "Material Type", y = "Count") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

