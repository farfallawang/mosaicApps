#' An interactive app that allows to explore phaseLine
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}), Daniel Kaplan
#' (\email{kaplan@@macalester.edu}), Randall Pruim (\email{rpruim@@calvin.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords differential equation
#' @examples
#' phaseLineApp() #if you do not want to display the code
#' phaseLineApp(display = "showcase") #if you want to display the code

#' @export
phaseLineApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","phaseLine",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}