#' Statistics app: Demonstrates changes in coefficients as model terms are added
#' 
#' An app investigating model bias
#' 
#' The original model is created from the original data set and the model given
#' by \code{expr}. The response variable is taken to be the term on the left
#' side of your original formula. All other terms are considered explanatory,
#' and they are displayed as checkboxes in the manipulate box. By checking
#' these, each term is added to the new model. The old model coefficient is
#' plotted as a dotted line on each number line, and the new confidence
#' interval and coefficient is plotted in red. The user may vary the confidence
#' level and may vary the number of data points resampled to change the
#' placement and size of the confidence intervals. There is also a original
#' data checkbox which disables the n points to sample slider, as original data
#' is used. When original data is checked as well as only the terms in the
#' original model, the confidence intervals should align with the original
#' predictions. There is a random seed slider to set the random seed. By
#' default its initial value is random.
#' 
#' This applet allows users to see that a linear model will be drastically
#' different with different terms in it. A confidence interval is only
#' applicable to its own model or hypothesis test, it is not universally valid.
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) 
#' ,Daniel Kaplan (\email{kaplan@@macalester.edu}) 
#' ,Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @param model_formula A formula describing the model to use as "reality"
#' @param data_table The dataframe used to fit the model.
#' @param display Whether to show the code behind the app.  Default: don't show it.
#' @examples
#' biasApp(wage ~ age + educ, data=CPS85) 
#' biasApp(wage ~ age, data = CPS85, display = "showcase") #if you want to display the code
#' 
#' @export
biasApp <- function(model_formula, data=CPS85, display = c("normal","showcase")){
  data_table <<- data
  # Turn the formula into an editable string and find the response variable
  formula_parts <- as.character(model_formula)
  response_name <<- formula_parts[2]
  formula_as_string <<- paste(model_formula[c(2,3)],collapse=" ~ ")
    
  
  display = match.arg(display)
  appDir <- system.file("shinyApps","bias",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}

