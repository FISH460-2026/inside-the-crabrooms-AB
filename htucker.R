library(ggplot2)
library(tidyverse)

respiration_data <- read.csv("data/datasheet - RESPIRATION.csv") %>%
  mutate()

ggplot(data=respiration_data) %>%
  geom_boxplot(aes(x=))
