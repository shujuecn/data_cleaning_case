library(tidyverse)

df = tibble(
  time = 63:65 %>%
    map(~ str_c(month.abb, .x, sep = "-")) %>%
    unlist(),
  x = 1:36
)
df

df %>%
  separate(time, into = c("month", "year")) %>%
  pivot_wider(names_from = month, values_from = x)
