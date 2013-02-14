#This is the working script for school analysis

library(ggplot2)
library(stats)

schools <- read.csv("SchoolDataForR-2013-01-11.csv")
#Histograms, KDEs of various columns



theme_clean <- theme(
  panel.background = element_rect(fill="white"),
  axis.ticks = element_line(colour=NA),
  panel.grid = element_line(colour="white"),
  axis.text.y = element_text(colour=NA),
  axis.text.x = element_text(colour="white")
)





plotDensity <- function(densityResults, xLabel, yLabel="Number of Schools", nameOfFile, title="", xMultiplier=1.0) {
  qplot(x=densityResults$x * xMultiplier, y=densityResults$y, xlab=xLabel, ylab=yLabel, main=title)
}

plotDensity(densityResults=density(na.omit(schools$ApGoodScoresPercentPerStudent*100)), xLabel="High Achiever %", nameOfFile="ApPercentOfSchoolInHardClasses-Raw.png")
ggsave(filename="HighAchieverPercent-Raw.png", scale=0.25)


plotDensity(densityResults=density(schools$ApPercentOfSchoolInHardClasses), xLabel="% of School Taking AP Tests", nameOfFile="ApPercentOfSchoolInHardClasses-Raw.png")
ggsave(filename="ApPercentOfSchoolInHardClasses-Raw.png", scale=0.25)
  #Mostly zero

plotDensity(densityResult=density(schools$GraduationRate), xLabel="Graduation Rate (%)", nameOfFile="GraduationRate-Raw.png")
ggsave(filename="GraduationRate-Raw.png", scale=0.5)
  #Hovers around 90%

plotDensity(densityResult=density(schools$Enrollment), xLabel="Enrollment", nameOfFile="Enrollment-Raw.png")
ggsave(filename="Enrollment-Raw.png", scale=0.5)
#Interesting. Biggest spike is for small schools (less than 200 students)
#Another spike around 1500 students

plotDensity(densityResult=density(schools$MedianIncome), xLabel="Median Income", nameOfFile="MedianIncome-Raw.png")
ggsave(filename="MedianIncome-Raw.png", scale=0.5)
#Big spike around $35K or so
  #Another spike around $60K

plotDensity(densityResult=density(schools$CostOfLivingIndex), xLabel="Cost of Living Index", nameOfFile="CostOfLiving-Raw.png")
ggsave(filename="CostOfLivingIndex-Raw.png", scale=0.5)
#Big spike around 120 or so
  #Long tail to the right (expensive locations). Not very many cheap locations

plotDensity(densityResult=density(schools$Population), xLabel="Local population", nameOfFile="Population-Raw.jpg")
ggsave(filename="Population-Raw.png", scale=0.5)
#Most areas have less than 10K people. Very interesting data.

plotDensity(densityResult=density(schools$MaleToFemaleRatio / 2), xLabel="Male to female ratio", nameOfFile="MaleToFemaleRatio-Raw.png")
ggsave(filename="MaleToFemaleRatio-Raw.png", scale=0.5)
#Divide by 2 to make more intuitive

plotDensity(densityResult=density(schools$StudentToTeacherRatio), xLabel="Student to Teacher ratio", nameOfFile="StudentToTeacherRatio-Raw.png")
ggsave(filename="StudentToTeacherRatio-Raw.png", scale=0.5)
#Most of the results are around 20-25

plotDensity(densityResult=density(schools$BachelorsOrHigher), xLabel="% of Neighborhood with a Bachelor's degree or higher", nameOfFile="BachelorsOrHigher-Raw.png")
ggsave(filename="BachelorsOrHigher-Raw.png", scale=0.5)
#Spikes around 15-18%.
  #Trails off dramatically above 40%

plotDensity(densityResults=density(schools$MedianAge), xLabel="Median Age Of Neighborhood", nameOfFile="MedianAge-Raw.png")
ggsave(filename="MedianAge-Raw.png", scale=0.5)
#Big spike is around 35. Most of the data is between 30 and 45

