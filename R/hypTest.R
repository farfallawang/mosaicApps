#' Interactive display for hypothesis testing concepts.
#' 
#' Displays a sampling distribution and calculates power.
#' 
#' Allows the user to set various parameters that govern the sampling
#' distribution, and the significance, then calculates the power.  Displays all
#' this graphically.
#' 
#' @author Daniel Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @examples
#' hypTestApp() #if you do not want to display the code
#' hypTestApp(display = "showcase") #if you want to display the code

#' @export
hypTestApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","hypTest",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}