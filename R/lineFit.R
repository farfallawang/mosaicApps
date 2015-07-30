#' Interactive line-fitting application
#' 
#' An interactive demonstration program for showing how the residuals
#' and the sum of square residuals relates to the slope and intercept of a fitted
#' line.  There are sliders to modify the slope and intercept of the fitted
#' line and checkboxes that control whether to display the residuals (as lines)
#' or the sum of square residuals (as filled boxes).  The numerical value
#' of the sum of square residuals is always shown.  By modifying the slope and intercept,
#' you can see how the sum of square residuals increases compared to the 
#' optimal, least squares value.
#' 
#' @author Daniel Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @examples
#' lineFitApp() #if you do not want to display the code
#' lineFitApp(display = "showcase") #if you want to display the code

#' @export
lineFitApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","lineFit",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}