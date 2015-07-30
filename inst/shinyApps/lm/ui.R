shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Visualizing a Linear Model",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("lm-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    selectInput("data", "Please selet a dataset", choices = list("Galton", "KidsFeet")),
                    selectInput("var_choices", "These are the variables available to model", choices = list(x = "x", y = "y")),
                    textInput("expr", "Please enter the expression for model"),
                    actionButton("plot", label = "Make a plot")
                  ))
           
  )
))