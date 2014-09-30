library(ggplot2)
library(randomForest)

theme_set(theme_bw())

setwd('/Users/devnambi/Dropbox/PASS Special Projects/Analysis/')
setwd('C:/Users/Dev Nambi/Documents/My Dropbox/PASS Special Projects/Analysis/')
summit.df <- read.csv("factSummit.csv")
new.df <- read.csv("factSummit_2014_wMSFT.csv")


summit2.df <- summit.df
new2.df <- new.df
str(summit.df)
str(new.df)
summary(summit.df)

unique(summit2.df$SessionCategory)
unique(new2.df$SessionCategory)
unique(summit2.df$SessionTrack)
unique(new2.df$SessionTrack)


# FIRST, BASIC VISUALIZATIONS
names(summit2.df)

qplot(data=summit2.df, x=RoomPercentFull*100, xlab="Room % Full", ylab="", geom="density") #only a few sessions are over capacity
ggsave('Attendance_Histogram.png')

qplot(data=summit2.df, x=AverageRating, geom="density") # we tend to pick high-quality presenters
qplot(data=summit2.df, x=PercentOfAllAttendees*100, geom="density") #very few sessions have more than 20% of the Summit there

qplot(data=summit.df, x=RoomCapacity, geom="density") #very few sessions have more than 20% of the Summit there

qplot(data=summit.df, x=SessionCategory, y=PercentOfAllAttendees * 100, ylab="% of Attendees")

qplot(data=summit.df, x=SessionCategory, y=PercentOfAllAttendees * 100, ylab="% of Attendees")
ggsave('Attendance_by_SessionType.png')

qplot(data=summit.df, y=SessionTrack, x=PercentOfAllAttendees * 100, xlab="% of Attendees")
ggsave('Attendance_by_Track.png')

qplot(data=summit.df, x=SessionLevel, y=PercentOfAllAttendees * 100, ylab="% of Attendees")
ggsave('Attendance_by_Level.png')

# SECOND, ADD NEW FEATURES TO THE DATASET
summit2.df$RoomPercentEmpty = 1.0 - summit2.df$RoomPercentFull


# THIRD, TEST FOR CORRELATION

cor(x=summit2.df$PercentOfAllAttendees, y=summit.df$RoomCapacity, method="spearman", use="pairwise.complete.obs") #--0.003705316

## Look for speaker correlations with room percent full
cor(x=summit2.df$RoomPercentFull, y=summit2.df$AverageRating, method="spearman", use="pairwise.complete.obs") #--0.003705316

