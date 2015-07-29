#' An interactive app that allows to explore linear model
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}), Daniel Kaplan
#' (\email{kaplan@@macalester.edu}), Randall Pruim (\email{rpruim@@calvin.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @examples
#' lmApp() #if you do not want to display the code
#' lmApp(display = "showcase") #if you want to display the code

#' @export
lmApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","lm",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}