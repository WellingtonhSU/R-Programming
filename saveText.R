rm(list=ls(all=TRUE))
library(XML)
library(bitops)
library(RCurl)
library(NLP)
library(httr)


alldata = read.csv('alldata.csv')
orgURL = 'http://www.appledaily.com.tw'

for( i in 1:length(alldata$X))
{
  pttURL <- paste(orgURL, alldata$path[i], sep='')
  urlExists = url.exists(pttURL)
  
  if(urlExists)
  {
    html = getURL(pttURL, ssl.verifypeer = FALSE, encoding='UTF-8')
    xml = htmlParse(html, encoding='UTF-8')
    text = xpathSApply(xml, "//p [@id='summary']", xmlValue)
    name <- paste('./allText/c', i, '.txt', sep='')
    write(text, name)
  }
}