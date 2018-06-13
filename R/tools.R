#' Access the vignettes
#'
#' This function allows to access to the vignettes directly in their folder and
#' open the file index.html in the browser.
#'
#' @export
#'
#' @examples
#' get_vignettes()
#'
get_vignettes <- function() {
  ## for installed library
  utils::browseURL(paste0(find.package("BeginR"), "/doc/index.html"))
  utils::browseURL(paste0(find.package("BeginR"), "/doc/"))

  ## for development (index.html not build at development stage so cannot display it)
  utils::browseURL(paste0(find.package("BeginR"), "/inst/doc/"))
  return(invisible(NULL))
}


#' Test Unicode characters
#'
#' This function test for the ability of R to draw certain unicode characters.
#' It was slightly adapted for the function communicated by Ben Bolker for
#' R-bloggers (\url{https://www.r-bloggers.com/unicode-symbols-in-r/}). If some
#' unicode characters are missing (shown as squares), you may have to install
#' the necessary typefaces. If you struggle with unicode characters, you may
#' consider using the Hershey font system.
#'
#' @param start The first unicode to draw
#' @param end The last unicode to draw
#' @param ... Additional graphical parameters
#'
#' @seealso ?Hershey
#'
#' @return nothing
#' @export
#'
#' @examples
#' test_unicode()
#' test_unicode(65, 90)
#' test_unicode(9900, 10100)
#' test_unicode(start = "25a0", end = "25ff")
test_unicode <- function(start = 9500, end = 9900, ...) {
  nstart <- as.hexmode(start)
  nend <- as.hexmode(end)
  r <- nstart:nend
  s <- ceiling(sqrt(length(r)))
  oldpar <- graphics::par(pty = "s")
  graphics::plot(
    c(-1, (s)),
    c(-1, (s)),
    type = "n",
    xlab = "",
    ylab = "",
    xaxs = "i",
    yaxs = "i"
  )
  graphics::grid(s + 1, s + 1, lty = 1)
  for (i in seq(r)) {
    try(graphics::points(i %% s, i %/% s, pch = -1 * r[i], ...))
  }
  graphics::par(oldpar)
  return(invisible(NULL))
}
