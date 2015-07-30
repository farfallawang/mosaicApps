library(shiny)
library(mosaicData)

data1 <<- data_table #get("CPS85")


shinyUI(navbarPage(
  "Project Mosaic!",
  
  theme = shinytheme("cerulean"),
  
  tabPanel("Investigating Model Bias",

           column(8, 
                  tabsetPanel(
                    tabPanel("Graphical Output",
                             plotOutput("graph")
                    ),
                    tabPanel("Explanation",
                             includeMarkdown("bias-explain.md")))
           ),
           
           column(4,
                  wellPanel(
                    textInput("expression", label = h5("Enter the expression to be plotted"),
                              value = formula_as_string),
                    
                    sliderInput("n", label = h5("n points to sample"),
                                min = ncol(data1)*3 + 20, max = 5*nrow(data1), step = round( max(1,nrow(data1)/200)), value = nrow(data1)),
                    
                    checkboxGroupInput("checks", label = NULL, choices = names(data1)[names(data1)!=response_name]),
                    
                    sliderInput("seed", label = h5("Random seed"),
                                min = 100, max = 500, step = 1, value = sample(100:500,1)),
                    
                    sliderInput("signif", label = h5("Significance level"),
                                min = .5, max = .99, step = .01, value = 0.95),
                    
                    checkboxInput("use.orig", label = "Use Original Data", value = FALSE)
                    
                  ))
           
  )
  
  
))


