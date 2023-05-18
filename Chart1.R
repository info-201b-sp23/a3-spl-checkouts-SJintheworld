library(dplyr)
library(ggplot2)
data <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data.csv")

usage_counts <- table(data$UsageClass)
usage_df <- data.frame(
  UsageClass = names(usage_counts),
  Count = as.numeric(unlist(usage_counts))
)
ggplot(usage_df, aes(x = UsageClass, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Comparison of Digital vs Physical Checkouts",
       x = "Usage Class", y = "Count")


