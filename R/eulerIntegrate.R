#' Interactive applet to Euler Integrate
#'
# Known bugs: doesn't work with linear function
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) 
#' , Daniel Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords applied math
#' @examples
#' eulerIntegrateApp() #if you do not want to display the code
#' eulerIntegrateApp(display = "showcase") #if you want to display the code

#' @export
eulerIntegrateApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","eulerIntegrate",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
