#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("basis functions for cyclic functions"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("minimum",
                   "Minimum:",
                   value = 0,
                   min = -365,
                   max = 365,
                   step = 1),
      numericInput("maximum",
                   "Maximum:",
                   value = 1,
                   min = -365,
                   max = 365,
                   step = 1),
      numericInput("n_knots",
                   "Number of knots:",
                   value = 5,
                   min = 3,
                   max = 10,
                   step = 1),
      width = 1
      
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("rcs_basis_plot")
    )
  )
))
