
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(tanalysis)
library(plotly)

data = read.csv("globalterrorism_05to15.csv")

shinyServer(function(input, output) {

  output$data_world <- renderPlot({
    data_world = aggregate(nkill~year, data, length)
    plot(data_world)
    lines(data_world)
  })
  
  output$country_t <- renderPlot({
    country_t = Calcountry(data, "United Kingdom")
    plot(country_t)
    lines(country_t)
  })

})
