library(tidyverse)

df = tibble(
  name = c("Amy", "Avril", "Candy", "Tim", "Sufia", "Lagrange", "bill"),
  month = c(1, 3, 4, 3, 4, 4, 3),
  day = c(6, 2, 5, 2, 5, 5, 2)
)
df

result = df %>%
  group_by(month, day) %>%
  filter(n() > 1) %>%
  reframe(c_name = str_c(name, collapse = " ")) %>%
  str_glue_data("{month} {day} {c_name}")
result
