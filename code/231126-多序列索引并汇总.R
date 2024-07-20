library(tidyverse)

# 方法1 ----
df = tibble(iris[1:4])

# 根据特定序列选择多行并汇总
sum_func = \(seq) {
  df %>%
    slice(seq) %>%
    summarise(across(everything(), sum, na.rm = TRUE)) %>%
    mutate(sum_range = str_c(seq, collapse = "-"))
}

# 待迭代的多个序列
seq_list = map(0:9, ~ seq(from = 1, by = 10, length.out = 3) + .x)
map_dfr(seq_list, sum_func)


# 方法2 ----
# df = tibble(iris[1:4])
df = iris
df %>%
  # 行号求余分组（1, 11, 21...均余1）
  group_by(index = row_number() %% 10) %>%
  # 只将前3个数据纳入计算（1, 11, 21）...
  slice(1:3) %>%
  # 对特定行汇总，可用where()、everything()...代替
  summarise(across(c(Sepal.Length, Sepal.Width), sum, na.rm = TRUE))


# 方法3 ----
data = iris$Sepal.Length
group = rep(0:3, length.out = length(data))

tapply(data, group, sum)
