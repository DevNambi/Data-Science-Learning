getwd()
setwd("/Users/devnambi/Dropbox/Notes/Hobbies/Used Car For Sheila/")
dir()

cars.df <- read.csv("Preferences.csv")
head(cars.df)
summary(cars.df)
names(cars.df)

cars.df$CombinedScoreAsc <- (1.0 / cars.df$CombinedScore)*10.0
cars.df$PriceToScoreAsc <- (1.0 / cars.df$PriceToScore)*10

lifetime.df <- read.csv("110 - Car Survival Rates.csv")
names(lifetime.df)

lifetime2.df <- read.csv("110 - Car Survival Rates Incremental.csv")
names(lifetime2.df)

library(stats)
library(ggplot2)

qplot(data=lifetime.df, x=Age, y=DeathRate*100.0, color=Make, geom="line", ylab="% Scrapped")
ggsave("death_vs_age_full.png")
ggsave("death_vs_age_half.png", scale=0.5)

qplot(data=lifetime.df, x=Age, y=SurvivalRate*100.0, color=Make, geom="line", ylab="% In Use")
ggsave("life_vs_age_full.png")
ggsave("life_vs_age_half.png", scale=0.5)


qplot(data=lifetime.df, x=Age, y=IncrementalDeathRate*100.0, color=Make, geom="line", ylab="Incremental Death %", xlim=c(10,20))
ggsave("incr_death_vs_age_full.png")
ggsave("incr_death_vs_age_half.png", scale=0.5)

#same graph, but adjusted to see if the data is normal
qplot(data=lifetime.df, x=Age, y=IncrementalDeathRate*100.0, color=Make, geom="line", ylab="Incremental Death %")
qplot(data=lifetime.df, x=IncrementalDeathRate, geom="density", color=Make, ylab="")

qplot(data=lifetime2.df, x=Age, y=X10YearAdjDeathRate*100.0, color=Make, geom="line", ylab="Incremental Death %", xlim=c(10,20))
ggsave("death_vs_age_10_full.png")
ggsave("death_vs_age_10_half.png", scale=0.5)



#look at the cars.df data
qplot(data=cars.df, x=CombinedScoreAsc, geom="histogram", xlab="Quality Score",ylab="Number of Cars",main="Quality")
qplot(data=cars.df, x=CombinedScoreAsc, geom="histogram", xlab="Quality Score",ylab="Number of Cars",main="Quality", fill=Model)
ggsave("quality_histogram_full.png")
ggsave("quality_histogram_half.png", scale=0.5)



qplot(data=cars.df, x=CombinedScoreAsc, y=Price, geom="point", size=PriceToScoreAsc, color=PriceToScoreAsc
      , xlab="Quality Score",ylab="Price",main="Quality vs Price") +
  theme(legend.position = "none") 
ggsave("quality_vs_price_full.png")
ggsave("quality_vs_price_half.png", scale=0.5)

qplot(data=cars.df, x=CombinedScoreAsc, y=Price, geom=c("point","smooth"), method="lm"
      , xlab="Quality Score",ylab="Price",main="Quality vs Price")
ggsave("quality_vs_price_lm_full.png")
ggsave("quality_vs_price_lm_half.png", scale=0.5)

qplot(data=cars.df, x=CombinedScoreAsc, y=Price, color=PriceToScore
      , xlab="Quality Score",ylab="Price",main="Quality vs Price")+theme_bw()
#

qplot(data=cars.df, x=Price, y=PriceToScoreAsc, xlab="Price", ylab="Value Score", main="Price vs Value")
#there are some good deals in the middle. But near the top end the deals go down. 

qplot(data=cars.df, x=CombinedScoreAsc, geom="density", xlab="Quality Score", ylab="", main="Quality Score distribution")
#long tail to the right. 
# Most cars are junk at this quality.

qplot(data=cars.df, x=PriceToScoreAsc, geom="density", xlab="Value Score", ylab="", main="Value Score distribution")
#long tail to the right
#this is looking like more of a normal distribution
#however, there are still some outliers. Those are the great finds.