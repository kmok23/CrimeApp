library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("SF Crime"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select a crime to examine."),

            selectInput("crime", label = "Crime category",
                        choices = levels(trainraw$Category)),
            
            radioButtons("time", label = "View by",
                         choices = list("Month", "Year"))
          
#            dateRangeInput("dates", "Date range", start = "2013-01-01", 
#                           end = as.character(Sys.Date())),
#            verbatimTextOutput("choice")
#      
#      checkboxInput("adjust", 
#        "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(
        plotOutput("plot")
    )
  )
))