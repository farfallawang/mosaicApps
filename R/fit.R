#' Interactive applet for term selection and nonlinear parameters for fitting.
#' 
#' Displays data and a menu of modeling functions.  Finds a linear combination
#' of the selected modeling functions, with the user setting nonlinear
#' parameters manually.
#' 
#' This function attempts to fit a linear combination of the selected terms to
#' the data plotted. Terms are selected by clicking the corresponding checkbox.
#' There are sliders only for nonlinear parameters.  Linear coefficients are
#' found automatically.  Only a function of one variable is supported at
#' present. By checking each checkbox, the term is added to the fitted
#' function, and the linear fit of the selected terms is updated. The
#' instructor argument allows an instructor to hide certain terms such that a
#' lesson may be geared towards specific subjects without distraction.
#' \code{mFitSines}, \code{mFitSigmoidal}, and \code{mFitPoly} are premade
#' wrappers that select only the constant, x, and sines and cosines terms, the
#' pnorm terms, and the polynomial terms, respectively.
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) 
#' , Daniel Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords calculus
#' @examples
#' fitApp() #if you do not want to display the code
#' fitApp(display = "showcase") #if you want to display the code

#' @export
fitApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","fit",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
