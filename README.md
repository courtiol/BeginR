# BeginR

This is the repository for the R package BeginR. This R package is primarily aimed at the students of an introductory course about R I will start giving in a few months in Berlin. It is work in progress so no need for anyone else than Colin or I to have a look at it for now.

## For students

### Installation

1. install the R package ```drat``` (only if you don't have it):

```{r, eval = FALSE}
install.packages("drat")
```

2. install the R package BeginR:

```{r, eval = FALSE}
drat::addRepo("courtiol")
install.packages("BeginR")
```

### Usage

To load the package and access to the vignettes:

```{r, eval = FALSE}
library("BeginR")
browseVignettes(package = "BeginR")  ## access vignettes as pdf
```

## For developers only

1. edit the *.Rnw files directly in sources_vignettes
2. knit the *.Rnw (that should creates a pdf in the same folder)
3. open a terminal at the root of the package
4. run ```make build``` to create the *.tar.gz and ```make install``` to install

Optional:

* run ```make clean``` to clean-up
* run ```make check``` to check the package properly
