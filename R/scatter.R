#' Interactive applet to explore scatter plot
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) and Daniel
#' Kaplan (\email{kaplan@@macalester.edu}),
#' , MengdieWang(\email{mwang3@@macalester.edu})
#' @keywords statistics
#' @examples
#' scatter() #if you do not want to display the code
#' scatter(display = "showcase") #if you want to display the code

#' @export
scatter <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","scatter",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
