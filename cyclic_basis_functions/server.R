#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(peRiodic)
library(Hmisc)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  x_values <- reactive({
    result <- seq(input$minimum, input$maximum, length.out = 1000)
    return(result)
  }) 
  
  knot_locations <- reactive({
    result <- rcspline.eval(x_values(), nk = input$n_knots, knots.only = TRUE)
    return(result)
  })
  
  rcs.basis <- reactive({
    result <- rcspline.eval(x_values(), nk = input$n_knots)
    return(result)
  })
  
  output$rcs_basis_plot <- renderPlot({
    matplot(x_values(), rcs.basis(), pch=1, xlab="x", ylab="Basis function", main="RCS")
    abline(v=knot_locations(), lty=2)
    
    
  })
  
})
