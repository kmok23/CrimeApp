library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("SF Crime"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select a crime to examine."),
            
            uiOutput("crimeSelect"),
            
            radioButtons("time", label = "View by",
                         choices = list("Month", "Year"))
        ),
        
        mainPanel(
            plotOutput("plot")
        )
    )
))