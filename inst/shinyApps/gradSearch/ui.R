library(shiny)

shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Gradient Search",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph", click = "user")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("gradSearch-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    selectInput("ty", "Optimization Type:", 
                                choices = list("Value","Gradient","NewtonAlongGrad",
                                               "NewtonLinearAlgebra")),
                    
                    sliderInput("scale", label = h5("Scale (log2)"),
                                min = -4, max = 8, value = 2),
                    
                    actionButton("cent", label = "Center on Last Point"),
                    
                    actionButton("history", label = "Clear History"),
                    
                    sliderInput("trans", label = h5("Transparency"),
                                min = 0, max = 1, step = .01, value = 0),
                    
                    checkboxInput("contours", label = "Show Contours")
                    
                    
                    
                  ))
  )
))
