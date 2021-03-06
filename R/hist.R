#' Interactive applet to explore histograms
#' 
#' An applet which lets the user manipulate the number of bins and the center
#' break of a histogram corresponding to data given or a random normal
#' distribution.
#' 
#' The user may change the number of bins using the Number of Histogram bins
#' slider, and they may change the center point around which the bins are
#' centered with the center break slider. If data is null, the user may change
#' the random seed with the seed slider. Otherwise the seed slider is not
#' displayed.
#' 
#Known bugs: Due to the way breaks in the histogram are calculated, for very
#small numbers of bins (around less than 4) an error appears on the plot, as
#the breaks don't cover all the data. This may also occur for random seeds
#occasionally.
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) 
#' , Daniel Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords calculus
#' @examples
#' histApp() #if you do not want to display the code
#' histApp(display = "showcase") #if you want to display the code

#' @export
histApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","hist",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
