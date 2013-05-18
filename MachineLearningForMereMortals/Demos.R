library(ggplot2)
library(stats)
library(randomForest)

theme_clean <- theme(
  panel.background = element_rect(fill="white"),
  axis.ticks = element_line(colour=NA),
  panel.grid = element_line(colour="white"),
  text = element_text(size=14, face="bold"),
  axis.text.y = element_text(colour=NA),
  axis.text.x = element_text(colour=NA)  
)

mpg.df <- mpg
mpg.df$comb <- (mpg$cty + mpg$hwy) / 2


mpg.df2 <- mpg.df
mpg.df2$manufacturer <- NULL
mpg.df2$trans <- NULL
mpg.df2$drv <- NULL
mpg.df2$model <- NULL
mpg.df2$class <- NULL
mpg.df2$fl <- NULL
mpg.df2 <- scale(x=mpg.df2, scale=TRUE)


mpg.mtx <- as.matrix(mpg.df2)
mpg.dist <- dist(mpg.mtx)
mpg.mds <- cmdscale(mpg.dist)
mpg.mds.df <- as.data.frame(mpg.mds)
qplot(data=mpg.mds.df, x=V1, y=V2, xlab="", ylab="")+theme_bw()



mpg.kmeans.efficiency <- c(0)
for (i in 1:15) 
{
  mpg.kmeans <- kmeans(x=mpg.mds, centers=i)
  mpg.kmeans.efficiency <- append(mpg.kmeans.efficiency, mpg.kmeans$betweenss / mpg.kmeans$totss)
}

mpg.kmeff.df <- data.frame(mpg.kmeans.efficiency, 1:length(mpg.kmeans.efficiency) )
names(mpg.kmeff.df) <- c("Efficiency","NumberOfClusters")
qplot(data=mpg.kmeff.df, x=NumberOfClusters, y=Efficiency*100, xlab="Number of Clusters", ylab="% of Variance Included in Cluster", geom="line")+theme_bw()
#elbow point is right around 6 clusters.

mpg.kmeans.final <- kmeans(x=mpg.mds, centers=6)

p <- ggplot(data=mpg.mds.df, aes(x=V1, y=V2, color=factor(mpg.kmeans.final$cluster)))+
  geom_point(position="identity", size=4, alpha=I(3/4))+
  labs(x="", y="", title="mpg, Clustered by Similarity",color="Group")+
  theme_clean
plot(p)


for (i in 1:nrow(mpg.df)) {
  mpg.df$ClusterID[i] <- mpg.kmeans.final$cluster[i]
}


qplot(data=mpg.df, x=as.factor(ClusterID), y=comb, xlab="Cluster", ylab="MPG")+theme_bw() 

mpg.df[mpg.df$Cluster == 3,]
  #high-mileage cars

mpg.df[mpg.df$Cluster == 2,]
 #low-mileage cars






## NOW, DECISION TREES
mpg.df3 <- mpg.df
mpg.df3$ClusterID <- NULL
mpg.df3$class <- NULL
mpg.df3$cty <- NULL
mpg.df3$hwy <- NULL
mpg.df3$model <- NULL
mpg.df3$fl <- NULL
mpg.df

mpg.rf <- randomForest(comb ~ ., data=mpg.df3, ntree=300, importance=TRUE, localImp=TRUE, proximity=TRUE, na.action=na.omit)

importance(mpg.rf)
  #displacement is the most important
  #then the drivetrain
  #then the manufacturer.
  #transmission isn't as important. Neither is the year.


mpg.prediction <- predict(mpg.rf, newdata=mpg.df3)
mpg.prediction.diff <- as.data.frame(cbind(mpg.prediction, mpg.df3$comb))
mpg.prediction.diff$RowNumber <- apply(mpg.prediction.diff, 1, function(nrow) 0)
mpg.prediction.diff$Delta <- apply(mpg.prediction.diff, 1, function(nrow) 0)
mpg.prediction.diff <- mpg.prediction.diff[ order(mpg.prediction.diff[,2], na.last=FALSE, decreasing=FALSE), ]

for (i in 1:nrow(mpg.prediction.diff)) {
  mpg.prediction.diff$RowNumber[i] <- i
}


summary(mpg.prediction.diff)

names(mpg.prediction.diff) <- c("Predicted", "Actual", "RowNumber", "Delta")

#the Delta is the residual
mpg.prediction.diff["Delta"] <- mpg.prediction.diff["Actual"] - mpg.prediction.diff["Predicted"]

p <- NULL
p <- ggplot(data=mpg.prediction.diff, aes(x=RowNumber, y=Actual)) +
  geom_point(colour="dark red", fill=NA, size=2) +
  geom_point(mapping=aes(x=RowNumber, y=Predicted), color="dark green", fill=NA, size=2) +
  labs (x="", y="MPG", title="MPG - Predicted vs Actual") +
  theme_bw()
plot(p)

p <- NULL
p <- ggplot(data=mpg.prediction.diff, aes(x=RowNumber, y=Actual)) +
  geom_point(mapping=aes(x=RowNumber, y=Predicted), color="dark green", fill=NA, size=2) +
  geom_point(mapping=aes(x=RowNumber, y=Delta), color="black", fill=NA, size=2) +
  labs (x="", y="MPG", title="MPG - Predicted vs Residual ") +
  theme_bw()
plot(p)

mpg.df


## LINEAR REGRESSION
qplot(data=mpg.df, x=displ, y=comb, geom=c("point","smooth"), method="lm", xlab="Displacement", ylab="MPG")+theme_bw()

#OVERFITTING:
qplot(data=mpg.df, x=displ, y=comb, geom=c("point","smooth"), xlab="Displacement", ylab="MPG")+theme_bw()
