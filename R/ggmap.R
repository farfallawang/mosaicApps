#' ggmap app: Allows users to make simple maps
#' 
#' 
#' @author :Daniel Kaplan (\email{kaplan@@macalester.edu}) 
#' ,Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' 
#' @examples  
#' ggmapApp() 
#' ggmapApp(display = "showcase") #if you want to display code
#' 
#' @export
ggmapApp <- function(display = c("normal","showcase")){
    
    display = match.arg(display)
    appDir <- system.file("ggmapApp",package = "mosaicApps")
    if (appDir == ""){
      stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
           call. = FALSE)
    }
    shiny::runApp(appDir, display.mode = display)
  }
 