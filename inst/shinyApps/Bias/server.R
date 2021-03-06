library(shiny)
library(mosaic)
library(mosaicData)
library(lattice)
library(grid)
library(mosaicData)
source("helper.R", local = TRUE)

data1 <<- data_table # get("CPS85")

shinyServer(
  function(input, output, session) {
    
    output$graph <- renderPlot({
  
      expr <- input$expression
      
      checks <- input$checks
      
      num <- input$n
      
      origMod <<- stats::lm(expr, data1) 
      origCoefs <<- coef(origMod)
      
      formula <- as.formula(input$expression) 
      yvar <<- as.character(formula[2])
      
      xvars.mod <<- attr(origMod$terms, "term.labels")   #xvars from original model
      
      xvars.data <<- names(data1)
      xvars.data <<- xvars.data[xvars.data!=yvar]  #all other variables not y in data
      
      args <- list()
      
      args$n <- input$n
      args$seed <- input$seed
      args$signif <- input$signif
      args$use.orig <- input$use.orig
      args$checks <- if (!is.null(input$checks)) input$checks else character(0)
      #ifelse(!is.null(input$checks), input$checks, character(0))
      
      if (is.null(input$checks)) {
        return(NULL)
      } 
      else
      {do.call(myFun, args)}
    })
  })
