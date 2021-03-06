library(shiny)
 
shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("SIR Model",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("sir-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    sliderInput("probInfect", label = h4("Probability of Infection"),
                                min = 0, max = 1, step = 0.001, value = 0.1),
                    
                    br(),
                    
                    sliderInput("nContact", label = h4("Contacts per day"),
                                min = 0, max = 100, step = 1, value = 10),
                    
                    br(),
                    
                    sliderInput("duration", label = h4("Duration of disease decay"),
                                min = 0.01, max = 1, step = 0.001, value = 0.2),
                    br(),
                    
                    sliderInput("initialI", label = h4("Initial Infected"),
                                min = 1, max = 50, step = 1, value = 1),
                    
                    br(),
                    
                    sliderInput("birth", label = h4("Births/day"),
                                min = 0, max = 20 , step = 1, value = 0)
                  
                  ))
           
  )

))
#     
#     probInfect = slider(0, 1, step=.001, label="Probability of Infection", initial=.1),
#     nContact = slider(0, 100, step=1, label="Contacts per day", initial=10),
#     duration = slider(.01, 1, step=.001, label="Duration of disease decay", initial=.2),
#     initialI = slider(1, 50, step=1, label="Initial Infected", initial=1),
#     births = slider(0, 20, step=1, label="Births/day", initial=0)


