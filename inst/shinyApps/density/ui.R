library(shiny)


shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Visualizing a Density Plot", 
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("density-explain.md")))
           ),
           
           column(4,
                  wellPanel(      
                    sliderInput("band", label = h4("Choose bandwidth:"),
                                min = 0.01, max = 5, step = 0.01, value = 1),
                    
                    br(),
                    
                    selectInput("trans", label = h4("Choose transformation:"),
                                choices = list("None", "Log", "Sqrt", "Rank", "arcCos")),
                    
                    br(),
                    
                    selectInput("dist", label = h4("Choose distribution:"),
                                choices = list("Normal", "Uniform", "Exponential")),
                    
                    br(),
                    
                    sliderInput("seed", label = h4("Choose random seed"),
                                min = 1, max = 100, step = 1, value = 1),
                    
                    br(),
                    
                    sliderInput("points", label = h4("Choose number of points:"),
                                min = 10, max = 1000, step = 1, value = 100))
           ))
  
))
