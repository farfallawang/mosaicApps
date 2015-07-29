#' Interactive Applet to Examine Taylor and Least Squares Approximations
#' 
#' This applet displays a plot of a function, its Taylor series approximation,
#' and a least squres approximation.
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) 
#' , Daniel Kaplan (\email{kaplan@@macalester.edu}) 
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @examples
#' taylorApp() #if you do not want to display the code
#' taylorApp(display = "showcase") #if you want to display the code

#' @export
taylorApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","taylor",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}