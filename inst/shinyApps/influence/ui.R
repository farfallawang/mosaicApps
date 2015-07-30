shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Exploring influential points in linear models",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("influence-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    selectInput("data", "Please selet a dataset", choices = list("Galton", "KidsFeet", "Heightweight", "SwimRecords","TenMileRace")), 
                    textInput("expr", "Please enter the expression for model"),
                    selectInput("xpick", "Predictor to plot", choices = list(x = "x", y = "y")),
                    checkboxInput("newPoint", "Add new point", value = FALSE),
                    sliderInput("multX", "New predictor (measured in SDs)", min = -5, max = 5, value = 1),
                    sliderInput("multY", "New response (measured in SDs)", min = -5, max = 5,  value = 1),
                    actionButton("plot", label = "Make a plot")
                  ))
           
  )
))
