library(shiny)

shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Comparing different approximations",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("taylor-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    textInput("fun", label = h5("Enter the function to be plotted"),
                              value = "sin(x) ~ x"),
                    
                    radioButtons("what", label = h5("What to plot?"),
                                 choices = list("Plot the function",
                                                "Plot the errors")),
                    
                    sliderInput("position", label = h5("Position:"),
                                min = -5, max = 5, step = 0.1, value = 0),
                    
                    numericInput("order", 
                                 label = h5("Order of the polynomial"), value = 0,
                                 min = 0, max = 10, step = 1),  
                    
                    checkboxInput("taylor", label = "Show Taylor Series", value = FALSE),
                    
                    checkboxInput("least", label = "Show Least Squares", value = FALSE),
                    
                    sliderInput("width", label = h5("Least Squares Width:"),
                                min = 0, max = 10, step = 1, value = 5),
                    
                    checkboxInput("error", label = "View error area", value = FALSE)
              ))
           
  )
  
  
))
