
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Sample size calculator"),
  helpText("This application computes sample size neded for Student's t-test. The sample size (assumed the same for each sample) is calculated based on the populations parameters and the desired power for the test. You must specify the mean for the two populations, their standard deviation (the same for both) and the desired test power. You can also modify the signification level (0.05 by default) and the number of tails of the test."),

      fluidRow(
        column(4,
               h4("Enter population parameters"),
               p("Enter the mean values for the two populations and the standard deviation.")
               ),
        column(4,
               h4("Enter test parameters"),
               p("Enter desired signification and power levels and tails for test.")
               ),
        column(4,
               h4("Sample size"),
               p("This is the sample size (assumed the same for each sample).")
        )
        ),
      fluidRow(
        column(4,
               numericInput("mean1", 
                            label = "Enter the 1rst mean",
                            value = 0),
               
               numericInput("mean2", 
                            label = "Enter the 2ond mean",
                            value = 0),
               
               numericInput("sd", 
                            label = "Enter the standard deviation",
                            value = 1)
        ),
        column(4,
               numericInput("alpha", 
                           label = "Enter the signification level",
                           value = 0.05),
               
               sliderInput("power", 
                            label = "Enter the desired power",
                            min = 0,
                            max = 1,
                            step = 0.01,
                            value = 0.8),
            
               selectInput("tails", 
                           label = "Tails", 
                           choices = c("one-tailed" = 1, "two-tailed" = 2), 
                           selected = "two-tailed")
        ),
        column(4,
               verbatimTextOutput('nsize')
        )
      ),

    # Show a plot of the generated distribution
    mainPanel()
))
