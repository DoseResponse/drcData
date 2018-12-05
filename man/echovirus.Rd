\name{echovirus}

\alias{echovirus}

\docType{data}

\title{Infections as response to exposure with \textit{Echovirus 12}}

\description{
  For each of four doses of a pathogen, \textit{Echovirus 12}, the number of exposed and infected human volunteers are reported.
}

\usage{data(echovirus)}

\format{
  A data frame with 4 observations on the following 3 variables.
  \describe{
    \item{\code{dose}}{a numeric vector reporting the dose in plague forming units (pfu)}
    \item{\code{total}}{a numeric vector}
    \item{\code{infected}}{a numeric vector}
  }
}

%\details{}

\source{
   H. Moon, S. B. Kim, J. J. Chen, N. I. George, and R. L. Kodell (2013). Model uncertainty
and model averaging in the estimation of infectious doses for microbial pathogens. Risk
Analysis, \bold{33(2)}:220–231.
}

%\references{}

\examples{
\dontrun{
library(drc)

## Model with ED50 as a parameter
finney71.m1 <- drm(affected/total ~ dose, weights = total,
data = finney71, fct = LL.2(), type = "binomial")

summary(finney71.m1)
plot(finney71.m1, broken = TRUE, bp = 0.1, lwd = 2)

ED(finney71.m1, c(10, 20, 50), interval = "delta", reference = "control")

## Model fitted with 'glm'
#fitl.glm <- glm(cbind(affected, total-affected) ~ log(dose),
#family=binomial(link = logit), data=finney71[finney71$dose != 0, ])
#summary(fitl.glm)  # p-value almost agree for the b parameter
#
#xp <- dose.p(fitl.glm, p=c(0.50, 0.90, 0.95))  # from MASS
#xp.ci <- xp + attr(xp, "SE") %*% matrix(qnorm(1 - 0.05/2)*c(-1,1), nrow=1)
#zp.est <- exp(cbind(xp.ci[,1],xp,xp.ci[,2]))
#dimnames(zp.est)[[2]] <- c("zp.lcl","zp","zp.ucl")
#zp.est  # not far from above results with 'ED'

## Model with log(ED50) as a parameter
finney71.m2 <- drm(affected/total ~ dose, weights = total,
data = finney71, fct = LL2.2(), type = "binomial")

## Confidence intervals based on back-transformation
##  complete agreement with results based on 'glm'
ED(finney71.m2, c(10, 20, 50), interval = "fls", reference = "control")
}
}
\keyword{datasets}
