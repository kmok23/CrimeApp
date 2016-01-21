library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("SF Crime"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select a crime to examine."),

            selectInput("crime", label = h3("Crime category"),
                         choices = sort(as.character(unique(trainraw$Category))))
#                         selected = 1),
            
#            textInput("symb", "Symbol", "SPY"),
            
#            dateRangeInput("dates", "Date range", start = "2013-01-01", 
#                           end = as.character(Sys.Date())),
#            verbatimTextOutput("choice")
            
      #checkboxInput("log", "Plot y axis on log scale", 
#        value = FALSE),
#      
#      checkboxInput("adjust", 
#        "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(
        verbatimTextOutput("crime"),
        plotOutput("plot")
    )
  )
))