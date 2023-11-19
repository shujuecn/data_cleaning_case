# Wed Sep  6 12:52:12 2023 ------------------------------
library(tidyverse)

df <- tibble(
  model = rep(c("A", "B", "C"), 3:5),
  grade = rep(c("major", "large", "average"), time = 5:3),
  time = today() %m-% days(0:11)
)
df

# 1.统计各型号发生重大故障的次数 ----

# 包含计数为0
df %>%
  group_by(model) %>%
  summarise(n = sum(grade == "major"))

# 不含计数为0
df %>%
  filter(grade == "major") %>%
  group_by(model) %>%
  summarise(n = n())

# 2.各型号故障总数超过4的数量 ----

df %>%
  count(model) %>% # 统计各型号的故障总数
  mutate(n = ifelse((n - 4) > 0, n - 4, 0)) # 计算超过的数量
