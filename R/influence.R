#' Interactive applet to explore influential points in linear models
#' 
#' Displays data and a menu of modeling functions.  Finds a linear combination
#' of the selected modeling functions, with the user setting nonlinear
#' parameters manually.
#' 
#' The linear model described by the \code{expr} term is found and fitted
#' values are plotted against the data. Using the Dep. variable to plot picker
#' the user may choose which variable to plot on the x axis. The user can add a
#' new point to the data set by checking the Add new point checkbox. Using the
#' x and y sliders below it, the user can change the position of the new point.
#' The sliders' units are standard deviations from the mean. The type of
#' influence picker is currently nonfunctional.
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}), Daniel Kaplan
#' (\email{kaplan@@macalester.edu}), Randall Pruim (\email{rpruim@@calvin.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @examples
#' influenceApp() #if you do not want to display the code
#' influenceApp(display = "showcase") #if you want to display the code

#' @export
influenceApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","influence",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}