rm(list=ls())
cat("\014")
library(tidyverse)
##### ler dados ### df = dataframe
df <- readRDS("censo.Rds")

tb <- df %>% group_by(CURSO) %>% 
  summarise(Total=n())

tb %>% ggplot(aes(reorder(CURSO, Total), Total, fill=CURSO)) + 
  geom_col(show.legend = F) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
  geom_text(aes(label=Total), vjust=-0.5) +
  ylim(0,45)

#####################
tb <- df %>% group_by(PROVEDOR) %>% 
  summarise(Total=n())

tb %>% ggplot(aes(reorder(PROVEDOR, Total), Total, fill=PROVEDOR)) + 
  geom_col(show.legend = F) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
  geom_text(aes(label=Total), vjust=-0.5) +
  ylim(0,80)

#################################
tb <- df %>% group_by(PRIMEIRAVEZ) %>% 
  summarise(Total=n())

tb %>% ggplot(aes(reorder(PRIMEIRAVEZ,Total), Total,fill=PRIMEIRAVEZ)) + 
  geom_col(show.legend = F) + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))+
  geom_text(aes(label=Total), vjust=-0.5)+
  ylim(0,125)

