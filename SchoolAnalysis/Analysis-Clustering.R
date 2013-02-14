library(randomForest)
library(stats) #use for kmeans
library(ggplot2)

schools <- read.csv("SchoolDataForR-2013-01-11.csv")



theme_clean <- theme(
  panel.background = element_rect(fill="white"),
  axis.ticks = element_line(colour=NA),
  panel.grid = element_line(colour="white"),
  axis.text.y = element_text(colour=NA),
  axis.text.x = element_text(colour="white")
)


#first, a random forest

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
schools.df2["SchoolID"] <- NULL
summary(schools.df2)

schools.model <- randomForest(ApGoodScoresPercentPerStudent ~ ., data=schools.df2, ntree=10000, localImp=TRUE, proximity=TRUE, importance=TRUE, keep.forest=TRUE, na.action=na.omit )
  #runs in regression mode. 

str(schools.model)
importance(schools.model, type=1, scale=TRUE)



schools.df.fordist <- schools
names(schools.df.fordist)
schools.df.fordist["SchoolName"] <- NULL
schools.df.fordist["SchoolCity"] <- NULL
schools.df.fordist["Latitude"] <- NULL
schools.df.fordist["Longitude"] <- NULL
schools.df.fordist["ZipCodeID"] <- NULL
schools.df.fordist["Burglary"] <- NULL
schools.df.fordist["Theft"] <- NULL
schools.df.fordist["CarTheft"] <- NULL
schools.df.fordist["Assault"] <- NULL
schools.df.fordist["Rape"] <- NULL
schools.df.fordist["Robbery"] <- NULL
schools.df.fordist["Murder"] <- NULL
schools.df.fordist["PropertyCrime"] <- NULL
schools.df.fordist["ViolentCrime"] <- NULL
schools.df.fordist["ProficientInMath"] <- NULL
schools.df.fordist["ProficientInReading"] <- NULL
schools.df.fordist["ProficientInReadingAndMath"] <- NULL
schools.df.fordist["ChildrenInPovertyPercent"] <- NULL
schools.df.fordist["AverageRentPrice"] <- NULL
schools.df.fordist["District.name"] <- NULL
schools.df.fordist["TeacherPeerBadPercent"] <- NULL
schools.df.fordist["APNumberOfTestTakers"] <- NULL
schools.df.fordist["APTotalTestsTaken"] <- NULL
schools.df.fordist["ApPercentOfSchoolInHardClasses"] <- NULL
schools.df.fordist["ApGoodScoresPercentPerStudent"] <- NULL
schools.df.fordist["APNumberOfHighScores"] <- NULL
schools.df.fordist["SATCriticalReadingMean"] <- NULL
schools.df.fordist["SATMathMean"] <- NULL
schools.df.fordist["SATWritingMean"] <- NULL
schools.df.fordist["PsatSophomoreNumberOfTestTakers"] <- NULL
schools.df.fordist["PSATJuniorNumberOfTestTakers"] <- NULL
schools.df.fordist["PSATSophomoreMathMean"] <- NULL
schools.df.fordist["PSATSophomoreCriticalReadingMean"] <- NULL
schools.df.fordist["PSATSophomoreWritingSkillsMean"] <- NULL
schools.df.fordist["PSATJuniorCriticalReadingMean"] <- NULL
schools.df.fordist["PSATJuniorMathMean"] <- NULL
schools.df.fordist["PSATJuniorWritingSkillsMean"] <- NULL
schools.df.fordist["PercentWaterInZipCode"] <- NULL
names(schools.df.fordist)
summary(schools.df.fordist)

#normalize all of the values
summary(schools.df.fordist)
schools.df.fordist <- na.omit(schools.df.fordist)
schools.df.norm <- as.data.frame(scale(x=schools.df.fordist, scale=TRUE))
schools.df.norm["SchoolID"] <- NULL #we don't want to use it, remove it
summary(schools.df.fordist)

