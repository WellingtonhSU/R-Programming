rm(list=ls(all=TRUE))
library()

data = read.csv("globalterrorism_05to15.csv")
data_country = data.frame()

  for (i in 1:nrow(data)) {
    if(data[i,4] == "Great Britain")
    {
      data_country = rbind(data_country, data[i,])
    }
  }
  
#data_world = aggregate(nkill~year, data, length)
#country_t = aggregate(nkill ~ year, data_country,sum)
allcountry_t1 = aggregate(cbind(nkill, nwound)~country, data, sum)
allcountry_t2 = aggregate(nkill~country, data, length)
allcountry_t = cbind(allcountry_t1, allcountry_t2[,2])

result = kmeans(allcountry_t[,2:4],3)



