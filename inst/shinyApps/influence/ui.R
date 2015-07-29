shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Interactive applet to explore influential points in linear models"),
  
  tags$h5("Displays data and a menu of modeling functions.  Finds a linear combination
of the selected modeling functions, with the user setting nonlinear
parameters manually."),
  
  sidebarLayout(
    position = "right",
    sidebarPanel(
      selectInput("data", "Please selet a dataset", choices = list("Galton", "KidsFeet", "Heightweight", "SwimRecords","TenMileRace")), 
      textInput("expr", "Please enter the expression for model"),
      selectInput("xpick", "Predictor to plot", choices = list(x = "x", y = "y")),
      checkboxInput("newPoint", "Add new point", value = FALSE),
      sliderInput("multX", "New predictor (measured in SDs)", min = -5, max = 5, value = 1),
      sliderInput("multY", "New response (measured in SDs)", min = -5, max = 5,  value = 1),
      actionButton("plot", label = "Make a plot")
    ),
    
    mainPanel(
      plotOutput("graph")
    )
  )
  
  )

)
