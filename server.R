#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$plot1 <- renderPlot({
    set.seed(2018-03-04)
    number_of_points <- input$numeric
    minX <- input$slideX[1]
    maxX <- input$slideX[2]
    minY <- input$slideY[1]
    maxY <- input$slideY[2]
    dataX <- runif(number_of_points, minX, maxX)
    dataY <- runif(number_of_points, minY, maxY)
    xlab <- ifelse(input$show_xlab, "X Axis","")
    ylab <- ifelse(input$show_ylab, "Y Axis","")
    main <- ifelse(input$show_title, "Title","")
    plot(dataX,dataY, xlab=xlab, ylab=ylab, main=main,
         xlim=c(-100,100), ylim=c(-100,100))
  })
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    output$text1 = renderText(input$bins)
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
})