schools.df.norm["Enrollment"] <- schools.df.norm$Enrollment * 12.94792312
schools.df.norm["Graduates"] <- schools.df.norm$Graduates * 14.46111747
schools.df.norm["Cohort"] <- schools.df.norm$Cohort * 12.44998498
schools.df.norm["Continuing"] <- schools.df.norm$Continuing * 1.62891323
schools.df.norm["GraduationRate"] <- schools.df.norm$GraduationRate * 10.60384779
schools.df.norm["ContinuingRate"] <- schools.df.norm$ContinuingRate * 4.13093778
schools.df.norm["FailRate"] <- schools.df.norm$FailRate * 10.34737417
schools.df.norm["MedianIncome"] <- schools.df.norm$MedianIncome * 5.33421704
schools.df.norm["CostOfLivingIndex"] <- schools.df.norm$CostOfLivingIndex * 12.15384746
schools.df.norm["WalkScore"] <- schools.df.norm$WalkScore * 1.86515814
schools.df.norm["Population"] <- schools.df.norm$Population * 5.56958233
schools.df.norm["CollegeDegreePercent"] <- schools.df.norm$CollegeDegreePercent * 12.06248792
schools.df.norm["MaleToFemaleRatio"] <- schools.df.norm$MaleToFemaleRatio * 0.06338732
schools.df.norm["MarriedPercent"] <- schools.df.norm$MarriedPercent * 1.16761441
schools.df.norm["MedianAge"] <- schools.df.norm$MedianAge * 2.05269643
schools.df.norm["OwnerOccupiedHomesPercent"] <- schools.df.norm$OwnerOccupiedHomesPercent * 2.29146379
schools.df.norm["DivorcedPercent"] <- schools.df.norm$DivorcedPercent * 1.41330614
schools.df.norm["SinglePercent"] <- schools.df.norm$SinglePercent * 3.11607072
schools.df.norm["MedianMortgageToIncomeRatio"] <- schools.df.norm$MedianMortgageToIncomeRatio * 3.42119638
schools.df.norm["BachelorsOrHigher"] <- schools.df.norm$BachelorsOrHigher * 12.91579313
schools.df.norm["GraduateOrHigher"] <- schools.df.norm$GraduateOrHigher * 8.84320331
schools.df.norm["SomeCollegeOrHigher"] <- schools.df.norm$SomeCollegeOrHigher * 2.33509867
schools.df.norm["UnderHighSchool"] <- schools.df.norm$UnderHighSchool * 9.38295526
schools.df.norm["LivedInSameHomeForOver5Years"] <- schools.df.norm$LivedInSameHomeForOver5Years * 1.53432926
schools.df.norm["TeacherBadPercent"] <- schools.df.norm$TeacherBadPercent * 0.71399309
schools.df.norm["PrincipalBadPercent"] <- schools.df.norm$PrincipalBadPercent * 1.18644921
schools.df.norm["StaffCostPerStudent"] <- schools.df.norm$StaffCostPerStudent * 2.69557261
schools.df.norm["TotalCostPerStudent"] <- schools.df.norm$TotalCostPerStudent * 2.00600337
schools.df.norm["StudentToTeacherRatio"] <- schools.df.norm$StudentToTeacherRatio * 0.91545999
schools.df.norm["TeacherCertificationPercentage"] <- schools.df.norm$TeacherCertificationPercentage * 0.92018540
schools.df.norm["RevenuePercentGoingToBasicEd"] <- schools.df.norm$RevenuePercentGoingToBasicEd * 2.90977925
schools.df.norm["EslToBasicEdRatio"] <- schools.df.norm$EslToBasicEdRatio * 2.57764197
schools.df.norm["AvgTeacherCost"] <- schools.df.norm$AvgTeacherCost * 2.65604383
schools.df.norm["PeoplePerSquareMile"] <- schools.df.norm$PeoplePerSquareMile * 3.13245021
schools.df.norm["HousingPerSquareMile"] <- schools.df.norm$HousingPerSquareMile * 1.79048041
schools.df.norm["EarlyStudentCount"] <- schools.df.norm$EarlyStudentCount * 3.81800041
schools.df.norm["ElementaryStudentCount"] <- schools.df.norm$ElementaryStudentCount * 3.31411751
schools.df.norm["HighSchoolCount"] <- schools.df.norm$HighSchoolCount * 2.59383011
schools.df.norm["MiddleSchoolCount"] <- schools.df.norm$MiddleSchoolCount * 3.90179435
schools.df.norm["TotalStudentCount"] <- schools.df.norm$TotalStudentCount * 3.28967030
schools.df.norm["PreschoolPercent"] <- schools.df.norm$PreschoolPercent * 4.63591908
schools.df.norm["ElementarySchoolPercent"] <- schools.df.norm$ElementarySchoolPercent * 0.12703230
schools.df.norm["MiddleSchoolPercent"] <- schools.df.norm$MiddleSchoolPercent * 2.25877900
schools.df.norm["HighSchoolPercent"] <- schools.df.norm$HighSchoolPercent * 1.37906072
schools.df.norm["MedianHousePrice"] <- schools.df.norm$MedianHousePrice * 5.35387745
summary(schools.df.norm)


