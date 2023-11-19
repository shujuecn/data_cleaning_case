# Mon Sep 25 13:24:34 2023 ------------------------------
library(tidyverse)

df = tibble(
  A = c(1, 2, NA, 3),
  B = c(2, 3, NA, NA),
  C = c(NA, 2, 3, 4),
  D = c(NA, NA, 3, 4)
)
df

# ----

f = \(x) sum(is.na(x))

# 1.删除NA最多的行
nums = apply(df, 1, f)
df %>% filter(nums != max(nums))

# 2.删除NA最多的列
nums = apply(df, 2, f)
df %>% select(where(\(x) ! f(x) == max(nums)))
