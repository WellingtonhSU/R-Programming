rm(list=ls(all=TRUE))

library(XML)
library(bitops)
library(RCurl)
library(httr)

orgURL = 'http://www.appledaily.com.tw/realtimenews/section/new/'

startPage = 10
endPage = 20
alldata = data.frame()
for( i in startPage:endPage)
{
  pttURL <- paste(orgURL, i,sep='')
  urlExists = url.exists(pttURL)

  if(urlExists)
  {
      html = getURL(pttURL, ssl.verifypeer = FALSE)     
      xml = htmlParse(html, encoding ='UTF-8')
      
      title = xpathSApply(xml, "// li //h1", xmlValue)
      topic = xpathSApply(xml, "//div[@class='abdominis rlby clearmen'] //h2", xmlValue)
      time = xpathSApply(xml, "//li //time", xmlValue)
      path = xpathSApply(xml, "//div[@class='abdominis rlby clearmen'] //li /a//@href")

      tempdata = data.frame(title, topic, time, path)
      alldata = rbind(alldata, tempdata)  
  }
}

write.csv(alldata, 'alldata.csv')

alltopic = levels(alldata$topic)
res = hist(as.numeric(alldata$topic), nclass=length(alltopic), axes=F, labels=T) 

axis(1, at=1:length(alltopic), labels=alltopic)