cor(x=summit2.df$RoomPercentFull, y=summit2.df$AveragePresenterRating, method="spearman", use="pairwise.complete.obs") #0.05808548
cor.test(x=summit2.df$RoomPercentFull, y=summit2.df$AveragePresenterRating, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.08559. Useless.

cor(x=summit2.df$RoomPercentFull, y=summit2.df$MaxPresenterRating, method="spearman", use="pairwise.complete.obs") #0.05251298
cor.test(x=summit2.df$RoomPercentFull, y=summit2.df$MaxPresenterRating, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.1202 Useless.

cor(x=summit2.df$RoomPercentFull, y=summit2.df$PercentMicrosoftPresenters, method="spearman", use="pairwise.complete.obs") #-0.1034888
cor.test(x=summit2.df$RoomPercentFull, y=summit2.df$PercentMicrosoftPresenters, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.002138
# so, that's significant. But it's very weak.

cor(x=summit2.df$RoomPercentFull, y=summit2.df$TotalTwitterFollowers, method="spearman", use="pairwise.complete.obs") #0.09034148
cor.test(x=summit2.df$RoomPercentFull, y=summit2.df$TotalTwitterFollowers, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.007394
# significant, but weak

cor(x=summit2.df$RoomPercentFull, y=summit2.df$AverageTwitterFollowers, method="spearman", use="pairwise.complete.obs") #0.0752461

cor(x=summit2.df$RoomPercentFull, y=summit2.df$TotalSearchResultScore, method="spearman", use="pairwise.complete.obs") #0.08995827

cor(x=summit2.df$RoomPercentFull, y=summit2.df$AverageSearchResultScore, method="spearman", use="pairwise.complete.obs") #0.07586455

cor(x=summit2.df$RoomPercentFull, y=summit2.df$MaxPageRankScore, method="spearman", use="pairwise.complete.obs") #0.0476542

cor(x=summit2.df$RoomPercentFull, y=summit2.df$AveragePageRankScore, method="spearman", use="pairwise.complete.obs") #0.03015712


## Look for speaker correlations with percentage of attendees attending
cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AverageRating, method="spearman", use="pairwise.complete.obs") #0.0929039

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AveragePresenterRating, method="spearman", use="pairwise.complete.obs") #0.129866
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AveragePresenterRating, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.000117
# that's somewhat useful

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$MaxPresenterRating, method="spearman", use="pairwise.complete.obs") #0.09761507
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$MaxPresenterRating, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.003849

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$PercentMicrosoftPresenters, method="spearman", use="pairwise.complete.obs") #-0.1284253
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$PercentMicrosoftPresenters, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.0001382
# so, that's significant. But it's very weak.

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$TotalTwitterFollowers, method="spearman", use="pairwise.complete.obs") #0.1767048
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$TotalTwitterFollowers, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 1.41e-07
# significant, but weak

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AverageTwitterFollowers, method="spearman", use="pairwise.complete.obs") #0.1895046
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AverageTwitterFollowers, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 1.585e-08

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$TotalSearchResultScore, method="spearman", use="pairwise.complete.obs") #0.1560599
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$TotalSearchResultScore, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 3.47e-06

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AverageSearchResultScore, method="spearman", use="pairwise.complete.obs") #0.1812261
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AverageSearchResultScore, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 6.63e-08

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$MaxPageRankScore, method="spearman", use="pairwise.complete.obs") #0.09414895
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$MaxPageRankScore, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.005291

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AveragePageRankScore, method="spearman", use="pairwise.complete.obs") #0.1064758
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$AveragePageRankScore, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.0016



## Test for category and track

