rm(list=ls(all=TRUE))

data = read.csv("globalterrorismdb_0616dist.csv")
cleanData = data[,c("iyear", "imonth", "iday", "country_txt","region_txt", "city",
                    "latitude","longitude", "attacktype1_txt", "targtype1_txt", 
                    "weaptype1_txt", "nkill","nwound")]
                  
cleanData = cleanData[-(1:58097),]
colnames(cleanData) = c("year", "month", "day", "country","region", "city",
                            "latitude","longitude", "attacktype", "targtype", 
                            "weaptype", "nkill","nwound")

write.csv(cleanData,"globalterrorismdb95-15.csv",na="1")