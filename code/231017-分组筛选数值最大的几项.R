library(tibble)
library(dplyr)

df = tibble(
  month = rep(month.abb[1:3], 5),
  value = sample(1:100, 15)
)
df

df %>%
  slice_max(value, n = 2, by = month)

df %>%
  arrange(month, desc(value)) %>%
  group_by(month) %>%
  slice(1:2)

df %>%
  group_by(month) %>%
  arrange(desc(value)) %>%
  slice(1:2)
