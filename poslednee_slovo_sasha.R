library(tidyverse)
library(ggridges)
library(ggrepel)
setwd('/Users/aleksandranisimov/Documents/GitHub/dh-hackathon-2019-2020-abnormal_distribution')
poslednee_slovo = read.delim('poslednee_slovo_python_ver.tsv', sep = "\t")

poslednee_slovo <- poslednee_slovo %>%
  rename(God_rozhdenija = Год.рождения,
         Za_chto = За.что,
         Imya = Имя,
         Kogda = Когда,
         Kto = Кто,
         Statja = По.какой.статье,
         Prof = Профессия,
         Punishment = Что.получил) %>%
  filter(God_rozhdenija != "н") %>%
  mutate(God_rozhdenija = as.Date(God_rozhdenija, '%Y'))

poslednee_slovo %>%
  ggplot(aes(God_rozhdenija, Prof, fill = Prof)) +
  geom_density_ridges(aes(alpha = 0.5))

poslednee_slovo %>%
  distinct() %>%
  count(God_rozhdenija, Prof, Kogda, Statja, Imya) %>%
  filter(God_rozhdenija != "н") %>%
  ggplot(aes(God_rozhdenija,n, fill = Prof)) +
  geom_col() +
  labs(x = "Год Рождения",
       y = "",
       title = "Сколько раз задерживали людей того или иного года рождения")
