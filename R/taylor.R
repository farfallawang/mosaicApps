#' Interactive Applet to Examine Taylor and Least Squares Approximations
#' 
#' This applet displays a plot of a function, its Taylor series approximation,
#' and a least squres approximation.
#' 
#' @param expr a mathematical expression. See mosaic \code{D}.
#' @param xlim The range of the dependent variable.
#' @param \dots Additional arguments to \code{expr}.
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) 
#' and Daniel Kaplan (\email{kaplan@@macalester.edu}) 
#' and MengdieWang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @examples
#' taylor() #if you do not want to display the code
#' taylor(display = "showcase") #if you want to display the code

#' @export
taylor <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","taylor",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}