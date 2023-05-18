library(dplyr)
library(ggplot2)
data <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data.csv")

sorted_data <- data[order(-data$Checkouts), ]
top_10_data <- head(sorted_data, 10)

ggplot(top_10_data, aes(x = reorder(Title, Checkouts), y = Checkouts)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Top 5 Most Checked-out Titles",
       x = NULL, y = "Checkouts") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
        axis.title.x = element_blank()) +
  coord_flip()

ggsave("graph.png", width = 10, height = 6, units = "in")
