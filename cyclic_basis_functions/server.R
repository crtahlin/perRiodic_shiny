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
  
  #############################################################################
  # define / generate parameters ####
  x_values <- reactive({
    result <- seq(input$minimum, input$maximum, length.out = 1000)
    return(result)
  }) 
  
  knot_locations <- reactive({
    result <- rcspline.eval(x_values(), nk = input$n_knots, knots.only = TRUE)
    return(result)
  })
  
  #############################################################################
  # construct basis vectors ####
  rcs.basis <- reactive({
    # browser()
    result <- rcspline.eval(x_values(), nk = input$n_knots)
    # summary(result)
    # str(result)
    # class(result)
    # result2 <- rcs(x_values(), nk = input$n_knots)
    # class(result2)
    # str(result2)
    # summary.rms(result2)
    # specs(result2)
    return(result)
  })
  
  cs.basis <- reactive({
    browser()
    rcs(x_values(), nk = input$n_knots)
    result <- rcspline.restate(knot_locations(), rcs.basis())
    return(result)
  })
  
  rcs.per.basis <- reactive({
    result <- rcs.per(x_values(), nk = input$n_knots)
    return(result)
  })
  
  cs.per.basis <- reactive({
  result <- cs.per(x_values(), nk = input$n_knots)
  })
  
  ##############################################################################
  # output plots ####
  output$rcs_basis_plot <- renderPlot({
    matplot(x_values(), rcs.basis(), pch=1, xlab="x", ylab="Basis function", main="RCS")
    abline(v=knot_locations(), lty=2)
  })
  
  # output$cs_basis_plot <- renderPlot({
  #   matplot(x_values(), cs.basis(), pch=1, xlab="x", ylab="Basis function", main="CS")
  #   abline(v=knot_locations(), lty=2)
  # })
  
  output$rcs.per_basis_plot <- renderPlot({
    matplot(x_values(), rcs.per.basis(), pch=1, xlab="x", ylab="Basis function", main="RCS.PER")
    abline(v=knot_locations(), lty=2)
  })
  
  output$cs.per_basis_plot <- renderPlot({
    matplot(x_values(), cs.per.basis(), pch=1, xlab="x", ylab="Basis function", main="CS.PER")
    abline(v=knot_locations(), lty=2)
  })
  
})
