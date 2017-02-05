library(plyr)
library(gclus)
library(lattice)

rm(list=ls(all=TRUE))

data = read.csv("analysis_main.csv")

#Merge columns of similar category
data$Abortion.Related = NULL
data$Government..Diplomatic. = data$Government..Diplomatic.+data$Government..General.
data$Government..General. = NULL
data$Military = data$Maritime + data$Military
data$Maritime = NULL
data$Telecommunication = NULL
data$Food.or.Water.Supply = NULL

data = data[2:21]

#Mean normalization

for( i in 2:length(data[1,]))
{
  data[,i] = (data[,i] - mean(data[,i])) / sd(data[,i])
}

plot(data[,2:10])


data    <- abs(cor(data[,-1]))
my.colors  <- dmat.color(data)
my.ordered <- order.single(cor(data[,-1]))
cpairs(data, my.ordered, panel.colors=my.colors, gap=0.5)



#Perform Principle Component Analysis
pca1 = princomp(data[2:20], scores = TRUE, center=TRUE)
summary(pca1)
pca1$sdev^2

#plot(pca1, main="Scree Plot")
#plot(pca1, main="Scree Plot", type="line")
#biplot(pca1, main="Biplot", cex=0.5)
abline(0,0,col="blue")
abline(0,90,col="green")

slope1 = pca1$loadings[1,1]/pca1$loadings[2,1]
abline(0,slope1,col="red")


#write.csv(pca1$loadings,"loadings.csv",na="1")
#write.csv(pca1$scores,"scores.csv",na="1")

