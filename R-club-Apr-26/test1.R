library(tidyverse)

mpg<-mpg

#plots displacement vs hwy mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#plots hwy mpg vs displacement
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))

#plots class vs drv
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))
