# Wed Sep 27 10:46:18 2023 ------------------------------
library(tidyverse)

df = tibble(
  A = rep(c("a", "b", "c"), 2:4),
  B = sample(9)
)
df

# 各样本所在组的唯一标识
df %>%
  group_by(A) %>%
  mutate(id = cur_group_id())

# 各样本在所属组内的行号
df %>%
  group_by(A) %>%
  mutate(id = row_number())
