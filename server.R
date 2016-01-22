# server.R

source("helpers.R")

shinyServer(function(input, output) {
    dataByCrime <- reactive({
        dataSeparate(input$crime)
    })
    
    output$plot <- renderPlot({ 
        plotCrime(dataByCrime(), input$time, input$crime)
    })

})