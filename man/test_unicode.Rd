% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tools.R
\name{test_unicode}
\alias{test_unicode}
\title{Test Unicode characters}
\usage{
test_unicode(start = 9500, end = 9900, ...)
}
\arguments{
\item{start}{The first unicode to draw}

\item{end}{The last unicode to draw}

\item{...}{Additional graphical parameters}
}
\value{
nothing
}
\description{
This function test for the ability of R to draw certain unicode characters.
It was slightly adapted for the function communicated by Ben Bolker for
R-bloggers (\url{https://www.r-bloggers.com/unicode-symbols-in-r/}). If some
unicode characters are missing (shown as squares), you may have to install
the necessary typefaces. If you struggle with unicode characters, you may
consider using the Hershey font system.
}
\examples{
test_unicode()
test_unicode(65, 90)
test_unicode(9900, 10100)
test_unicode(start = "25a0", end = "25ff")
}
\seealso{
?Hershey
}
