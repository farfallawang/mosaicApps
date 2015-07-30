library(shiny)


maxeffect <<- 10
resid <- 10

shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Hypothesis Test",
           
           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("hypTest-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    radioButtons("t_or_f", label = h5("Type of Distribution"),
                                 choices = list("Show the T distribution" = 1, 
                                                "Show the F distribution" = 2),
                                 selected = 1),
                    
                    conditionalPanel(
                      condition = "input.t_or_f == 1",
                      sliderInput("effect", label = h5("Effect Size (coef.)"),
                                  min = -maxeffect, max = maxeffect, step = .1, value = -1)
                    ),                
                    
                    conditionalPanel(
                      condition = "input.t_or_f == 2",
                      sliderInput("effect", label = h5("Effect Size (R^2)"),
                                  min = 0, max = .99, step = .01, value = .2)
                    ),
                    
                    
                    sliderInput("n", label = h5("n-m (resid d.f.)"),
                                min = 1, max = 100, step = 1, value = 50),
                    
                    conditionalPanel(
                      condition = "input.t_or_f == 2",
                      sliderInput("m", label = h5("m (# of model vectors)"),
                                  min = 1, max = 20, step = 1, value = 3)
                    ),
                    
                    
                    conditionalPanel(
                      condition = "input.t_or_f == 1",
                      sliderInput("resid", label = h5("Residual Size"),
                                  min = 1, max = 100, value = 10)
                    ),   
                    
                    sliderInput("signif", label = h5("Significance"),
                                min = .01, max = .2, step = .01, value = 0.05),
                    
                    conditionalPanel(
                      condition = "input.t_or_f == 1",
                      sliderInput("ang", label = h5("Covariate angle"),
                                  min = -90, max = 90, value = 90)
                    ), 
                    
                    checkboxInput("show.alt", label = "Show Alternative Hyp.", value = FALSE)
                  )
                    
                  ))
           
  )

)

