#' Interactive applet to explore power of a hypothesis test
#' 
#' A group activity meant to demonstrate the concept of power of a hypothesis
#' test. When played as a class, students make a sound when they reject the
#' null hypothesis, so that gradually the whole class makes the designated
#' noise as power becomes large.
#' 
#' The histogram represents the random sample data based on n points centered
#' around mu with standard deviation of sigma. The true mean is 5. As mu
#' increases, power increases. As n increases, power increases. As sigma
#' increases, power decreases. The class should use this applet together and
#' move the sliders to designated points together. If a student is able to
#' reject the null hypothesis, they make a sound such as "ribbit". As power
#' increases due to changes to n, mu, and sigma, ribbits increase.
#' 
#' @return A function that allows the user to explore power.
#' @author Andrew Rich (\email{andrew.joseph.rich@@gmail.com}) and Daniel
#' Kaplan (\email{kaplan@@macalester.edu}),
#' Homer White (\email{Homer_White@@georgetowncollege.edu})
#' , MengdieWang(\email{mwang3@@macalester.edu})
#' @keywords statistics
#' @examples
#' power() #if you do not want to display the code
#' power(display = "showcase") #if you want to display the code

#' @export
power <- function(display = c("normal","showcase")){
  display = match.arg(display)
  appDir <- system.file("shinyApps","power",package = "mosaicApps")
  if (appDir == ""){
    stop("Couldn't find example directory. Try reinstalling `mosaicApps`.",
         call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = display)
}
