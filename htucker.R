library(ggplot2)
library(tidyverse)
library(dplyr)
library(esquisse)


# respiration_data_wide <- read.csv("data/datasheet - RESPIRATION.csv") %>%
#   na.omit() %>%
#   mutate(week_number = X, control = X.1) %>%
#   select(-group_number, -X, -X.1) %>%
#   add_row(X1_1 = "WT", 
#           X1_2 = "WT", 
#           X1_3 = "WT", 
#           X2_1 = "CS", 
#           X2_2 = "CS", 
#           X2_3 = "CS", 
#           X2_4 = "CS", 
#           X3_1 = "wt_EGC",
#           X3_2 = "wt_EGC", 
#           X3_3 = "wt_EGC", 
#           X4_1 = "cs_EGC", 
#           X4_2 = "cs_EGC", 
#           X4_3 = "cs_EGC", 
#           X4_4 = "cs_EGC", 
#           .before = 1)

respiration_data_long <- read.csv("data/datasheet - R_RESPIRATION.csv") %>%
  mutate(treatment = case_when(
    crab == "control" ~ "Control",
    TRUE ~ paste0("T ", sub("_.*", "", crab))
  ))

ggplot(respiration_data_long, aes(x = interaction(week, treatment), y = respiration, fill = treatment)) +
  geom_boxplot(alpha = 0.8) +
  geom_jitter(width = 0.12, size = 2, alpha = 0.6, shape = 16) +
  labs(title = "Respiration by Week and Treatment",
       x = "Week Number . Treatment Number",
       y = "Respiration") +
  theme_classic(base_size = 13) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

