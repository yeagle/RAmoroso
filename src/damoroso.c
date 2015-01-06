#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>

double density_amoroso(double x, double a, double theta, double alpha, double beta)
{
  double d;
  
  d = 1 / gammafn(alpha) * fabs(beta / theta) * 
      pow(( (x - a) / theta), (alpha * beta - 1)) *
      exp(- pow(((x - a) / theta), beta) );

  return d;
}

double logdensity_amoroso(double x, double a, double theta, double alpha, double beta)
{
  double d;
  
  d = -log(gammafn(alpha)) + log(fabs(beta/theta)) + 
      ((alpha*beta)-1)*log((x-a)/theta) + 
      ( -pow(((x-a)/theta), beta) );


  return d;
}

SEXP  damoroso(SEXP x, SEXP a, SEXP theta, SEXP alpha, SEXP beta, SEXP give_log) {
  double d;
  SEXP value;
    
  if(LOGICAL(give_log)[0]) 
    d = logdensity_amoroso(REAL(x)[0], REAL(a)[0], REAL(theta)[0], REAL(alpha)[0], REAL(beta)[0]);
  else
    d = density_amoroso(REAL(x)[0], REAL(a)[0], REAL(theta)[0], REAL(alpha)[0], REAL(beta)[0]);
    
  PROTECT(value = allocVector(REALSXP, 1));
  REAL(value)[0] = d;
  UNPROTECT(1);
  return value;
}    
