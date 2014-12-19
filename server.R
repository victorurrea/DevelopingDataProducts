
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  nctr <- reactive({ abs(input$mean1 - input$mean2)/(input$sd * sqrt(2)) })
  sss <-  reactive({ ((qnorm(1 - input$alpha/as.numeric(input$tails)) + qnorm(input$power))/nctr()) })
    n <-  reactive({ round(sss()^2 + 0.5, 0) })

  output$nsize <- renderText(n())

})
