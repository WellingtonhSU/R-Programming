rm(list=ls(all=TRUE))

data = read.csv("globalterrorismdb95-15.csv")
data$nkill = round(data$nkill)
data$nwound = round(data$nwound)

country_kcount = aggregate(nkill ~ country*region, data, sum)
country_wcount = aggregate(nwound ~ country*region, data, sum)
no = matrix( 1, nrow(country_kcount), )

analysis = cbind(country_kcount, country_wcount[,3], no)
colnames(analysis) = c("country","region","nkill", "nwound", "no")

#assign number to different regions
#total number of regions = 12

#number the data by different regions
num = 1
for( i in 2:(nrow(country_kcount)))
{
    if (analysis[i,2] != analysis[i-1,2])
    {
        num = num + 1
    }
    analysis[i,5] = num
}

for (i in 1:(nrow(country_kcount)))
{
  plot(analysis$nkill[i], analysis$nwound[i], col = i, xlim=c(-10,10000),
       ylim=c(-10,10000))
}




#plot(analysis[,3], analysis[,4], pch=16, cex =0.8, col = 1)


centers = rbind(c(0, 0),c(5000,5000),c(20000,20000),c(40000,80000))

#points(centers, pch = 21)

