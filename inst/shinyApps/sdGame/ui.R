library(shiny)


shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Guessing the Standard Deviation!",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("sdGame-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    sliderInput("sd", label = h4("Guess Standard Deviation"),
                                min = 0.1, max = 5,  step = 0.1, value = 1),
                    
                    br(),
                    
                    radioButtons("dist", label = h4("Red Distribution Type"),
                                 choices = list("Random"=0, "Normal"=1, "Uniform"=2,
                                                "Exponential"=3, "t (2<df<3)"=4,
                                                "t (df=3)"=5, "F" = 6, "Chi Squared" = 7),
                                 selected = 0),
                    
                    br(),
                    
                    checkboxInput("sol", label = "Show Solution", value = FALSE),
                    
                    br(),
                    
                    actionButton("nxt", label = "Get the next distribution")
                  ))
           
  )
))
