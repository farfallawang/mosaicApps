library(shiny)


shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Visualizing a Histogram",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("hist-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    sliderInput("bins", label = h4("Number of histogram bins"),
                                min = 4, max = 50, step = 1, value = 10),
                    
                    br(),
                    
                    sliderInput("center", label = h4("Center Break"),
                                min = -5, max = 5, step = 0.1, value = 0),
                    
                    br(),
                    
                    sliderInput("seed", label = h4("Random Seed"),
                                min = 1, max = 100, step = 1, value = 1)
           
                  ))       
  )
))
