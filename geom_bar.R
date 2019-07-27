install.packages("devtools")
devtools::install_github("kjhealy/socviz")

library(socviz)
gss_sm %>% View

library(tidyverse)
#bigregionの棒グラフ
gss_sm %>% 
  ggplot(mapping = aes(x = bigregion)) + 
  geom_bar()

#bigregionの棒グラフ（割合）
gss_sm %>% 
  ggplot(mapping = aes(x = bigregion)) + 
  geom_bar(aes(y = ..prop..,group=1))

#宗教の棒グラフ（色分け）
gss_sm %>% 
  ggplot(mapping = aes(x = religion)) + 
  geom_bar(aes(fill = religion))+       #colorじゃなくてfillだよ
  guides(fill = FALSE)                  #凡例を消す

#bigregionの棒グラフで、宗教ごとに色分けしたもの（割合）
gss_sm %>%
  ggplot(mapping = aes(x = bigregion)) + 
  geom_bar(position = "fill", aes(fill = religion))
#bigregionの棒グラフで、宗教ごとに色分けしたもの（宗教ごとに足して１になる）
gss_sm %>%
  ggplot(mapping = aes(x = bigregion)) + 
  geom_bar(position = "dodge", aes(y = ..prop.., group = religion, fill = religion))

gss_sm %>%
  ggplot(mapping = aes(x = religion)) + 
  geom_bar(position = "dodge", aes(y = ..prop.., group = bigregion, fill = religion))+
  facet_wrap(~bigregion, ncol = 2)
  
