library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("SF Crime"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("This app graphs the historical occurrences of crimes in
                     San Francisco by category. Please select a crime category
                     to graph."),
            
            uiOutput("crimeSelect"),
            
            helpText("Please select a time interval to graph the occurrences 
                     by."),
            
            radioButtons("time", label = "View by",
                         choices = list("Month", "Year"))
        ),
        
        mainPanel(
            plotOutput("plot")
        )
    )
))