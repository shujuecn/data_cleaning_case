library(tidyverse)

leadership = tibble(
  manager = 1:5,
  data = mdy(c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")),
  country = c("US", "US", "US", "UK", "UK"),
  gender = c("M", "F", "F", "M", "F"),
  age = c(32, 45, 25, 39, 99),
  q1 = c(5, 3, 3, 3, 2),
  q2 = c(4, 5, 5, 3, 2),
  q3 = c(5, 2, 5, 4, 1),
  q4 = c(5, 5, 5, NA, 2),
  q5 = c(5, 5, 2, NA, 1)
)
leadership

res = leadership %>%
  mutate(
    total_score = rowSums(across(q1:q5)), # 求和
    mean_score = rowMeans(across(q1:q5)), # 求均值
    age = if_else(age == 99, NA, age),    # 重编码
    agecat = case_when(
      age > 75 ~ "Elder",
      age >= 55 ~ "Middle Aged",
      TRUE ~ "Young")
  )%>%
  drop_na() %>%                           # 去NA
  arrange(gender, age) %>%                # 多条件排序
  slice(1:3) %>%                          # 选择行
  filter(gender == "M" & age > 30)        # 筛选行
res
