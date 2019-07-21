library(tidyverse)

# squiggly <- function(x) sin(5*x)/200
# eyes <- tibble(x=c(-1,1),y=0.06)
# mouth <- tibble(x=0,y=0.04)

X <- rnorm(100, mean=-5, sd=2)
Y <- rnorm(100, mean=5, sd=2)
bimodal <- data_frame(x=X,y=Y)
class(bimodal)
head(bimodal)
par(mfrow = c(1,2)) # 分割
par(new = T)
bimodal %>% ggplot((aes(x = x))) + geom_histogram()

bimodal %>% gather(key = label, value = value) %>% # 縦長に変える
  ggplot(aes(x = value)) + geom_histogram()

bimodal %>% gather(key = label, value = value) %>% # 縦長に変える
  ggplot(aes(x = value, fill = label)) + geom_histogram()

# ggplot(mapping = aes(x=c(-10:10, -10:10)))+
#   geom_area(stat="function", fun=squiggly, fill="purple")+
#   geom_area(data=bimodal,fill="purple")+
#   geom_point(data=eyes, aes(x=x, y=y), size=5, color="white")+
#   geom_point(data=mouth, aes(x=x, y=y), size=15, color="red")+
#   labs(title="paranormal distribution")
