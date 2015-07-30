#' Statistics app: Density plots and how they smooth data
#' 
#' An applet which lets the user manipulate the bandwidth of a density plot and
#' apply different transformations to examine how density plots reflect
#' smoothed data.
#' 
#' The user may specify the bandwidth (amount of smoothing) on density plot
#' using the bandwidth slider. Transformations may be performed on the data
#' using the transformation picker. These transformations include log, square
#' root, rank, and inverse cosine. If data is null, three more options are
#' available from the manipulate box. The distribution picker allows the user
#' to choose the type of distribution for random data to be created from. The
#' random seed slider picks the random seed. Number of points chooses the
#' number of points to be generated as data.
#' 
# Known bugs: Some transformations return NaNs and display an error in the
# console. The density plot does not plot those which are NaNs.
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com})
#' , Daniel Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords statistics
#' @examples
#' densityApp() #if you do not want to display the code
#' densityApp(display = "showcase") #if you want to display the code

#' @export
densityApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","density",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
