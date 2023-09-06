library(tidyverse)
JesseTime <- data.frame(week=c(1,2), start=c(168,168), school=c(40,40),
                        sleep=c(56,56), meals=c(7,7), travel=c(3,3),
                        hygiene=c(3.5,3.5), tennis=c(13,14), violin=c(10,9),
                        work=c(5.5,5.5), homework=c(0,0))

JesseTime <- mutate(JesseTime, other = start-school-sleep-meals-travel-hygiene-tennis-violin-work-homework)

JesseTimeLong <- pivot_longer(JesseTime, cols=c(tennis, violin, work, homework, other),
                              names_to = "name", values_to = "value")
JesseTimeLong$name <- factor(JesseTimeLong$name,
                             levels=c("sleep","school","violin","homework",
                                      "tennis","work","meals","hygiene","travel",
                                      "other"))

g <- ggplot(JesseTimeLong, aes(x=week,y=value))
#png(file="JessePlot.png", width=500, height=500)
g+geom_bar(stat = "identity",fill = "green")+xlab("Fall 2023 Week")+
  ylab("Time Spent (hrs)")+
  facet_wrap(~name,ncol=5)+
  scale_x_continuous(breaks = c(1,2), labels=c(1,2))+
  scale_y_continuous(breaks = c(0,5,10,15,20,25,30,35,40,45,50),
                     labels=c("0","5","10","Violin",20,25,30,35,40,45,50))+
  ggtitle("How Jesse Spends Time")+
  #theme(plot.title = element_text(hjust = 0.5))+
  geom_hline(yintercept=15, linetype="dashed", color = "red", size=1)+
  theme(plot.margin = unit(c(1,2,1,1), "lines"))+
  theme(axis.text=element_text(size=9))+
  geom_text(aes(label = value), vjust = 0)
dev.off()

JesseTimeLong2 <- pivot_longer(JesseTime, cols=-c(week,start), names_to = "name",
                               values_to="value")
JesseTimeLong2$name <- factor(JesseTimeLong2$name,
                             levels=c("sleep","school","violin","homework",
                                      "tennis","work","meals","hygiene","travel",
                                      "other"))
head(JesseTimeLong2)
g2 <- ggplot(JesseTimeLong2, aes(x=week,y=value))
png(file="Wk2JessePlot2.png", width=1000, height=500)
g2+geom_bar(stat="identity",fill = "green")+xlab("Fall 2023 Week")+
  ylab("Time Spent (hrs)")+
  facet_wrap(~name,ncol=10)+
  scale_x_continuous(breaks = c(1,2), labels=c(1,2))+
  scale_y_continuous(breaks = c(0,5,10,15,20,25,30,35,40,45,50),
                     labels=c("0","5","10","Violin",20,25,30,35,40,45,50))+
  ggtitle("How Jesse Spends Time")+
  #theme(plot.title = element_text(hjust = 0.5))+
  geom_hline(yintercept=15, linetype="dashed", color = "red", size=1)+
  theme(plot.margin = unit(c(1,3,1,1), "lines"))+
  theme(axis.text=element_text(size=9))+
  geom_text(aes(label = value), vjust = 0)+
  theme(strip.text = element_text(size = 12))
dev.off()
40+40+10+13+5.5+5+3+2.5+49






g <- ggplot(JesseTimeLong2, aes(x = week, y = value, fill = name))
g + geom_bar(stat = "identity")
  #scale_fill_discrete(labels = c("G1", "G2", "G3")) 


g <- ggplot(JesseTime, aes(x=Week,y=Work))
g+geom_bar(stat='identity',fill = "red")+ylab("Hours")
g <- ggplot(JesseTimeLong, aes(x=Week,y=value))
g+geom_bar(stat='identity',fill = "green")+ylab("Hours")+facet_wrap(~measure)
JesseTimeLong <- pivot_longer(JesseTime,cols=-Week,names_to = "measure",
                              values_to = "value")
#JesseTime$Week <- factor(JesseTime$Week, levels = JesseTime$Week[order(-JesseTime$Violin)])
JesseTime
JesseTimeLong
