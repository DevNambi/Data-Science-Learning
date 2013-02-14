#This is the working script for school analysis

library(ggplot2)

setwd("C:/Users/Dev Nambi/Documents/My Dropbox/Notes/Hobbies/School Analysis/")
setwd("/Users/devnambi/Dropbox/Notes/Hobbies/School Analysis/")
schools <- read.csv("SchoolDataForR-2013-01-11.csv")


# Look at the correlations. Make sure to use non-normal correlations. Use qqplots to look for data distribution
# Identify correlations to investigate further
# Make sure to use either Spearman or Kendall for correlations, because the data is not normal
cor(x=schools$ApGoodScoresPercentPerStudent, y=schools$Enrollment, method="spearman")
  #0.6352012

corList <- c(1:ncol(schools))
names(corList) <- names(schools)
for (i in 4:ncol(schools)) { #[1 = school name, 2=school city, 3=school ID]
  #columnName <- names(schools)[i]
  #corResult <- cor(x=schools$ApGoodScoresPercentPerStudent, y=schools[,i], method="spearman")
  corList[i] <- cor(x=schools$ApGoodScoresPercentPerStudent, y=schools[,i], method="spearman", use="pairwise.complete.obs")
}
sort(abs(corList), decreasing=TRUE)
summary(corList)


str(schools)

corList.df <- as.data.frame(corList)
corList.df$name <- row.names(corList.df)
#names(corList.df)
corList.df <- subset(corList.df, corList < 1.0)
qplot(data=corList.df, y=name, x=abs(corList)*100.0, xlab="Correlation (%)", ylab="Variable", main="Correlation")


qplot(data=factor.importance.df, y=name, x=Importance, xlab="Importance (%)", ylab="Factor", main="Factor Importance")


corList <- c(1:ncol(schools)^2 / 2)
for (i in 4:ncol(schools)) { #[1 = school name, 2=school city, 3=school ID]
  for (j in 4:ncol(schools)) {
    if (i < j)
    {
      #this avoids doing everything twice
      colNum <- #FIX ME
      corList[colNum] <- cor(x=schools[,i], y=schools[,j], method="kendall", use="pairwise.complete.obs")
      names(corList)[colNum] <- cat(names(schools[i]), "<->", names(schools[j]))
    }
  }
  
}
sort(abs(corList), decreasing=TRUE)
summary(corList)
