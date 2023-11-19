# Wed Sep  6 14:41:47 2023 ------------------------------
library(tidyverse)

df = tibble(
  name = rep(c("A", "B", "C"), 2:4),
  height = sample(140:200, 9)
)
df

# 筛选身高均超过150的组
df %>%
  group_by(name) %>%
  filter(all(height > 150))
