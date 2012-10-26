library(ggplot2)
library(stats)

survey <- read.csv(file="2012-10-23-Data_Science_Learning_Objectives_clean.csv", header=TRUE, sep="\t")
survey.clean <- survey[,5:13]+2 #change the range of the data from -2 to 2 to a range of 0 to 4
survey.matrix <- as.matrix(survey.clean) #turn the data frame into a matrix
survey.dist <- dist(survey.matrix) #compute the Euclidean distance of the matrix
survey.mds <- cmdscale(survey.dist) #compute the multidimensional scale (mds) of the distance
survey.mds.df <- as.data.frame(survey.mds) #turn that mds back into a data frame for plotting
pq <- qplot(data=survey.mds.df, x=V1, y=V2, main="Students, graphed by preference", xlab="", ylab="") #plot the results real quick, as a sanity check
ggsave(pq, filename="data_science_graph.png")

#Now let's cluster them together.
#We don't know a good number K for k-means. One rule of thumb is the square root (5 or 6).
#But let's go higher, using the elbow rule to check.

#Compute the k-means efficiency (explained variance) for K from 1 through 10
survey.kmeans.efficiency <- c(0)
for (i in 1:10) 
{
  survey.kmeans <- kmeans(x=survey.mds, centers=i)
  survey.kmeans.efficiency <- append(survey.kmeans.efficiency, survey.kmeans$betweenss / survey.kmeans$totss)
}

#Then turn the results into a data frame and plot them.
survey.kmeff.df <- data.frame(survey.kmeans.efficiency, 1:length(survey.kmeans.efficiency) )
names(survey.kmeff.df) <- c("Efficiency","NumberOfClusters")
pq2 <- qplot(data=survey.kmeff.df, x=NumberOfClusters, y=Efficiency, geom="line")
ggsave(pq2, filename="efficiency_vs_clusters.png")
#looks like the best cluster is 5. That's the elbow.

#Now, let's do a nicer plot of the data using k=5.
survey.kmeans <- kmeans(x=survey.mds, centers=5)

theme_clean <- theme(
  panel.background = element_rect(fill="white"),
  axis.ticks = element_line(colour=NA),
  panel.grid = element_line(colour="white"),
  text = element_text(size=14, face="bold"),
  axis.text.y = element_text(colour=NA),
  axis.text.x = element_text(colour=NA)  
)

p <- ggplot(data=survey.mds.df, aes(x=V1, y=V2, color=factor(survey.kmeans$cluster)))+
  geom_point(position="identity", size=4)+
  labs(x="", y="", title="Data Science students, clustered together by interest",color="Group")+
  theme_clean
plot(p)
ggsave(p, filename="data_science_groups.png")

#survey.kmeans$betweenss / survey.kmeans$totss