cor(x=summit2.df$RoomPercentFull, y=summit2.df$SessionLevel, method="spearman", use="pairwise.complete.obs") #0.03327433
cor.test(x=summit2.df$RoomPercentFull, y=summit2.df$SessionLevel, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 0.3247. USELESS

cor(x=summit2.df$PercentOfAllAttendees, y=summit2.df$SessionLevel, method="spearman", use="pairwise.complete.obs") #0.2373338
cor.test(x=summit2.df$PercentOfAllAttendees, y=summit2.df$SessionLevel, method="spearman", exact=FALSE, na.action=na.exclude) #p-value: 1.108e-12
# huh. Useful. 


cor(x=summit2.df$RoomPercentFull, y=summit2.df$SessionLevel, method="spearman", use="pairwise.complete.obs") #0.03327433




# SIXTH, REMOVE USELESS FEATURES
summit2.df$SessionYear <- NULL
summit2.df$SessionCode <- NULL
summit2.df$StartTime <- NULL
summit2.df$EndTime <- NULL
summit2.df$Attendance <- NULL
summit2.df$RoomCapacity <- NULL
summit2.df$RoomPercentFull <- NULL
summit2.df$AllAttendeesAtThisTime <- NULL
summit2.df$PeopleWhoEvaluated <- NULL
summit2.df$PercentWhoEvaluated <- NULL
summit2.df$RoomPercentEmpty <- NULL
summit2.df$AverageRating <- NULL
summary(summit2.df)

names(summit2.df)

summit.model <- randomForest(PercentOfAllAttendees ~ ., data=summit2.df, ntree=1000, localImp=TRUE, nPerm=3, proximity=TRUE, keep.forest=TRUE, importance=TRUE, na.action=na.omit )


summit2.df$AveragePresenterRating <- NULL
summit2.df$MaxPresenterRating <- NULL
summit.model.bkup <- randomForest(PercentOfAllAttendees ~ ., data=summit2.df, ntree=1000, localImp=TRUE, nPerm=3, proximity=TRUE, keep.forest=TRUE, importance=TRUE, na.action=na.omit )

str(summit.model)
summit.model$importance[,0-1]
summit.model$importanceSD
summit.model$mse
summit.model$rsq

# predict the past
summit.prediction <- predict(summit.model, newdata=summit2.df)
summit.prediction.diff <- as.data.frame(cbind(summit.prediction, summit2.df$PercentOfAllAttendees))
summit.prediction.diff$RowNumber <- apply(summit.prediction.diff, 1, function(nrow) 0)
summit.prediction.diff$Delta <- apply(summit.prediction.diff, 1, function(nrow) 0)
summit.prediction.diff <- summit.prediction.diff[ order(summit.prediction.diff[,2], na.last=FALSE, decreasing=FALSE), ]

for (i in 1:nrow(summit.prediction.diff)) {
  summit.prediction.diff$RowNumber[i] <- i
}

median(abs(summit.prediction.diff$Delta) / summit.prediction.diff$Actual, na.rm=TRUE)


summary(summit.prediction.diff)

names(summit.prediction.diff) <- c("Predicted", "Actual", "RowNumber", "Delta")

#the Delta is the residual
summit.prediction.diff["Delta"] <- summit.prediction.diff["Actual"] - summit.prediction.diff["Predicted"]

p <- NULL
p <- ggplot(data=summit.prediction.diff, aes(x=RowNumber, y=Actual * 100)) +
  geom_point(colour="dark red", fill=NA, size=2) +
  geom_point(mapping=aes(x=RowNumber, y=Predicted * 100), color="dark green", fill=NA, size=2) +
  labs (x="", y="% of People Attending", title="Predicted vs Actual")
plot(p)
ggsave("PercentageAttending-Predicted_vs_Actual.png")


p <- NULL
p <- ggplot(data=summit.prediction.diff, aes(x=RowNumber, y=Actual)) +
  geom_point(mapping=aes(x=RowNumber, y=Predicted * 100), color="dark green", fill=NA, size=2) +
  geom_point(mapping=aes(x=RowNumber, y=Delta * 100), color="black", fill=NA, size=2) +
  labs (x="", y="% of People Attending", title="% of People Attending - Predicted vs Residual ") 
plot(p)


cor(x=summit.prediction.diff$Actual, y=summit.prediction.diff$Predicted, method="spearman", use="pairwise.complete.obs")
cor.test(x=summit.prediction.diff$Actual, y=summit.prediction.diff$Predicted, method="spearman", exact=FALSE)
# 79.3% accurate


## FINAL BIT: PREDICT THE FUTURE!
str(new2.df)
str(summit2.df)

new2.df$SessionYear <- NULL
new2.df$SessionCode <- NULL
new2.df$StartTime <- NULL
new2.df$EndTime <- NULL
new2.df$Attendance <- NULL
new2.df$RoomCapacity <- NULL
new2.df$RoomPercentFull <- NULL
new2.df$AllAttendeesAtThisTime <- NULL
new2.df$PeopleWhoEvaluated <- NULL
new2.df$PercentWhoEvaluated <- NULL
new2.df$RoomPercentEmpty <- NULL
new2.df$AverageRating <- NULL 




str(new2.df)
str(summit2.df)

current.prediction <- predict(summit.model, newdata=new2.df, na.action=na.omit)
bkup.prediction <- predict(summit.model.bkup, newdata=new2.df, na.action=na.omit)
new3.df <- as.data.frame(cbind(new2.df, current.prediction, bkup.prediction))

summary(new3.df)
write.csv(new3.df, row.names = FALSE, file="summitpredictions_2014_wMSFT.csv")

