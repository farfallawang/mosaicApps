% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/density.R
\name{densityApp}
\alias{densityApp}
\title{Statistics app: Density plots and how they smooth data}
\usage{
densityApp(display = c("normal", "showcase"))
}
\description{
An applet which lets the user manipulate the bandwidth of a density plot and
apply different transformations to examine how density plots reflect
smoothed data.
}
\details{
The user may specify the bandwidth (amount of smoothing) on density plot
using the bandwidth slider. Transformations may be performed on the data
using the transformation picker. These transformations include log, square
root, rank, and inverse cosine. If data is null, three more options are
available from the manipulate box. The distribution picker allows the user
to choose the type of distribution for random data to be created from. The
random seed slider picks the random seed. Number of points chooses the
number of points to be generated as data.
}
\examples{
densityApp() #if you do not want to display the code
densityApp(display = "showcase") #if you want to display the code
}
\author{
Andrew Rich (\email{andrew.joseph.rich@gmail.com})
, Daniel Kaplan (\email{kaplan@macalester.edu})
, Mengdie Wang(\email{mwang3@macalester.edu})
and Jingjing Yang(\email{jyang1@macalester.edu})
}
\keyword{statistics}

