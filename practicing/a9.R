rm(list=ls())#Apagar a memória do R
cat("\014")#Limpar o console do R
#install.packages("data.table")
#install.packages("tidyverse")
#install.packages("plotly")
library(data.table)
library(tidyverse)
library(plotly)
url <- "https://raw.githack.com/maf105/maf105.github.io/master/Aulas_MAF105/Curso_R/Dados/CompanhiaMB_clear3.csv"
df <- fread(url)
#CTRL+SHIFT+M 
SpF <- df %>% filter(Estado_Civil=="solteiro")
ss <- SpF %>% filter(Grau=="superior")
tb <- df %>% select(Estado_Civil, Id_Anos)
#tb <- df %>% select((c1:5, 7))
names(df) #Para saber todos os nomes
unique(df$Grau)
names(tb) <- c("Estado Civil", "Anos")
countSC <- df %>% group_by(Estado_Civil) %>% summarise(Total=n())
countGF <- df %>% group_by(Grau) %>% summarise(Total=n())
View(countGF)
countGF
plot <- countGF %>% ggplot(aes(Grau, Total, fill=Grau))
+ geom_col(show.legend = FALSE) +
  geom_text(nudge_y=1)+
  ggtitle("borracha")+
  xlab("Nível de Formação") +
  ylab("Quantidade de Funcionários") +
 theme_dark()

ggplotly(plot) %>% layout(showlegend=FALSE)