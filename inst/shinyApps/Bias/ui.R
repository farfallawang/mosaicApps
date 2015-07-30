library(shiny)
library(mosaicData)

data1 <<- get("CPS85")


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
                             p(
                               "The original model is created from the original data set and the model given by expr. The response variable is taken to be the term on the left side of your original formula. All other terms are considered explanatory, and they are displayed as checkboxes in the manipulate box. By checking these, each term is added to the new model. The old model coefficient is plotted as a dotted line on each number line, and the new confidence interval and coefficient is plotted in red. The user may vary the confidence level and may vary the number of data points resampled to change the placement and size of the confidence intervals. There is also a original data checkbox which disables the n points to sample slider, as original data is used. When original data is checked as well as only the terms in the original model, the confidence intervals should align with the original predictions. There is a random seed slider to set the random seed. By default its initial value is random.
                               This applet allows users to see that a linear model will be drastically different with different terms in it. A confidence interval 
                               is only applicable to its own model or hypothesis test, it is not universally valid.
                               "
                             )))
           ),
           
           column(4,
                  wellPanel(
                    textInput("expression", label = h5("Enter the expression to be plotted"),
                              value = "wage~sex+educ+exper"),
                    
                    sliderInput("n", label = h5("n points to sample"),
                                min = ncol(data1)*3 + 20, max = 5*nrow(data1), step = round( max(1,nrow(data1)/200)), value = nrow(data1)),
                    
                    checkboxGroupInput("checks", label = NULL, choices = names(data1)[names(data1)!="wage"]),
                    
                    sliderInput("seed", label = h5("Random seed"),
                                min = 100, max = 500, step = 1, value = sample(100:500,1)),
                    
                    sliderInput("signif", label = h5("Significance level"),
                                min = .5, max = .99, step = .01, value = 0.95),
                    
                    checkboxInput("use.orig", label = "Use Original Data", value = FALSE)
                    
                  ))
           
  )
  
  
))




