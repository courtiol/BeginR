.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "\n The package for the course 'Getting Started with R'",
    "\n by @alexcourtiol (version ", utils::packageDescription("BeginR")$Version, "), is now loaded!",
    "\n To access the slides, just type browseVignettes(package = 'BeginR'),",
    "\n [or get_vignettes() if you also need to see the sources of the vignettes].",
    "\n",
    "\n All sources for this package are available at https://github.com/courtiol/BeginR",
    "\n where you can find more information on how to use this package",
    "\n and where you can also leave comments (under 'Issues').",
    "\n")
  ## preload data from other packages:
  if (requireNamespace(package = "carData", quietly = TRUE)) {
    data(TitanicSurvival, package = "carData")
    }
}
