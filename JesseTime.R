library(tidyverse)
JesseTime <- data.frame(Week=c(1,2),Tennis=c(13,14),
                        Violin=c(10,9),Work=c(5.5,5.5),Homework=c(0,0))
JesseTime
g <- ggplot(JesseTime, aes(x=Week,y=Work))
g+geom_bar(stat='identity',fill = "red")+ylab("Hours")
JesseTimeLong <- pivot_longer(JesseTime,cols=-Week,names_to = "measure",
                              values_to = "value")
JesseTimeLong
g <- ggplot(JesseTimeLong, aes(x=Week,y=value))
g+geom_bar(stat='identity',fill = "green")+ylab("Hours")+facet_wrap(~measure)
JesseTime$Week <- factor(JesseTime$Week, levels = JesseTime$Week[order(-JesseTime$Violin)])
JesseTime
JesseTimeLong <- pivot_longer(JesseTime,cols=-Week,names_to = "measure",
                              values_to = "value")
JesseTimeLong
g <- ggplot(JesseTimeLong, aes(x=Week,y=value))
g+geom_bar(stat='identity',fill = "green")+xlab("Fall 2023 Week")+
  ylab("Time Spent (hrs)")+
  facet_wrap(~measure,ncol=4)+
  scale_y_continuous(breaks = pretty(JesseTimeLong$value, n = 6))+
  ggtitle("How Jesse Spends Time")+theme(plot.title = element_text(hjust = 0.5))

