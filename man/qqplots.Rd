% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qqplots.R
\name{qqplots}
\alias{qqplots}
\alias{qqnorm}
\alias{qqplot}
\alias{qqline}
\title{Quantile-Quantile Plots}
\usage{
qqnorm(y, ylim, main = "Normal Q-Q Plot", xlab = "Theoretical Quantiles",
  ylab = "Sample Quantiles", datax = FALSE)

qqplot(x, y, xlab = deparse(substitute(x)), ylab = deparse(substitute(y)),
  main = "Q-Q Plot")

qqline(y, datax = FALSE, distribution = qnorm, probs = c(0.25, 0.75),
  qtype = 7, ...)
}
\arguments{
\item{y, }{The second or only data sample.}

\item{ylim, ..., }{Graphical parameters.}

\item{main, xlab, ylab, }{Plot labels. The xlab and ylab refer to the y and x axes
respectively if datax = TRUE.}

\item{datax, }{Logical. Should data values be on the x-axis ?}

\item{x, }{The first sample for \code{qqplot}.}

\item{distribution}{quantile function for reference theoretical distribution.}

\item{probs}{numeric vector of length two, representing probabilities.
Corresponding quantile pairs define the line drawn.}

\item{qtype}{the type of quantile computation used in \link{quantile}.}
}
\description{
This is a re-write of the QQ-plotting functions provided by \code{stats}, using the
\code{ggplot2} library.
\code{qqnorm} is a generic function the default method of which produces a normal
QQ plot of the values in y. \code{qqline} adds a line to a “theoretical”, by default normal,
quantile-quantile plot which passes through the \code{probs} quantiles, by default the
first and third quartiles. \code{qqplot} produces a QQ plot of two datasets.
}
\note{
Help file is mainly from \code{stats::qqnorm} since this is a rewrite of \code{stats::qqplot},
\code{stats::qqline} and \code{stats::qqnorm} using the ggplot2 library.
}
\examples{
library(mgcViz)
y <- rt(500, df = 5)

# Compare new and old version of qqnorm
stats::qqnorm(y)
qqnorm(y)

# Compare new and old version of qqplot
x <- rt(200, df = 5)
y <- rt(300, df = 5)
stats::qqplot(x, y)
qqplot(x, y)
# add a qqline()
ggplot2::last_plot() + qqline(y = rt(500, df = 4.8), col = "green") 

## "QQ-Chisquare" : --------------------------
y <- rchisq(500, df = 3)
## Q-Q plot for Chi^2 data against true theoretical distribution:
x <- qchisq(ppoints(500), df = 3)
stats::qqplot(qchisq(ppoints(500), df = 3), rchisq(500, df = 3),
      main = expression("Q-Q plot for" ~~ {chi^2}[nu == 3]))
qqplot(qchisq(ppoints(500), df = 3), rchisq(500, df = 3),
      main = expression("Q-Q plot for" ~~ {chi^2}[nu == 3])) + theme_bw()
}
