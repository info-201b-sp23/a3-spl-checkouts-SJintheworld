library(dplyr)
# What kind of materialtype has the most 
data <- read.csv("~/Desktop/2017-2023-10-Checkouts-SPL-Data.csv")
material_counts <- data %>%
  group_by(MaterialType) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

most_common_material <- material_counts$MaterialType[1]
cat("The MaterialType with the most occurrences:", most_common_material, "\n")

print(material_counts)

# Compare checkouts of the usageclass
usage_counts <- data %>%
  count(UsageClass)
print(usage_counts)

# What kind of subjects has the most trendy picks
subject_counts <- data %>%
  group_by(Subjects) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

most_common_subject <- subject_counts$Subjects[1]
cat("The subject with the most occurrences:", most_common_subject, "\n")

print(subject_counts)

# The most checkout books
book_counts <- data %>%
  group_by(Title) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

most_checked_out_book <- book_counts$Title[1]
cat("The book with the most checkouts:", most_checked_out_book, "\n")

print(book_counts)

# The most publisher checkedout
publisher_counts <- data %>%
  group_by(Publisher) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

most_common_publisher <- publisher_counts$Publisher[1]
cat("The publisher with the highest count:", most_common_publisher, "\n")

print(publisher_counts)

# checkouts
checkout_count <- nrow(data)

# First chart
library(ggplot2)

usage_counts <- table(data$UsageClass)
usage_df <- data.frame(
  UsageClass = names(usage_counts),
  Count = as.numeric(unlist(usage_counts))
)
ggplot(usage_df, aes(x = UsageClass, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Comparison of Digital vs Physical Checkouts",
       x = "Usage Class", y = "Count")

# Second Chart
material_counts <- data.frame(table(data$MaterialType))
ggplot(material_counts, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Comparison of Material Types",
       x = "Material Type", y = "Count") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Own chart
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
