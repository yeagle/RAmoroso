# Amoroso distribution function in R by EJ
damoroso_r <- function(x, a, theta, alpha, beta)
{
  d <- 1 / gamma(alpha) * abs(beta / theta) * ( (x - a) / theta) ^ (alpha * beta - 1) *
      exp(- (((x - a) / theta) ^ beta) )
  return(d)
}

# Amoroso distribution function ported to C code
damoroso <- function(x, a, theta, alpha, beta)
{
  d <- vector("double", length=length(x))
  for (i in 1:length(x)) {
    d[i] <- .Call(damoroso_c, x[i], a, theta, alpha, beta)
  }
  return(d)
}
