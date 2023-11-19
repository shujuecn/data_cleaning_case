# Thu Sep  7 00:29:15 2023 ------------------------------
library(tidyverse)

df = tribble(
  ~"name", ~"A", ~"B", ~"C", ~"D", ~"price",
  "Alice", 5, NA, NA, NA, 5,
  "Bob", 3, NA, 2, 3, 11,
  "David", 1, 1, 1, 1, 29,
  "John", 2, 4, 6, NA, 34
)
df

df %>%
  pivot_longer(-c(name, price), names_to = "goods",  values_to = "num") %>%
  mutate(new = str_c(goods, num, sep = "*")) %>%
  group_by(name) %>%
  summarise(
    new2 = str_c(new[!is.na(new)], collapse = "_"),
    price = str_c(unique(price), "(商品总价)")
  ) %>%
  mutate(new2 = str_c(new2, price, sep = "_")) %>%
  select(-price) %>%
  separate(new2, into = as.character(1:5), sep = "_")

# 张敬信老师代码
# https://www.zhihu.com/question/617675794/answer/3172024869
df %>%
  pivot_longer(-1, names_to = "var", values_to = "val", values_drop_na = TRUE) %>%
  mutate(value = if_else(var == "price", str_c(val,"（商品总价）"), str_c(var,"*",val))) %>%
  summarise(value = list(value), .by = name) %>%
  unnest_wider(value, names_sep = "")









