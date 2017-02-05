rm(list=ls(all=TRUE))


data = read.csv("globalterrorismdb95-15.csv")
data$nkill = round(data$nkill)
data$nwound = round(data$nwound)

target =  c("Abortion Related", "Airports & Aircraft", 
            "Business", "Educational Institution", "Food or Water Supply",
            "Government (Diplomatic)", "Government (General)", 
            "Journalists & Media", "Maritime", "Military", "NGO",
            "Other", "Police", "Private Citizens & Property",
            "Religious Figures/Institutions", "Telecommunication",
            "Terrorists/Non-State Militia", "Tourists", "Transportation",
            "Unknown", "Utilities", "Violent Political Party")


country_casualty = aggregate(nkill+nwound ~ country, data, sum)
country_incidence = aggregate(nkill ~ country, data, length)
temp1 = aggregate(nkill+nwound ~ targtype*country, data, sum)
temp2 = aggregate(nkill ~ targtype*country, data, length)

colnames(country_casualty) = c("country","casualty")
colnames(country_incidence) = c("country","incidence")
colnames(temp1) = c("targtype", "country", "casualty")
colnames(temp2) = c("targtype", "country", "incidence")

analysis = cbind(country_casualty,country_incidence$incidence)
colnames(analysis) = c("country", "casualty","incidence")

analysis = cbind(analysis, setNames( lapply(target, function(x) x=0), target) )


for (i in 1:(nrow(analysis)))
{
  for (j in 1:(nrow(temp1)))
  {
    if (analysis[i,1] == temp1[j,2])
    {
      if (temp1[j,1] == target[1]){
        analysis[i,4] = temp1[j,3]
      }else if (temp1[j,1] == target[2]){
        analysis[i,5]  =temp1[j,3]
      }else if (temp1[j,1] == target[3]){
        analysis[i,6]  =temp1[j,3]
      }else if (temp1[j,1] == target[4]){
        analysis[i,7]  =temp1[j,3]
      }else if (temp1[j,1] == target[5]){
        analysis[i,8]  =temp1[j,3]
      }else if (temp1[j,1] == target[6]){
        analysis[i,9]  =temp1[j,3]
      }else if (temp1[j,1] == target[7]){
        analysis[i,10]  =temp1[j,3]
      }else if (temp1[j,1] == target[8]){
        analysis[i,11]  =temp1[j,3]
      }else if (temp1[j,1] == target[9]){
        analysis[i,12]  =temp1[j,3]
      }else if (temp1[j,1] == target[10]){
        analysis[i,13]  =temp1[j,3]
      }else if (temp1[j,1] == target[11]){
        analysis[i,14]  =temp1[j,3]
      }else if (temp1[j,1] == target[12]){
        analysis[i,15]  =temp1[j,3]
      }else if (temp1[j,1] == target[13]){
        analysis[i,16]  =temp1[j,3]
      }else if (temp1[j,1] == target[14]){
        analysis[i,17]  =temp1[j,3]
      }else if (temp1[j,1] == target[15]){
        analysis[i,18]  =temp1[j,3]
      }else if (temp1[j,1] == target[16]){
        analysis[i,19]  =temp1[j,3]
      }else if (temp1[j,1] == target[17]){
        analysis[i,20]  =temp1[j,3]
      }else if (temp1[j,1] == target[18]){
        analysis[i,21]  =temp1[j,3]
      }else if (temp1[j,1] == target[19]){
        analysis[i,22]  =temp1[j,3]
      }else if (temp1[j,1] == target[20]){
        analysis[i,23]  =temp1[j,3]
      }else if (temp1[j,1] == target[21]){
        analysis[i,24]  =temp1[j,3]
      }else(temp1[j,1] == target[22])
        analysis[i,25]  =temp1[j,3]
    }
  }
}

write.csv(analysis,"analysis_main.csv",na="1")