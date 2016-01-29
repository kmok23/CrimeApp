# server.R

source("helpers.R")

shinyServer(function(input, output) {
    output$crimeSelect <- renderUI({
        selectInput("crime", label = "Crime category",
                    choices = levels(trainraw$Category))
    })
    
    dataByCrime <- reactive({
        dataSeparate(input$crime)
    })
    
    output$plot <- renderPlot({
        if(is.null(input$crime))
            return()  # Exit if input$crime isn't set, which it won't be at 1st
        plotCrime(dataByCrime(), input$time, input$crime)
    })

})