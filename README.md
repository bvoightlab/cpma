This function tests deviation from the expected exponential behaviour of -log(p) for a set of associations to a SNP.
 
Modelled on suggestions from Chris Wallace/David Clayton, it's a implementation of a method proposed by Ben Voight and Chris Cotsapas 2011, based on previous code written 2009.

Reported in Cotsapas et al, Pervasive sharing of genetic effects in autoimmune disease, PLoS Genetics, 2011. (PMID: 21852963).

This version avoids multiplication which eventually converges to zero for large p value series. 

Instead it transforms to log space and adds.
