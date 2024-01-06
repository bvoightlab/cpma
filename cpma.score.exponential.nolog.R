cpma.score.exponential.nolog <- function(pvals,log=T,zero.val=NA) { 
  ## internal function to compute likelihood of exponential distribution at a rate lambda
  int.exp.fn <- function(x,lambda=1,epsilon=0.001) {
    return( exp(-lambda * (x-epsilon)) - exp(-lambda * (x+epsilon)) )
  }
  
  pvals[pvals==0] <- zero.val
  
  borked.ix <- ( is.na(pvals) | is.infinite(pvals) )

  pvals <- pvals[!borked.ix]

  if(log) {
    pvals <- -log(pvals)
  }

  ## return the log likelihood ratio of -log(p) being exponentially
  ## distributed (cf biased exponential). Effectively, test if
  ## exponential decay parameter == 1

  ## this should be chi-sq,df=1
#  abs(-2 * log(prod(int.exp.fn(pvals,1/mean(pvals))) / prod(int.exp.fn(pvals,1)) ))
  p.obs <-  sum(log(int.exp.fn(pvals,1/mean(pvals))))
  p.exp <- sum(log(int.exp.fn(pvals,1)))

  stat <- -2 * (p.obs-p.exp)

  return(abs(stat))
}
