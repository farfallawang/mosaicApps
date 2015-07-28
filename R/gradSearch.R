#' Interactive applet for finding local extrema
#'
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) and Daniel
#' Kaplan (\email{kaplan@@macalester.edu})
#' , MengdieWang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords calculus
#' @examples
#' gradSearch() #if you do not want to display the code
#' gradSearch(display = "showcase") #if you want to display the code

#' @export
gradSearch <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","gradSearch",package = "mosaicApps")
  if (appDir == ""){
    stop("Could find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
