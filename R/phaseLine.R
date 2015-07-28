#' An interactive app that allows to explore phaseLine
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}), Daniel Kaplan
#' (\email{kaplan@@macalester.edu}), Randall Pruim (\email{rpruim@@calvin.edu})
#' , MengdieWang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords differential equation
#' @examples
#' phaseLine() #if you do not want to display the code
#' phaseLine(display = "showcase") #if you want to display the code

#' @export
phaseLine <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","phaseLine",package = "mosaicApps")
  if (appDir == ""){
    stop("Could find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}