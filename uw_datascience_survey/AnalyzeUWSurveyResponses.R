library(ggplot2)

survey <- read.csv(file="ReshapedResponses.csv", header=TRUE)
survey[,3] <- survey[,3]+2 #go from a range of -2 to 2 to a range of 0 to 4
#summary(survey)
orderedSurvey = with(survey, reorder(Question, Response, median))

theme_clean <- theme(
  panel.background = element_rect(fill="white"),
  axis.ticks = element_line(colour=NA),
  panel.grid = element_line(colour="white"),
  text = element_text(size=14, face="bold"),
  axis.text.y = element_text(colour="black", face="italic", size=8),
  axis.text.x = element_text(colour="black", face="bold", size=8)  
)

p <- ggplot(data=survey, aes(x=Response, y=orderedSurvey))+
    geom_boxplot(notch=TRUE)+
    labs(x="Importance", y="Question", title="In which topics are data science students most interested?")+
    theme_clean
plot(p)

ggsave(p, filename="data_science_interests.png")