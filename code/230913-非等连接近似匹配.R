library(tidyverse)

rules = tibble(
  duration = c(15, 20, 25, 40, 60),
  day = c(7, 10, 12, 15, 20),
  reward_coefficient = c(0.0003, 0.0004, 0.0005, 0.00055, 0.0006)
)
rules

df = tibble(
  id = c("A", "B", "C", "D"),
  effective_duration = c("89小时48分钟7秒","16小时23分钟34秒", "18小时45分钟13秒","30小时32分钟2秒"),
  effective_day = c(19,8,2,8)
)
df

df %>%
  mutate(effective_duration = hms(effective_duration) / hours(1)) %>%
  left_join(rules, join_by(closest(effective_duration >= duration))) %>%
  left_join(rules, join_by(closest(effective_day >= day))) %>%
  mutate(reward_coefficient = if_else(reward_coefficient.x > reward_coefficient.y, reward_coefficient.x, reward_coefficient.y)) %>%
  select(-matches("\\.")) %>%
  replace_na(list(reward_coefficient = 0))
