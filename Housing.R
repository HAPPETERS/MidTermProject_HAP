library(dplyr)

df <- read.csv('C:/Users/user/Documents/HAP/Housing.csv')

print(head(df))
summary(df)

if (!all(c("price", "area", "bedrooms") %in% names(df))) {
  stop("One or more required columns are missing.")
}

print(summary(df$area))

df <- df %>%
  mutate(price_per_sqft = price / area)

print(head(df$price_per_sqft))

average_price_per_sqft <- df %>%
  group_by(bedrooms) %>%
  summarise(price_per_sqft = mean(price_per_sqft, na.rm = TRUE))

print(average_price_per_sqft)
