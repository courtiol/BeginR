### R code from vignette source 'data_day.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: data_day.Rnw:15-19
###################################################
options(width = 60)
library(knitr)
opts_chunk$set("size" = "scriptsize")
library(dplyr)


###################################################
### code chunk number 2: data_day.Rnw:26-28
###################################################
my_factor1 <- factor(c("A", "A", "B", "B", "C"))
my_factor2 <- factor(c("A", "A", "B", "B", "C"), levels = c("C", "B", "A"))


###################################################
### code chunk number 3: data_day.Rnw:35-36
###################################################
my_factor1


###################################################
### code chunk number 4: data_day.Rnw:43-44
###################################################
my_factor2


###################################################
### code chunk number 5: data_day.Rnw:54-57
###################################################
## Using base:
my_factor2 <- factor(my_factor1, levels(my_factor1)[c(3, 2, 1)])
my_factor2


###################################################
### code chunk number 6: data_day.Rnw:70-72
###################################################
my_factor1 <- factor(c("A", "A", "B", "B", "C"))
my_factor2 <- factor(c("A", "A", "A", "A", "D"))


###################################################
### code chunk number 7: data_day.Rnw:79-80
###################################################
my_factor1


###################################################
### code chunk number 8: data_day.Rnw:87-88
###################################################
my_factor2


###################################################
### code chunk number 9: data_day.Rnw:98-103
###################################################
## Using base:
levels(my_factor1)
my_factor2 <- my_factor1
levels(my_factor2) <- c("A", "A", "D") ## in same order!
my_factor2


###################################################
### code chunk number 10: data_day.Rnw:106-109
###################################################
## Using dplyr:
my_factor2 <- recode(my_factor1, A = "A", B = "A", C = "D")
my_factor2


