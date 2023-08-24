rm(list = ls())
cat("\014")
library(tidyverse)
library(esquisse)
library(stringr)
######################################
df <- readRDS("dados/censo.Rds")
#######################################

tb <- df %>% 
  group_by(CURSO) %>% 
  summarise(Total=n())

tb %>% ggplot(aes(reorder(CURSO,Total), Total, fill=CURSO)) +
  geom_col(show.legend = FALSE) + 
  geom_text(aes(label=Total), vjust=-0.5)+
  ylim(0,50)+
  theme_gray()+
  xlab("Curso dos Estudantes de Estatística")+
  ylab("Quantidade de Estudantes")+
  ggtitle("Meu Primeiro Gráfico", subtitle = "Autor: Fernando Bastos")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))+
  annotate("text", x=3, y=40,label="Um texto qualquer")+
  annotate("text", x=3, y=30,label="Outro texto qualquer")


#######################################

tb <- df %>% 
  group_by(PROVEDOR) %>% 
  summarise(Total=n())

tb %>% ggplot(aes(reorder(PROVEDOR,Total), Total)) +
  geom_col(show.legend = FALSE) + 
  geom_text(aes(label=Total), vjust=-0.5)+
  #scale_fill_manual(values=c("red", "blue", "green", "red"))+
  ylim(0,80)+
  theme_gray()+
  xlab("Provedor Utilizado pelos Estudantes de Estatística")+
  ylab("Quantidade de Estudantes")+
  ggtitle("Meu Segundo Gráfico", subtitle = "Autor: Fernando Bastos")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))#+
#annotate("text", x=2, y=40,label="Um texto qualquer")+
#annotate("text", x=2, y=30,label="Outro texto qualquer")


#######################################

tb <- df %>% 
  group_by(IDADE) %>% 
  summarise(Total=n())

######################################
#Grafico da idade com os estudantes que nao responderam a idade
######################################

tb %>% ggplot(aes(reorder(IDADE,Total), Total, fill=IDADE)) +
  geom_col(show.legend = FALSE) + 
  geom_text(aes(label=Total), vjust=-0.5)+
  ylim(0,30)+
  theme_gray()+
  xlab("Idade dos Estudantes de Estatística")+
  ylab("Quantidade de Estudantes")+
  ggtitle("Meu Terceiro Gráfico", subtitle = "Autor: Fernando Bastos")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))#+
#annotate("text", x=2, y=40,label="Um texto qualquer")+
#annotate("text", x=2, y=30,label="Outro texto qualquer")

######################################
#Grafico da idade com os estudantes que responderam a idade
######################################
tb <- df %>% 
  group_by(IDADE) %>% 
  summarise(Total=n())

tb <- tb %>% filter(!is.na(IDADE))

tb %>% ggplot(aes(reorder(IDADE,Total), Total, fill=IDADE)) +
  geom_col(show.legend = FALSE) + 
  geom_text(aes(label=Total), vjust=-0.5)+
  ylim(0,30)+
  theme_gray()+
  xlab("Idade dos Estudantes de Estatística")+
  ylab("Quantidade de Estudantes")+
  ggtitle("Meu Terceiro Gráfico", subtitle = "Autor: Fernando Bastos")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))#+
#annotate("text", x=2, y=40,label="Um texto qualquer")+
#annotate("text", x=2, y=30,label="Outro texto qualquer")


######################################
#Grafico da idade colorido
######################################
tb <- df %>% 
  group_by(IDADE) %>% 
  summarise(Total=n())

tb <- tb %>% filter(!is.na(IDADE))

tb$IDADE <- as.factor(tb$IDADE)

tb %>% ggplot(aes(IDADE, Total, fill=IDADE)) +
  geom_col(show.legend = FALSE) + 
  geom_text(aes(label=Total), vjust=-0.5)+
  ylim(0,30)+
  theme_gray()+
  xlab("Idade dos Estudantes de Estatística")+
  ylab("Quantidade de Estudantes")+
  ggtitle("Meu Terceiro Gráfico", subtitle = "Autor: Fernando Bastos")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))

###################################################
df$RESIDENCIA <- stringr::str_trim(df$RESIDENCIA)

tb <- df %>% 
  group_by(RESIDENCIA) %>% 
  summarise(Total=n())

tb %>% ggplot(aes(reorder(RESIDENCIA, Total), Total, fill=RESIDENCIA)) +
  geom_col(show.legend = FALSE) + 
  geom_text(aes(label=Total), vjust=-0.5)+
  coord_flip()

###################################
tb <- df %>% 
  group_by(RESIDENCIA) %>% 
  summarise(Total=n())

tb <- tb %>% filter(Total>=2)

tb %>% ggplot(aes(reorder(RESIDENCIA, Total), Total, fill=RESIDENCIA)) +
  geom_col(show.legend = FALSE) + 
  geom_text(aes(label=Total), hjust=-0.5, size=5)+
  coord_flip()+
  ylim(0,40)

#######################################

ggplot(df) +
  aes(x = CURSO, fill = CURSO) +
  geom_bar(position = "dodge") +
  scale_fill_hue(direction = 1) +
  labs(
    x = "Cursos dos Estudantes de Estatística",
    y = "QUantidade de Estudantes",
    title = "Meu Primeiro Gráfico com Esquisse",
    caption = "Autor: Fernando Bastos"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

#####################################

ggplot(df) +
  aes(x = "", y = IDADE) +
  geom_boxplot(shape = "circle", fill = "#228B22") +
  coord_flip() +
  ggthemes::theme_stata()


