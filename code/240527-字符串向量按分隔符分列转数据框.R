library(tidyverse)

# 字符串向量
strings <- c("x6.163x1xBVx1x246.63762x1.59726x88.41413x甲x",
             "x6.469x1xVBx1x39.23830x1.59726x14.06606x乙x",
             "x9.904x1xVBx1x8.64435x9.12721e-1x1.77075x丙x")

strings %>%
  str_split("x", simplify = TRUE) %>%
  as_tibble() %>%
  select(where(~!all(.x == "")))


strings %>%
  as_tibble() %>%
  separate_wider_delim(value, delim = "x", names_sep = "") %>%
  select(-1, -last_col())

strings %>%
  as_tibble() %>%
  mutate(value = str_remove_all(value, "^x|x$")) %>%
  separate_wider_delim(value, delim = "x", names_sep = "")
