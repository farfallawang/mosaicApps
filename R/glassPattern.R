#' Interactive applet for demonstrating Glass Pattern
#' 
#' Glass patterns are formed from superimposed random dot patterns: 
#' an original image with a second image which has been generated through a linear or
#' nonlinear transformation of the original.A variety of different spatial patterns 
#' such as circles, spirals, hyperbolae, can be perceived in the superimposed image set, 
#' depending on the nature of the transformation between the two sets of dots. (Cited from Wikipedia)
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) 
#' , Daniel Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords calculus
#' @examples
#' glassPatternApp() #if you do not want to display the code
#' glassPatternApp(display = "showcase") #if you want to display the code

#' @export
glassPatternApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","glassPattern",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}