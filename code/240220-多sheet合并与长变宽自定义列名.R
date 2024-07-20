library(tidyverse)
library(readxl)
library(writexl)

file_path = "./dataset/选修课花名册.xlsx"

sheets = file_path %>%
  excel_sheets() %>%
  set_names() %>%
  map_dfr(~ read_xlsx(file_path, sheet = .x), .id = "sheet")
sheets

result = sheets %>%
  group_by(学号) %>%
  arrange(desc(sheets), .by_group = TRUE) %>%
  mutate(n = row_number()) %>%
  select(-序号, -备注) %>%
  pivot_wider(
    names_from = n,
    names_glue = "课程{n}",
    values_from = sheet
  ) %>%
  arrange(二级培养单位, 专业, 学号)

result

write_xlsx(result, "./output/各同学选修课表.xlsx")
