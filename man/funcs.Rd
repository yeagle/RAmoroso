\name{functions}
\alias{damoroso}
\alias{damoroso_r}
\title{Amoroso distribution functions}
\description{
\code{damoroso} computes the density of the Amoroso function.
\code{damoroso_r} computes the density of the Amoroso function with R based
code.
}
\usage{
damoroso(x, a, theta, alpha, beta)
}
\arguments{
\item{x}{vector of quantiles.}
\item{a}{a parameter.}
\item{theta}{theta parameter.}
\item{alpha}{alpha parameter.}
\item{beta}{beta parameter.}
}
\examples{
# compare r and c function
x <- seq(0, 3, by=.01)
data <- damoroso(x, a=0, theta=1, alpha=1, beta=5)
data_r <- damoroso_r(x, a=0, theta=1, alpha=1, beta=5)

x11()
plot(density(data_r), xlim=c(0,3), main='R function')
x11()
plot(density(data), xlim=c(0,3), main='C function')
}
\keyword{damoroso}
\keyword{damoroso_r}

\references{
Crooks, G. E. (2010). The amoroso distribution. arXiv preprint.
}
