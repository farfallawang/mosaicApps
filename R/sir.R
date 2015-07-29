#' Interactive applet for exploring the SIR epidemic disease model
#' 
#' Displays a phase portrait of the number of susceptible, infected, and
#' recovered populations against \code{t}
#' 
#' Using the sliders, a user may control the probability of infection, the
#' number of contacts per day, duration of disease decay, the number of the
#' initial population that is infected, and finally the number of births per
#' day. With these parameters, the model can be substantially altered. For
#' example, if the probability of infection is high and contact is high, the
#' disease sweeps through the population quickly. If probability of infection
#' and contact are low, the disease may not infect every member of the
#' population. If there are many babies added per day and a long disease decay,
#' sometimes a recurring epidemic occurs. The model starts with a population of
#' 1000 initially and runs for 100 days.
#' 
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}), Daniel
#' Kaplan (\email{kaplan@@macalester.edu})
#' , Mengdie Wang(\email{mwang3@@macalester.edu})
#' and Jingjing Yang(\email{jyang1@@macalester.edu})
#' @keywords calculus
#' @examples
#' sirApp() #if you do not want to display the code
#' sirApp(display = "showcase") #if you want to display the code

#' @export
sirApp <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","sir",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
