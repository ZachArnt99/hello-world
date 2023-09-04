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
#png(file="JessePlot.png", width=500, height=500)
g+geom_bar(stat='identity',fill = "green")+xlab("Fall 2023 Week")+
  ylab("Time Spent (hrs)")+
  facet_wrap(~measure,ncol=4)+
  scale_y_continuous(breaks = c(0,2,4,6,8,10,12,14,15,16), labels=c("0","2","4","6","8","10","12","14","VIOLIN\nTARGET","16"))+
  ggtitle("How Jesse Spends Time")+
  #theme(plot.title = element_text(hjust = 0.5))+
  geom_hline(yintercept=15, linetype="dashed", color = "red", size=1)+
  theme(plot.margin = unit(c(1,2,1,1), "lines"))+
  theme(axis.text=element_text(size=6))
dev.off()
