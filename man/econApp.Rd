% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/econ.R
\name{econApp}
\alias{econApp}
\title{Interactive applet to explore integrals as applied to economics}
\usage{
econApp(display = c("normal", "showcase"))
}
\description{
An applet applying integrals to the economic concepts of supply and demand.
}
\details{
Two splines are created from the sliders. The first points of the spline are
anchored at x=0, y=0 for the supply spline, and x=0, y=50 for the demand
spline. The sliders allow the user to manipulate the y points which
determine the splines at x=10 and x=20. The area between the equilibrium
point and the splines is shaded. In perfect competition, the area above the
supply spline and below the equilibrium point is the producer surplus, and
the area below the demand spline and above the equilibrium point is the
consumer surplus.

Known bugs: If the curves do not intersect as may happen when demand pt. 2
is high and supply pt. 2 is low, there will be an error: Error in
uniroot(func, interval = c(0, 20)) : f() values at end points not of
opposite sign However it's better for the exercise to be more flexible than
less.
}
\examples{
econApp() #if you do not want to display the code
econApp(display = "showcase") #if you want to display the code
}
\author{
Andrew Rich (\email{andrew.joseph.rich@gmail.com})
, Daniel Kaplan (\email{kaplan@macalester.edu})
, Mengdie Wang(\email{mwang3@macalester.edu})
and Jingjing Yang(\email{jyang1@macalester.edu})
}
\keyword{economics}