plotDensity(densityResults=density(schools$TotalCostPerStudent), xLabel="Total Cost Per Student", nameOfFile="TotalCostPerStudent-Raw.png")
ggsave(filename="TotalCostPerStudent-Raw.png", scale=0.5)
#Around 5K per student

plotDensity(densityResults=density(schools$RevenuePercentGoingToBasicEd), xLabel="% of Revenue Going to Basic Ed", nameOfFile="")
ggsave(filename="RevenuePercentGoingToBasicEd-Raw.png", scale=0.5)
#Between 50 and 60%. That's surprisingly low.

plotDensity(densityResults=density(schools$UnderHighSchool), xLabel="% of Neighborhood without a high school diploma", nameOfFile="")
ggsave(filename="UnderHighSchool-Raw.png", scale=0.5)
#Around 15%, it looks like

plotDensity(densityResults=density(schools$MarriedPercent), xLabel="% of Neighborhood that is married", nameOfFile="")
ggsave(filename="MarriedPercent-Raw.png", scale=0.5)
#Big spike around 65%

plotDensity(densityResults=density(schools$MedianHousePrice), xLabel="Median House Price", nameOfFile="")
ggsave(filename="MedianHousePrice-Raw.png", scale=0.5)
#Double spike. Interesting.

plotDensity(densityResults=density(schools$StaffCostPerStudent), xLabel="Staff Cost Per Student", nameOfFile="")
ggsave(filename="StaffCostPerStudent-Raw.png", scale=0.5)
#Big spike around $5K

plotDensity(densityResults=density(schools$TeacherCertificationPercentage), xLabel="% of Teachers that are Certified", nameOfFile="")
ggsave(filename="TeacherCertificationPercentage-Raw.png", scale=0.5)
#Looks more normal (long tail to the right)
  #Over 90%, surprisingly? Or is that .9%?

plotDensity(densityResults=density(schools$FailRate), xLabel="% of students that drop out", nameOfFile="")
ggsave(filename="FailRate-Raw.png", scale=0.5)
#Big spike around 15-20%

plotDensity(densityResults=density(schools$EslToBasicEdRatio), xLabel="Ratio of ESL to English-speaking", nameOfFile="")
ggsave(filename="EslToBasicEdRatio-Raw.png", scale=0.5)
#Big spike around 5%

plotDensity(densityResults=density(schools$GraduateOrHigher), xLabel="% of Neighborhood w/ a graduate degree", nameOfFile="")
ggsave(filename="GraduateOrHigher-Raw.png", scale=0.5)
#Spikes at less than 10%

plotDensity(densityResults=density(schools$AvgTeacherCost), xLabel="Average Teacher Cost", nameOfFile="")
ggsave(filename="AvgTeacherCost-Raw.png", scale=0.5)
#Big spike around 100K

plotDensity(densityResults=density(schools$SomeCollegeOrHigher), xLabel="% of neighborhood w/ some college education", nameOfFile="")
ggsave(filename="SomeCollegeOrHigher-Raw.png", scale=0.5)
#Looks more normal
  #Around 25-25%

##NOW THAT WE'VE SEEN THE DENSITY, DO SCATTER PLOTS

