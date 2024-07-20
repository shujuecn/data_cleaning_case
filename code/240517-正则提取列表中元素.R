library(tidyverse)

df = rio::import("dataset/MR数据示例.txt")


# 方法一
extract_matches <- function(text) {
  result <- str_extract_all(text, "//[^/]+//") %>%
    unlist() %>%
    .[1] %>%
    str_replace_all("^//|//$", "")
  return(result)
}
df_1 = df
df_1$Extracted = sapply(df_1$id, extract_matches)
head(df_1$Extracted)

# 方法二
df_2 = tibble(df)
df_2 %>%
  mutate(Extracted = str_extract(id, "//([^/]+)//", group = 1)) %>%
  select(Extracted)

# 方法三
df_3 = tibble(df)
df_3 %>% separate(id, into = c(NA, "Extracted"), sep = "//") %>%
  select(Extracted)
