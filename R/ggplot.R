#' ggplot app: This is an applet that allows users to explore ggplot
#' 
#' 
#' @author :Daniel Kaplan (\email{kaplan@@macalester.edu}) 
#' ,Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @example 
#' ggplotApp() 
#' ggplotApp(display = "showcase") #if you want to display code
#' 
#' @export
ggplotApp <- function(display = c("normal","showcase")){

  display = match.arg(display)
  appDir <- system.file("ggplotApp",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