#School-specific information
qqplot(x=schools$GraduationRate, y=schools$ApGoodScoresPercentPerStudent) #WILDLY DIFFERENT
qplot(x=GraduationRate, xlab="Graduation Rate (%)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="GraduationRate-Scatter.png", scale=0.5)

qqplot(x=schools$ContinuingRate, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=ContinuingRate, xlab="% of students who are 5th-year seniors"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="ContinuingRate-Scatter.png", scale=0.5)

qqplot(x=schools$FailRate, y=schools$ApGoodScoresPercentPerStudent) #WILDLY DIFFERENT
qplot(x=FailRate, xlab="Dropout rate (%)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="FailRate-Scatter.png", scale=0.5)

qqplot(x=schools$APNumberOfTestTakers, y=schools$ApGoodScoresPercentPerStudent) #WILDLY DIFFERENT
qplot(x=APNumberOfTestTakers, xlab="Number of students taking AP tests"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="APNumberOfTestTakers-Scatter.png", scale=0.5)

qqplot(x=schools$Enrollment, y=schools$ApGoodScoresPercentPerStudent) #Curved down in an interesting way. Looks exponential
qplot(x=Enrollment, xlab="Number of Students"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="Enrollment-Scatter.png", scale=0.5)

qqplot(x=schools$Cohort, y=schools$ApGoodScoresPercentPerStudent) #Kinda weird
qplot(x=Cohort, xlab="Number of students in grade"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="Cohort-Scatter.png", scale=0.5)

qqplot(x=schools$APTotalTestsTaken, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=APTotalTestsTaken, xlab="Number of AP tests taken"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="APTotalTestsTaken-Scatter.png", scale=0.5)

qqplot(x=schools$APNumberOfHighScores, y=schools$ApGoodScoresPercentPerStudent) 
qplot(x=APNumberOfHighScores, xlab="Number of AP tests passed"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="APNumberOfHighScores-Scatter.png", scale=0.5)

qqplot(x=schools$SATCriticalReadingMean, y=schools$ApGoodScoresPercentPerStudent) #WILDLY DIFFERENT. Exponential curve
qplot(x=SATCriticalReadingMean, xlab="SAT Score (Reading)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="SATCriticalReadingMean-Scatter.png", scale=0.5)

qqplot(x=schools$SATMathMean, y=schools$ApGoodScoresPercentPerStudent) #WILDLY DIFFERENT. Exponential curve, for the most part
qplot(x=SATMathMean, xlab="SAT Score (Math)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="SATMathMean-Scatter.png", scale=0.5)

qqplot(x=schools$SATWritingMean, y=schools$ApGoodScoresPercentPerStudent) #WILDLY DIFFERENT. Exponential curve
qplot(x=SATWritingMean, xlab="SAT Score (Writing)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="SATWritingMean-Scatter.png", scale=0.5)

qqplot(x=schools$PsatSophomoreNumberOfTestTakers, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=PsatSophomoreNumberOfTestTakers, xlab="PSAT Number of Test Takers (Sophomore)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PsatSophomoreNumberOfTestTakers-Scatter.png", scale=0.5)

qqplot(x=schools$PSATJuniorNumberOfTestTakers, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=PSATJuniorNumberOfTestTakers, xlab="PSAT Number of Test Takers (Junior)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PSATJuniorNumberOfTestTakers-Scatter.png", scale=0.5)

qqplot(x=schools$PSATSophomoreMathMean, y=schools$ApGoodScoresPercentPerStudent) #exponential
qplot(x=PSATSophomoreMathMean, xlab="PSAT Math Score (Sophomore)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PSATSophomoreMathMean-Scatter.png", scale=0.5)

qqplot(x=schools$PSATJuniorMathMean, y=schools$ApGoodScoresPercentPerStudent) #exponential
qplot(x=PSATJuniorMathMean, xlab="PSAT Math Score (Junior)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PSATJuniorMathMean-Scatter.png", scale=0.5)

qqplot(x=schools$PSATSophomoreCriticalReadingMean, y=schools$ApGoodScoresPercentPerStudent) #exponential
qplot(x=PSATSophomoreCriticalReadingMean, xlab="PSAT Reading (Sophomore)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PSATSophomoreCriticalReadingMean-Scatter.png", scale=0.5)

qqplot(x=schools$PSATJuniorCriticalReadingMean, y=schools$ApGoodScoresPercentPerStudent) #very sharp exponent
qplot(x=PSATJuniorCriticalReadingMean, xlab="PSAT Reading (Junior)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PSATJuniorCriticalReadingMean-Scatter.png", scale=0.5)

qqplot(x=schools$PSATSophomoreWritingSkillsMean, y=schools$ApGoodScoresPercentPerStudent) #interesting exponential
qplot(x=PSATSophomoreWritingSkillsMean, xlab="PSAT Writing (Sophomore)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PSATSophomoreWritingSkillsMean-Scatter.png", scale=0.5)

qqplot(x=schools$PSATJuniorWritingSkillsMean, y=schools$ApGoodScoresPercentPerStudent) #exponential
qplot(x=PSATJuniorWritingSkillsMean, xlab="PSAT Writing (Junior)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PSATJuniorWritingSkillsMean-Scatter.png", scale=0.5)

qqplot(x=schools$TeacherBadPercent, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=(1.0-TeacherBadPercent)*100, xlab="Teachers w/ Good Reviews (%)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="TeacherGoodPercent-Scatter.png", scale=0.5)

qqplot(x=log(schools$TeacherPeerBadPercent), y=schools$ApGoodScoresPercentPerStudent) #Completely skewed. Normalized when log()
qplot(x=(1.0-TeacherPeerBadPercent)*100, xlab="Teachers w/ Good Reviews, Peer Review (%)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="TeacherGoodPercentPeer-Scatter.png", scale=0.5)

qqplot(x=log(schools$PrincipalBadPercent), y=schools$ApGoodScoresPercentPerStudent) #Also completely skewed. Cleaner when log()
qplot(x=(1.0-PrincipalBadPercent)*100, xlab="Principals w/ Good Reviews (%)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PrincipalGoodPercent-Scatter.png", scale=0.5)

qqplot(x=schools$StaffCostPerStudent, y=schools$ApGoodScoresPercentPerStudent) #Skewed
qplot(x=StaffCostPerStudent, xlab="Staff Cost Per Student"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="StaffCostPerStudent-Scatter.png", scale=0.5)

qqplot(x=schools$TotalCostPerStudent, y=schools$ApGoodScoresPercentPerStudent) #Skewed
qplot(x=TotalCostPerStudent, xlab="Total Cost Per Student"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="TotalCostPerStudent-Scatter.png", scale=0.5)

qqplot(x=schools$StudentToTeacherRatio, y=schools$ApGoodScoresPercentPerStudent) #Skewed
qplot(x=StudentToTeacherRatio, xlab="Student-to-Teacher Ratio"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="StudentToTeacherRatio-Scatter.png", scale=0.5)

qqplot(x=schools$AvgTeacherCost, y=schools$ApGoodScoresPercentPerStudent) #Skewed
qplot(x=AvgTeacherCost, xlab="Average Teacher Cost"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="AverageTeacherCost-Scatter.png", scale=0.5)

qqplot(x=schools$ElementaryStudentCount, y=schools$ApGoodScoresPercentPerStudent) #bad data? What does this mean?
qplot(x=ElementaryStudentCount, xlab="Number of Elementary Students in District"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="ElementaryStudentCount-Scatter.png", scale=0.5)

qqplot(x=schools$HighSchoolCount, y=schools$ApGoodScoresPercentPerStudent) #bad data? What does this mean?
qplot(x=HighSchoolCount, xlab="Number of High School Students in District"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="HighSchoolCount-Scatter.png", scale=0.5)

qqplot(x=schools$MiddleSchoolCount, y=schools$ApGoodScoresPercentPerStudent) #bad data? What does this mean?
qplot(x=MiddleSchoolCount, xlab="Number of Middle School Students in District"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="MiddleSchoolCount-Scatter.png", scale=0.5)

qqplot(x=schools$EarlyStudentCount, y=schools$ApGoodScoresPercentPerStudent) #bad data? What does this mean?
qplot(x=EarlyStudentCount, xlab="Number of Pre-K Students in District"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="EarlyStudentCount-Scatter.png", scale=0.5)

qqplot(x=schools$PreschoolPercent, y=schools$ApGoodScoresPercentPerStudent) #inverse curve, almost
qplot(x=PreschoolPercent*100, xlab="% of District Budget to Pre-K"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PreschoolPercent-Scatter.png", scale=0.5)

qqplot(x=schools$ElementarySchoolPercent, y=schools$ApGoodScoresPercentPerStudent) #hockey-stick
qplot(x=ElementarySchoolPercent*100, xlab="% of District Budget to Elementary Schools"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="ElementarySchoolPercent-Scatter.png", scale=0.5)

qqplot(x=schools$MiddleSchoolPercent, y=schools$ApGoodScoresPercentPerStudent) #hockey-stick
qplot(x=MiddleSchoolPercent*100, xlab="% of District Budget to Middle Schools"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="MiddleSchoolPercent-Scatter.png", scale=0.5)

qqplot(x=schools$HighSchoolPercent, y=schools$ApGoodScoresPercentPerStudent) #very odd looking
qplot(x=HighSchoolPercent*100, xlab="% of District Budget to High Schools"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="HighSchoolPercent-Scatter.png", scale=0.5)

qqplot(x=schools$ProficientInReadingAndMath, y=schools$ApGoodScoresPercentPerStudent) #that's just screwy
qplot(x=ProficientInReadingAndMath, xlab="% Proficient in Reading and Math"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="ProficientInReadingAndMath-Scatter.png", scale=0.5)

qqplot(x=schools$ProficientInReading, y=schools$ApGoodScoresPercentPerStudent) #that's just screwy
qplot(x=ProficientInReading, xlab="% Proficient in Reading"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="ProficientInReading-Scatter.png", scale=0.5)

qqplot(x=schools$ProficientInMath, y=schools$ApGoodScoresPercentPerStudent) #that's just screwy
qplot(x=ProficientInMath, xlab="% Proficient in Math"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="ProficientInMath-Scatter.png", scale=0.5)




#Demographic info
qqplot(x=schools$MedianIncome, y=schools$ApGoodScoresPercentPerStudent) #Kinda skewed
qplot(x=MedianIncome, xlab="Median Income"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="MedianIncome-Scatter.png", scale=0.5)

qqplot(x=schools$CostOfLivingIndex, y=schools$ApGoodScoresPercentPerStudent) #inverse curve
qplot(x=CostOfLivingIndex, xlab="Cost of Living (Index)"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="CostOfLivingIndex-Scatter.png", scale=0.5)

qqplot(x=schools$WalkScore, y=schools$ApGoodScoresPercentPerStudent) #Skew
qplot(x=WalkScore, xlab="Neighborhood Walk Score"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="WalkScore-Scatter.png", scale=0.5)

qqplot(x=schools$Population, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=Population, xlab="Population"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="Population-Scatter.png", scale=0.5)

qqplot(x=schools$MaleToFemaleRatio, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=MaleToFemaleRatio, xlab="Male-to-Female ratio"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="MaleToFemaleRatio-Scatter.png", scale=0.5)

qqplot(x=schools$MedianHousePrice, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=MedianHousePrice, xlab="Median House Price"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="MedianHousePrice-Scatter.png", scale=0.5)

qqplot(x=schools$AverageRentPrice, y=schools$ApGoodScoresPercentPerStudent) #
qplot(x=AverageRentPrice, xlab="Average Rent ($)"    ,xlim=c(500,2550)  ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="AverageRentPrice-Scatter.png", scale=0.5)

qqplot(x=schools$MedianMortgageToIncomeRatio, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=MedianMortgageToIncomeRatio, xlab="Median mortgage-to-income ratio"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="MedianMortgageToIncomeRatio-Scatter.png", scale=0.5)

qqplot(x=schools$MarriedPercent, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=MarriedPercent, xlab="% of Population that is Married"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="MarriedPercent-Scatter.png", scale=0.5)

qqplot(x=schools$DivorcedPercent, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=DivorcedPercent, xlab="% of Population is that Divorced"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="DivorcedPercent-Scatter.png", scale=0.5)

qqplot(x=schools$SinglePercent, y=schools$ApGoodScoresPercentPerStudent) #not much of a relationship
qplot(x=SinglePercent, xlab="% of Population that is Single"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="SinglePercent-Scatter.png", scale=0.5)

qqplot(x=schools$LivedInSameHomeForOver5Years, y=schools$ApGoodScoresPercentPerStudent) #a little screwy
qplot(x=LivedInSameHomeForOver5Years, xlab="% of Population that hasn't moved in 5 years"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %") #bell curve?
ggsave(filename="LivedInSameHomeForOver5Years-Scatter.png", scale=0.5)

qqplot(x=schools$PeoplePerSquareMile, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=PeoplePerSquareMile, xlab="People per Square Mile"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %", alpha=I(2/3))
ggsave(filename="PeoplePerSquareMile-Scatter.png", scale=0.5)

qqplot(x=schools$HousingPerSquareMile, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=HousingPerSquareMile, xlab="Houses per Square Mile"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %", alpha=I(1/2))
ggsave(filename="HousingPerSquareMile-Scatter.png", scale=0.5)

qqplot(x=schools$PercentWaterInZipCode, y=schools$ApGoodScoresPercentPerStudent) #skew high
qplot(x=PercentWaterInZipCode*100, xlab=""      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %", alpha=I(1/2))
ggsave(filename="PercentWaterInZipCode-Scatter.png", scale=0.5)

qqplot(x=schools$ChildrenInPovertyPercent, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=ChildrenInPovertyPercent, xlab="% of Children in Poverty"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="ChildrenInPovertyPercent-Scatter.png", scale=0.5)

qqplot(x=schools$PoorPercent, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=PoorPercent, xlab="% of People in Poverty"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="PoorPercent-Scatter.png", scale=0.5)

qqplot(x=schools$Burglary, y=schools$ApGoodScoresPercentPerStudent) #just looks like bad data
qplot(x=Burglary, xlab="Burglary"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
#ggsave(filename="Burglary-Scatter.png", scale=0.5)

qqplot(x=schools$CarTheft, y=schools$ApGoodScoresPercentPerStudent)
qplot(x=CarTheft, xlab="Car Theft"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
#ggsave(filename="-Scatter.png", scale=0.5)



#PARENTS' INFO
qqplot(x=schools$GraduateOrHigher, y=schools$ApGoodScoresPercentPerStudent) #very linear
qplot(x=GraduateOrHigher, xlab="% of Neighborhood w/ a Graduate Degree or Higher"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="GraduateOrHigher-Scatter.png", scale=0.5)

qqplot(x=schools$BachelorsOrHigher, y=schools$ApGoodScoresPercentPerStudent) #also linear
qplot(x=BachelorsOrHigher, xlab="% of Neighborhood w/ a Bachelor's Degree or Higher"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="BachelorsOrHigher-Scatter.png", scale=0.5)

qqplot(x=schools$UnderHighSchool, y=schools$ApGoodScoresPercentPerStudent) #quite linear
qplot(x=UnderHighSchool, xlab="% of Neighborhood that didn't finish High School"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %")
ggsave(filename="UnderHighSchool-Scatter.png", scale=0.5)

qqplot(x=schools$SomeCollegeOrHigher, y=schools$ApGoodScoresPercentPerStudent) #exponential
qplot(x=SomeCollegeOrHigher, xlab="% of Neighborhood that finished some college"      ,data=schools, y=ApGoodScoresPercentPerStudent*100, ylab="High Achiever %", alpha=I(2/3))
ggsave(filename="SomeCollegeOrHigher-Scatter.png", scale=0.5)



theme_minimal <- theme(
  panel.background = element_rect(fill="white"),
  axis.ticks = element_line(colour=NA),
  panel.grid = element_line(colour="white")
)


density.g <- density(schools$GraduateOrHigher)
as.data.frame(x=cbind(density.g$x, density.g$y))
p <- ggplot()
+geom_point(mapping=aes(), data=, )
+geom_point(mapping=aes(), data=, )
+labs(x="", y="", title="")
+theme_minimal
plot(p)