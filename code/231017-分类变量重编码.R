library(tibble)
library(dplyr)
library(forcats)

# 1. 原始数据为字符串 --------------------

df = tibble(
  id = 1:10,
  gender = sample(c("男", "女"), 10, replace = TRUE)
)
df

# 重编码（字符串）
df %>%
  mutate(gender = if_else(gender == "男", "male", "female"))

# 重编码（因子）
df %>%
  mutate(gender = factor(gender, levels = c("男", "女"), labels = c("male", "female")))

# 2. 原始数据为因子 --------------------

df = tibble(
  id = 1:10,
  gender = factor(sample(c("男", "女"), 10, replace = TRUE))
)
df

# 因子重编码
df %>%
  mutate(gender = fct_recode(gender, "male" = "男", "female" = "女"))

# 修改因子的levels
df2 = df
levels(df2$gender) = c("female", "male")
df2
