shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Visualizing a Linear Model"),
  
  tags$h4("..."),
  
  sidebarLayout(position = "right",
                sidebarPanel(
                  selectInput("data", "Please selet a dataset", choices = list("Galton", "KidsFeet")),
                  selectInput("var_choices", "These are the variables available to model", choices = list(x = "x", y = "y")),
                  textInput("expr", "Please enter the expression for model"),
                  actionButton("plot", label = "Make a plot")
                ),
                
                
                mainPanel(
                  plotOutput("graph")
                )
  )
  
  ))
