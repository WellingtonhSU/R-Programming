
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  # Copy the line below to make a select box 

  
  
  # Show a plot of the generated distribution
  mainPanel(
    h2("Total incidence of terrorism worldwide"),
    p("The use of terrorism to further a political cause has accelerated in recent years."),
    p("Modern terrorism largely came into being after the Second World War with the rise of nationalist movements in the old empires of the European powers. These early anti-colonial movements recognised the ability of terrorism to both generate publicity for the cause and influence global policy."),
    plotOutput("data_world"),
    
    
    h2("Total Death/Wound of terrorism by Country"),
    column(10, 
           textInput("text", label = h3("Enter Country"), 
                     value = ""),
           submitButton("Submit")),
    
    plotOutput("country_t")
  )
))

