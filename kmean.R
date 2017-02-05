rm(list=ls(all=TRUE))

library('stats')
library('fpc')

data = read.csv("globalterrorismdb95-15.csv")
data$nkill = round(data$nkill)
data$nwound = round(data$nwound)
input = data.frame()
country_kcount = aggregate(nkill~country, data, sum)
country_icount = aggregate(nkill~country, data, length)
colnames(country_icount) = c("country","incidence")

input <- cbind(c(1:nrow(country_icount)), country_icount)
colnames(input) = c("no", "country", "incident")

K = 4
X = input[,c(1,3)]

#Mean normalization and feature scaling
for( i in 1:length(X[1,]))
{
  X[,i] = (X[,i] - mean(X[,i])) / sd(X[,i])
}


centers = rbind(c(0, 0),c(0,0.05),c(0,3),c(0,5))
result = kmeans(X, centers, algorithm = "MacQueen")
#print(result$centers)

mat = data.frame()
mat = cbind(X, result$cluster)
colr = c("gold","dodgerblue","seagreen1","red")
style = c(21:25)
for( i in 1:K)
{
  id = which(mat$result==i)
  plot(X$no[id], X$incident[id], col=colr[i], bg = colr[i], pch = style[i], lwd=0.5,
       xlim=c(-1.8,1.8),
       ylim=c(-0.1,10))
  par(new=T)
}
plot(centers, pch = 4)




