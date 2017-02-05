
rm(list=ls(all=TRUE))

data = read.csv("globalterrorismdb95-15.csv")
data$nkill = round(data$nkill)
data$nwound = round(data$nwound)

#data_country = data.frame()
#safe_incident = data.frame()
#survival = data.frame()

country_event = aggregate(nkill ~ country, data, length)
noinjury = matrix( 0, nrow(country_event), )
country_total = aggregate(nkill+nwound ~ country, data, sum)

analysis = cbind(country_event, noinjury, country_total[,2])
colnames(analysis) = c("country","events","noinjury", "totalC" )

for( i in 1:(nrow(analysis)))
{
    count = 1
    for (j in 1:(nrow(data)))
    {
      if (data[j,5] == analysis[i,1] && data[j,13]+data[j,14] == 0)
      {
        count = count+1
      }
    }
    analysis[i,3] = count
}

plot(analysis[,2],analysis[,3], xlab = "No of events", ylab = "No of events with no casualty")

analysis = cbind(country_event, survival)
colnames(analysis) = c("country","total", "incident")

K = 5
X = analysis[,c(2,3)]

#normalise
for( i in 1:length(X[1,]))
{
  X[,i] = (X[,i] - mean(X[,i])) / sd(X[,i])
}

centers = rbind(c(0,0),c(0.5,0.5), c(1,1), c(3,3),c(12,12))
result = kmeans(X, centers, algorithm = "MacQueen")
#print(result$centers)

mat = data.frame()
mat = cbind(X, result$cluster)
colr = c("gold","dodgerblue","seagreen1","red", "black")
style = c(21:26)
for( i in 1:K)
{
  id = which(mat$result==i)
  plot(X$total[id], X$incident[id], col=colr[i], pch =style[i], lwd=1,
       xlim=c(-0.1,12),
       ylim=c(-0.1,10))
  par(new=T)
}

