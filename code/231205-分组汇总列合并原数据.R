library(tidyverse)

# 计算每个题号(item)各组(group)的均分 ----
df = tibble(
  item = rep(1:7, each = 2),
  group = rep(c("高", "低"), times = 7),
  X0 = sample(1:100, 14),
  X1 = sample(1:100, 14),
  X2 = sample(1:100, 14),
  X3 = sample(1:100, 14),
  na = sample(1:100, 14)
)
df

# 群友解法----
result1 = df |>
  pivot_longer(X0:na, names_to = "ans") |>
  pivot_wider(names_from = group, values_from = value) |>
  mutate(两组平均 = (高 + 低) / 2) |>
  pivot_longer(高:两组平均, names_to = "group") |>
  pivot_wider(names_from = ans, values_from = value)
result1

# 我的解法 ----
result2 = df %>%
  group_by(item) %>%
  summarise(across(X0:na, \(x) mean(x, na.rm = TRUE))) %>%
  mutate(group = "两组平均") %>%
  bind_rows(df, .) %>%
  arrange(item, desc(group))
result2

