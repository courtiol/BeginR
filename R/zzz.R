.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "\n ##########################################",
    "\n #                                        #",
    "\n #   This is the package for the course   #",
    "\n #                                        #",
    "\n #        'Getting Started with R'        #",
    "\n #                                        #",
    "\n #      Version ", utils::packageDescription("BeginR")$Version," installed      #",
    "\n #                                        #",
    "\n #     To access the slides, just type    #",
    "\n #                                        #",
    "\n #   browseVignettes(package = 'BeginR')  #",
    "\n #                                        #",
    "\n ##########################################", "\n")
}
