library(shiny)

npts <<- 3000
seed <<- NULL

shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Glass Pattern",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("glassPattern-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    sliderInput("mag", label = h5("Common Magnification"),
                                min = .8, max = 1.2, step = .01, value = 1),
                    
                    sliderInput("dmag", label = h5("Delta Magnification"),
                                min = -.2, max = .2, step = .01, value = 0),
                    
                    sliderInput("rot", label = h5("Rotation (degrees)"),
                                min = -10, max = 10, step = .25, value = 0),
                    
                    sliderInput("xtrans", label = h5("Horizontal Translation"),
                                min = -.1, max = .1, step = .001, value = 0),
                    
                    sliderInput("ytrans", label = h5("Vertical Translation"),
                                min = -.1, max = .1, step = .001, value = 0),
                    
                    sliderInput("dt", label = h5("dt"),
                                min = 0, max = 1, step = .01, value = .5)
                    
                    
                    
                  ))
  )
  
))

