library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("SF Crime"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select a crime to examine."),
            
            textInput("symb", "Symbol", "SPY"),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2013-01-01", 
        end = as.character(Sys.Date())),
      
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
        value = FALSE),
      
      checkboxInput("adjust", 
        "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(plotOutput("plot"))
  )
))