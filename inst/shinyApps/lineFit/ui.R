shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Interactive line-fitting application",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("lineFit-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    selectInput("data", "Please selet a dataset", choices = list("Galton", "KidsFeet", "Heightweight", "SwimRecords","TenMileRace")), 
                    textInput("expr", "Please enter the expression for model"), 
                    sliderInput("inter", "Intercept Offset", min = -3, max = 3, step = .05, value = 0),
                    sliderInput("slope", "Slope Multiplier", min = -1, max = 2, step = .05, value = 1),
                    checkboxInput("resids", "Show Residuals", value = FALSE),
                    checkboxInput("squares", "Square resids", value = FALSE),
                    actionButton("plot", label = "Make a plot")
                    
                  ))
           
  )

))
