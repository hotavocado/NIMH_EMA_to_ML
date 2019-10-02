#editing data_dic to test
library(tidyverse)

datadic <- read_csv('data_dic.csv')

#change time to timeRange
datadic <- datadic %>% 
  mutate(`Field Type` = recode(`Field Type`, time = 'timeRange'))

#add text validation min max columns for slider type
datadic <- datadic %>% 
  mutate(`Text Validation Min` = ifelse(`Field Type` %in% 'slider', 'Min', ""),
         `Text Validation Max` = ifelse(`Field Type` %in% 'slider', 'Max', ""))

#make multiple column for multi-choice checklist
datadic <- datadic %>%
  mutate(multiple = ifelse(`Field Type` %in% 'checklist', 'true', ""))


#change spaces in 'Form Name' to underscore
datadic <- datadic %>% mutate(`Form Name` = str_replace_all(`Form Name`, "\ ", "_"))

write_csv(datadic, 'data_dic_test2.csv')
