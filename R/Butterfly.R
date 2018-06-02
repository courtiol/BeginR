#' Example of individual based model using R6: the Butterfly example
#'
#' This example is a simple population genetic model programmed using individual based simulation.
#' The inspiration is the example of the Peppered moth textbook story (\url{https://en.wikipedia.org/wiki/Peppered_moth_evolution}).
#'
#' @return Nothing but directly export created R6 object into the Global Environment
#'
#' @export
#'
#' @examples
#' load_butterfly_example()  ## load all the objects
#' simu <- Simulation$new(years = 200, N = 500, mutation_rate = 1e-2, period = 50)  ## intialisation
#' simu$output
#' simu$run() ## run simulations
#' simu$plot() ## plot simulations
#' \dontrun{
#' simu$profile() ## profile the code
#' }
load_butterfly_example <- function() {

  Butterfly <- R6::R6Class(
    class = FALSE,
    public = list(
      ## variables
      colour = NA,
      mutation_rate = NA,
      world = NA,  ## we can pass the address of an R6 object!
      fitness = NA,

      ## constructor
      initialize = function(mutation_rate = 1e-6, world) {
        self$mutation_rate <- mutation_rate
        self$world <- world
        self$colour <- round(stats::runif(1))
      },

      ## function
      mutation = function() {
        if (stats::runif(n = 1) < self$mutation_rate) {
          self$colour <- abs(self$colour - 1)
        }
      },

      computefitness = function() {
        self$fitness <- abs(self$world$colour + self$colour - 1)*0.5 + 0.5
      }
    )
  )

  Population <- R6::R6Class(
    class = FALSE,
    public = list(
      individuals = NA,

      initialize = function(N = 100, mutation_rate = 1e-6, world) {
        self$individuals <- list()
        for (i in 1:N) {
          self$individuals[[i]] <- Butterfly$new(mutation_rate, world)
        }
      },

      computefitness = function() {
        for (i in 1:length(self$individuals)) {
          self$individuals[[i]]$computefitness()
        }
      },

      mutation = function() {
        for (i in 1:length(self$individuals)) {
          self$individuals[[i]]$mutation()
        }
      },

      reproduction = function() {
        N <- length(self$individuals)
        fitnesses <- unlist(lapply(self$individuals, function(ind) ind$fitness))
        id_reproductor <- sample(1:N, size = N, prob = fitnesses, replace = TRUE)
        parents <- self$individuals
        for (i in 1:N) {
          self$individuals[[i]] <- parents[[id_reproductor[i]]]$clone(deep = FALSE)
        }
        },

      generation = function(){
        self$computefitness()
        self$mutation()
        self$reproduction()
      }
    )
  )

  World <- R6::R6Class(
    class = FALSE,
    public = list(
      ## variables
      time = 1,  ## you can define variable directly
      colour = 0,
      period = NA,  ## you can also have variables defined by the constructor

      ## constructor
      initialize = function(period = 100){  ## constructors can have default settings
        self$period <- period  ## pass the argument from the function call to the object
      },

      ## functions
      computecolour = function() { ## function are working directly in the environment of the object
        relative_time <- self$time %% (2*self$period) ## check that, it seems to lead to small initial period sometimes
        if (self$period == Inf) relative_time <- self$time
        self$colour <- as.numeric(relative_time < self$period)
      },

      moveforward = function(){
        self$time <- self$time + 1
        self$computecolour()  ## one function can call another
      }
    )
  )

  Simulation <- R6::R6Class(
    public = list(
      world = NA,
      population = NA,
      years = NA,
      output = NULL,

      initialize = function(years = 10000, N = 100, mutation_rate = 1e-3, period = 100) {
        self$world <- World$new(period)
        self$population <- Population$new(N, mutation_rate, self$world)
        self$output <- data.frame(year = 1:years,
                                  black_frequency = rep(NA, years),
                                  world_dark = rep(NA, years))
        self$years <- years
      },

      run = function(){
        time <- system.time({
          pb <- utils::txtProgressBar(min = 1, max = self$years, style = 3)
          for (t in 1:self$years) {
            black <- unlist(lapply(self$population$individuals, function(ind) ind$colour))
            self$output$black_frequency[t] <- mean(black)
            self$output$world_dark[t] <- self$world$colour
            self$world$moveforward()
            self$population$generation()
            utils::setTxtProgressBar(pb, t)
          }
        })
        cat("\n")
        print(paste("time elapsed = ", round(time[[3]]), "sec"))
      },

      plot = function(){
        graphics::plot(self$output$world_dark, type = "l", ylim = c(0, 1),
             lwd = 2, col = "grey", las = 1, xlab = "Time (years)", ylab = "Frequency of black")
        graphics::points(self$output$black_frequency, type = "l", lwd = 2, col = "blue")
      },

      profile = function(){
        if (requireNamespace("profvis", quietly = TRUE)) {
          profvis::profvis(self$run())
        } else {
          message("Profiling could only be performed if the package profvis is installed.")
        }
      }
    )
  )

  ## below are modifications due to the package structure:
  self <- NULL ## remove warning in R CMD check
  assign("Butterfly", Butterfly, envir = globalenv())
  assign("Population", Population, envir = globalenv())
  assign("World", World, envir = globalenv())
  assign("Simulation", Simulation, envir = globalenv())
  return(NULL)
}


