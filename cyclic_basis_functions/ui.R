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
  titlePanel("Shiny App - Basis Functions for Periodic Functions"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("minimum",
                   "Period start value (min):",
                   value = 0,
                   min = -365,
                   max = 365,
                   step = 1),
      numericInput("maximum",
                   "Period end value (max):",
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
      # numericInput("xlim_min",
      #              "X minimum to plot:",
      #              value = 0,
      #              min = -365,
      #              max = 365,
      #              step = 1),
      # numericInput("xlim_max",
      #              "X maximum to plot:",
      #              value = 1,
      #              min = -365,
      #              max = 365,
      #              step = 1),
      # numericInput("ylim_min",
      #              "Y minimum to plot:",
      #              value = 0,
      #              min = -365,
      #              max = 365,
      #              step = 1),
      # numericInput("ylim_max",
      #              "Y maximum to plot:",
      #              value = 1,
      #              min = -365,
      #              max = 365,
      #              step = 1),
      width = 2
      
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("rcs_basis_plot", brush = "brush_rcs_basis"),
       # plotOutput("cs_basis_plot"),
       plotOutput("rcs_per_basis_plot", brush = "brush_rcs_per_basis"),
       plotOutput("cs_per_basis_plot", brush = "brush_cs_per_basis")
    )
  )
))
