schools <- read.csv("SchoolDataForR-2013-01-11.csv")
#Order of operations
  # 1) Look at the data visually
  # 2) Look at the correlations. Make sure to use non-normal correlations. Use qqplots to look for data distribution
  # 3) Identify correlations to investigate further
  # 4) Random forest. Use it to predict the data.
#Histograms, KDEs of various columns


library(randomForest)
library(ggplot2)

#NOW, USE RANDOM FORESTS FOR PREDICTION AND IMPORTANCE EVALUATION
#ignore schoolname, schoolcity, latitude, longitude, zipcode, burglary, theft, cartheft, assault, rape, robbery

#ignore columns that are either just attributes (school name, latitude)
# or columns that are confounds (SAT, PSAT scores)
schools.df2 <- schools
schools.df2["SchoolName"] <- NULL
schools.df2["SchoolCity"] <- NULL
schools.df2["Latitude"] <- NULL
schools.df2["Longitude"] <- NULL
schools.df2["ZipCodeID"] <- NULL
schools.df2["Burglary"] <- NULL
schools.df2["Theft"] <- NULL
schools.df2["CarTheft"] <- NULL
schools.df2["Assault"] <- NULL
schools.df2["Rape"] <- NULL
schools.df2["Robbery"] <- NULL
schools.df2["Murder"] <- NULL
schools.df2["PropertyCrime"] <- NULL
schools.df2["ViolentCrime"] <- NULL
schools.df2["ProficientInMath"] <- NULL
schools.df2["ProficientInReading"] <- NULL
schools.df2["ProficientInReadingAndMath"] <- NULL
schools.df2["ChildrenInPovertyPercent"] <- NULL
schools.df2["AverageRentPrice"] <- NULL
schools.df2["District.name"] <- NULL
schools.df2["SchoolID"] <- NULL
schools.df2["PoorPercent"] <- NULL
schools.df2["TeacherPeerBadPercent"] <- NULL
schools.df2["APNumberOfTestTakers"] <- NULL
schools.df2["APTotalTestsTaken"] <- NULL
schools.df2["ApPercentOfSchoolInHardClasses"] <- NULL
schools.df2["APNumberOfHighScores"] <- NULL
schools.df2["SATCriticalReadingMean"] <- NULL
schools.df2["SATMathMean"] <- NULL
schools.df2["SATWritingMean"] <- NULL
schools.df2["PsatSophomoreNumberOfTestTakers"] <- NULL
schools.df2["PSATJuniorNumberOfTestTakers"] <- NULL
schools.df2["PSATSophomoreMathMean"] <- NULL
schools.df2["PSATSophomoreCriticalReadingMean"] <- NULL
schools.df2["PSATSophomoreWritingSkillsMean"] <- NULL
schools.df2["PSATJuniorCriticalReadingMean"] <- NULL
schools.df2["PSATJuniorMathMean"] <- NULL
schools.df2["PSATJuniorWritingSkillsMean"] <- NULL
schools.df2["TeacherPeerBadPercent"] <- NULL

#check the data
summary(schools.df2)

schools.model <- randomForest(ApGoodScoresPercentPerStudent ~ ., data=schools.df2, ntree=10000, localImp=TRUE, nPerm=3, proximity=TRUE, keep.forest=TRUE, importance=TRUE, na.action=na.omit )
  #runs in regression mode. 

str(schools.model)

schools.prediction <- predict(schools.model, newdata=schools.df2)
schools.prediction.diff <- as.data.frame(cbind(schools.prediction, schools.df2$ApGoodScoresPercentPerStudent))
schools.prediction.diff$RowNumber <- apply(schools.prediction.diff, 1, function(nrow) 0)
schools.prediction.diff$Delta <- apply(schools.prediction.diff, 1, function(nrow) 0)
schools.prediction.diff <- schools.prediction.diff[ order(schools.prediction.diff[,2], na.last=FALSE, decreasing=FALSE), ]

for (i in 1:nrow(schools.prediction.diff)) {
  schools.prediction.diff$RowNumber[i] <- i
}


summary(schools.prediction.diff)

names(schools.prediction.diff) <- c("Predicted", "Actual", "RowNumber", "Delta")

#the Delta is the residual
schools.prediction.diff["Delta"] <- schools.prediction.diff["Actual"] - schools.prediction.diff["Predicted"]


p <- NULL
p <- ggplot(data=schools.prediction.diff, aes(x=RowNumber, y=Actual*100)) +
  geom_point(colour="dark red", fill=NA, size=2) +
  geom_point(mapping=aes(x=RowNumber, y=Predicted*100), color="dark green", fill=NA, size=2) +
  labs (x="", y="High Achiever %", title="High Achiever % - Predicted vs Actual")
plot(p)
ggsave("HighAchiever-Predicted_vs_Actual.png")

p <- NULL
p <- ggplot(data=schools.prediction.diff, aes(x=RowNumber, y=Actual)) +
  geom_point(mapping=aes(x=RowNumber, y=Predicted*100), color="dark green", fill=NA, size=2) +
  geom_point(mapping=aes(x=RowNumber, y=Delta*100), color="black", fill=NA, size=2) +
  labs (x="", y="High Achiever %", title="High Achiever % - Predicted vs Residual ") 
plot(p)
ggsave("HighAchiever-Predicted_vs_Residual.png")


factor.importance <- importance(schools.model, type=1, scale=TRUE)
colnames(factor.importance) <- NULL

factor.importance.df <- as.data.frame(factor.importance)
names(factor.importance.df) <- c("Importance")
factor.importance.names <- row.names(factor.importance.df)
factor.importance.df <- as.data.frame(factor.importance.df[with(factor.importance.df, order(Importance, decreasing=TRUE)), ])
names(factor.importance.df) <- c("Importance")
row.names(factor.importance.df) <- factor.importance.names
factor.importance.df$name <- row.names(factor.importance.df)


qplot(data=factor.importance.df, y=name, x=Importance, xlab="Importance (%)", ylab="Factor", main="Factor Importance")
ggsave("factor_importance.png")

str(schools.model)
str(schools.prediction)

names(schools.prediction.diff)

cor(x=schools.prediction.diff$Actual, y=schools.prediction.diff$Predicted, method="spearman", use="pairwise.complete.obs")
  #0.933 - a 93% correlation. That's pretty impressive
cor.test(x=schools.prediction.diff$Actual, y=schools.prediction.diff$Predicted, method="spearman", exact=FALSE)
  #p-value: 2.2e-16
  #0.933