schools.matrix <- as.matrix(schools.df.norm) #turn the data frame into a matrix
schools.dist <- dist(schools.matrix) #compute the Euclidean distance of the matrix
schools.mds <- cmdscale(schools.dist) #compute the multidimensional scale (mds) of the distance
schools.mds.df <- as.data.frame(schools.mds) #turn that mds back into a data frame for plotting
qplot(data=schools.mds.df, x=V1, y=V2, main="High Schools. Closer Together = Similar Demographics", xlab="", ylab="") #plot the results real quick, as a sanity check
ggsave(filename="schools_mds_raw.png")

#Now let's cluster them together.
#We don't know a good number K for k-means. One rule of thumb is the square root (5 or 6).
#But let's go higher, using the elbow rule to check.

#Compute the k-means efficiency (explained variance) for K from 1 through 10
schools.kmeans.efficiency <- c(0)
for (i in 1:15) 
{
  schools.kmeans <- kmeans(x=schools.mds, centers=i)
  schools.kmeans.efficiency <- append(schools.kmeans.efficiency, schools.kmeans$betweenss / schools.kmeans$totss)
}

#Then turn the results into a data frame and plot them.
schools.kmeff.df <- data.frame(schools.kmeans.efficiency, 1:length(schools.kmeans.efficiency) )
names(schools.kmeff.df) <- c("Efficiency","NumberOfClusters")
qplot(data=schools.kmeff.df, x=NumberOfClusters, y=Efficiency*100, xlab="Number of Clusters", ylab="% of Variance Included in Cluster", geom="line")
ggsave(filename="schools_kmeans_efficiency_vs_clusters.png")
#looks like the best cluster is 11. That's the elbow.

#Now, let's do a nicer plot of the data using k=11.
schools.kmeans <- kmeans(x=schools.mds, centers=11)

theme_clean <- theme(
  panel.background = element_rect(fill="white"),
  axis.ticks = element_line(colour=NA),
  panel.grid = element_line(colour="white"),
  text = element_text(size=14, face="bold"),
  axis.text.y = element_text(colour=NA),
  axis.text.x = element_text(colour=NA)  
)

p <- ggplot(data=schools.mds.df, aes(x=V1, y=V2, color=factor(schools.kmeans$cluster)))+
  geom_point(position="identity", size=3, alpha=I(3/4))+
  labs(x="", y="", title="Schools, Clustered by Similarity",color="Group")+
  theme_clean
plot(p)
ggsave(p, filename="schools_kmeans_with_groups.png")
ggsave(p, filename="schools_kmeans_with_groups_med.png", scale=0.5)

#Join schools.kmeans to schools.df2.fordist
schools.df.fordist$GroupID <- apply(schools.df.fordist, 1, function(row) 0)
summary(schools.df.fordist)

for (i in 1:nrow(schools.df.fordist)) {
  schools.df.fordist$GroupID[i] <- schools.kmeans$cluster[i]
}

summary(schools.df.fordist)

qplot(data=schools.df.fordist, x=GroupID, y=Enrollment, xlab="Group", ylab="School Size") #this groups pretty well
  ggsave(filename="school_size_group.png")
  ggsave(filename="school_size_group_half.png", scale=0.5)
qplot(data=schools.df.fordist, x=GroupID, y=CostOfLivingIndex, xlab="Group", ylab="Cost Of Living Index") #this groups pretty well
  ggsave(filename="cost_of_living_group.png")
  ggsave(filename="cost_of_living_group_half.png", scale=0.5)
qplot(data=schools.df.fordist, x=GroupID, y=GraduateOrHigher, xlab="Group", ylab="% of Neighborhood w/ Graduate Degrees") #this groups pretty well
qplot(data=schools.df.fordist, x=GroupID, y=ElementarySchoolPercent*100, xlab="Group", ylab="% of money going to elementary schools") #this is pretty random, but it's less important

summary(schools.df.fordist)

schools.df.grouped <- merge(x=schools.df.fordist, y=schools, by="SchoolID")
schools.df.grouped <- subset(schools.df.grouped, is.na(GroupID) == FALSE)

qplot(ApGoodScoresPercentPerStudent*100, data=schools.df.grouped, facets=GroupID ~ ., geom="histogram", ylab="", xlab="High Achiever %")
ggsave("high_achiever_per_group.png")
ggsave("high_achiever_per_group_half.png", scale=0.5)


# HOW TO ADD A NEW COLUMN: schools.df2$newColumn <- apply(schools.df2, 1, function(row) 1)