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

#plots displacement vs hwy mpg colored by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=class))

#plots displacement vs hwy mpg scaled by size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size=class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha=class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape=class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), shape=4)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color="blue")

?mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow=2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~cyl)

#Faceting questions
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~.)