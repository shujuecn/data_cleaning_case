library(tidyverse)

df = tibble(
  ID = 1:3,
  `TCGA-CV-7440-11A-01R-2187-07` = 1:3,
  `TCGA-BA-A7BN-45C-06D-2927-13` = 1:3
)
df

# 用正则匹配到的内容修改列名
df %>%
  rename_with(
    ~ gsub(".*\\b([[:alnum:]]{4}-[[:alnum:]]{2}-[[:alnum:]]{4})\\b.*", "\\1", .x),
    everything()
  )
