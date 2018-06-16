#' The population census for England and Wales (1901-2016)
#'
#' This dataset contains the total population count (per age classes) for England and Wales over the period 1901-2016.
#'
#' @name population_UK
#' @docType data
#' @format A \var{dataframe} with 1392 obs. of 4 variables.
#' @source These data were derived files freely available from the Office for National Statistics (\url{http://webarchive.nationalarchives.gov.uk}).
#' @keywords datasets
#' @note These data have been prepared for use in the paper "The transition to modernity and chronic disease: mismatch and natural selection" by Stephen Corbett, Alexandre Courtiol, Virpi Lummaa, Jacob Moorad & Stephen Stearns published in Nature Reviews Genetics (2018): \url{https://www.nature.com/articles/s41576-018-0012-3}.
#' @examples
#' head(population_UK)
NULL


#' The deaths census for England and Wales (1901-2016)
#'
#' This dataset contains numbers and causes of death for England and Wales over the period 1901-2016.
#' The causes of deaths have been classified using the International Classification of Diseases (ICD).
#'
#' @name deaths_UK
#' @docType data
#' @format A \var{dataframe} 1445659 obs. of 8 variables.
#' @source These data were derived files freely available from the Office for National Statistics (\url{http://webarchive.nationalarchives.gov.uk}).
#' @keywords datasets
#' @note These data have been prepared for use in the paper "The transition to modernity and chronic disease: mismatch and natural selection" by Stephen Corbett, Alexandre Courtiol, Virpi Lummaa, Jacob Moorad & Stephen Stearns published in Nature Reviews Genetics (2018): \url{https://www.nature.com/articles/s41576-018-0012-3}.
#' @examples
#' head(deaths_UK)
NULL

#' Sample from the Ten-Year Follow-up (1980) of the 1970 British Cohort Study
#'
#' This dataset is a sample of few variables taken from the Ten-Year Follow-up
#' (1980) of the 1970 British Cohort Study (BSC70).
#'
#' The BCS70 began in 1970 when data were collected about the 17,198 babies born
#' in England, Scotland, Wales and Northern Ireland in the week 5-11 April.
#'
#' At this time, the study was named the British Births Survey (BBS) and it was
#' sponsored by the National Birthday Trust Fund, in association with the Royal
#' College of Obstetricians and Gynecologists.
#'
#' Since 1970, there have been four attempts to gather information from the full
#' cohort - when they were aged 5, 10, 16 and 26 years. 90% of the 1970 Cohort
#' were traced and completed one or more survey documents.
#'
#' In 1975 and 1980, the cohort was augmented by the inclusion of immigrants to
#' Britain who were born in the target week in 1970. Subjects from Northern
#' Ireland who had been included in the birth survey, were dropped from the
#' study in all subsequent sweeps.
#'
#' The BCS70 Ten-year Follow-up is the second full national follow-up of the
#' 1970 cohort born in Great Britain 5-11 April 1970. The cohort has been
#' surveyed comprehensively at birth, five, ten, 16 and 26 years, and samples
#' were seen at 22 months, 42 months, seven and 21 years. The BCS70 Ten-year
#' Follow-up was originally titled the Child Health and Education Study (CHES),
#' but in 1991 the whole 1970 Cohort Study was renamed the British Cohort Study
#' 1970 (BCS70) and the ten-year sweep became known as BCS70 Ten-year Follow-up.
#'
#' @format A data frame with 14875 rows and 19 variables:
#' \describe{
#'   \item{sex}{Child's sex}
#'   \item{age}{Child's age in days}
#'   \item{weight}{Child's weight in Kg}
#'   \item{height}{Child's height in cm}
#'   \item{glasses}{Whether the child is wearing glasses}
#'   \item{cigarettes_mum}{No. of cigarettes mum smokes daily}
#'   \item{cigarettes_dad}{No. of cigarettes dad smokes daily}
#'   \item{cigarettes}{No. of cigarettes parents smoke daily}
#'   \item{cigarettes_kid}{Information of the child smoking habits}
#'   \item{cigarettes_friends}{Information on child's friends who smoke}
#'   \item{bronchitis}{Whether the child ever had bronchitis}
#'   \item{drink}{Did mother drink during pregnancy, early}
#'   \item{milk}{Glasses of milk drank per day}
#'   \item{coca}{Glasses of coca-cola or pepsi drank per day}
#'   \item{backward}{Number of steps the child makes before making an error when asked to walk backwards for 20 steps}
#'   \item{mother_height}{Mother's height in cm}
#'   \item{father_height}{Father's height in cm}
#'   \item{mother_weight}{Mother's weight in Kg}
#'   \item{father_weight}{Father's weight in Kg}
#' }
#' @source Study number 3723 from the BCS70: \url{https://discover.ukdataservice.ac.uk/series/?sn=200001}
NULL


#' Sample from the Health Survey for England Cardiovascular Disease’98
#'
#' This dataset is a sample of few variables taken from the Health Survey for
#' England Cardiovascular Disease’98. This dataset is restricted to females.
#'
#' @format A data frame with 4 variables:
#' \describe{
#'   \item{period}{Whether still having periods}
#'   \item{age}{Age last birthday}
#'   \item{smoked}{Whether ever smoked cigarettes}
#'   \item{drunkLast3M}{Whether slightly (or very) drunk in the last three months}
#'   \item{drinkPb}{Number of drinking problems experienced}
#'   \item{education}{Age finished education}
#'   \item{bmi}{Valid BMI}
#' }
#'
#' @source UK Data Archive Study Number 4150
NULL

#' The Gryphon dataset
#'
#' This dataset contains a simulated dataset and a simulated pedigree of the
#' gryphons. The gryphon is a legendary creature with the body, tail, and back
#' legs of a lion; the head and wings of an eagle; and an eagle's talons as its
#' front feet. This dataset has been released with the publication of a paper
#' introducing the animal model, a particular LMM used to infer the heritability
#' of phenotypic traits (see sources). It thus offers the possibility to compare
#' different packages and software for estimating the heritability.
#'
#' @format A list containing:
#'  \describe{
#'    \item{data}{The dataframe containing the mother id, the birth year, the sex, the birth weight, the tarsus length and the individual id of the gryphons}
#'    \item{pedigree}{The dataframe containing the individual id, the mother id and the father id of each gryphon}
#'  }
#'
#'  @source Alastair J. Wilson, Denis Réale, Michelle N. Clements, Michael M.
#'    Morrissey, Erik Postma, Craig A. Walling, Loeske E. B. Kruuk; Daniel H.
#'    Nussey; An ecologist's guide to the animal model. Journal of Animal
#'    Ecology 2010; 79, 13--26. doi: 10.1111/j.1365-2656.2009.01639.x
NULL

#' The Surprise dataset
#'
#' This dataset is the result of a controlled study in which 852 parents from one
#' canadian school were divided into six groups of equal size and given gifts of
#' different types (1 type per group) and of different costs (between ca 15 to 100
#' dollars). After delivering the gifts to their children the parents reported
#' the perceived joy of their children on a continuous scale between 0 and 100.
#'
#' @format A dataframe with 3 variables:
#'   \describe{
#'     \item{type}{the type of gift}
#'     \item{price}{the price coverted in US$}
#'     \item{hapiness}{the continuous scale used to record the children's emotional response}
#'   }
#'
#' @source Justin Matejka, George Fitzmaurice, Toronto Ontario Canada. DOI: http://dx.doi.org/10.1145/3025453.3025912
NULL


#' The Challenger Space Shuttle O-Ring Dataset
#'
#' Edited from (Draper, 1993): The motivation for collecting this database was
#' the explosion of the USA Space Shuttle Challenger on 28 January, 1986. An
#' investigation ensued into the reliability of the shuttle's propulsion system.
#' The explosion was eventually traced to the failure of one of the three field
#' joints on one of the two solid booster rockets. Each of these six field
#' joints includes two O-rings, designated as primary and secondary, which fail
#' when phenomena called erosion and blowby both occur. The night before the
#' launch a decision had to be made regarding launch safety. The discussion
#' among engineers and managers leading to this decision included concern that
#' the probability of failure of the O-rings depended on the temperature t at
#' launch, which was forecase to be 31 degrees F. There are strong engineering
#' reasons based on the composition of O-rings to support the judgment that
#' failure probability may rise monotonically as temperature drops. One other
#' variable, the pressure at which safety testing for field join leaks was
#' performed, was available, but its relevance to the failure process was
#' unclear.
#'
#' @format A dataframe with 5 variables:
#'   \describe{
#'     \item{oring_tot}{The number of O-rings at risk on a given flight}
#'     \item{oring_dt}{The number experiencing thermal distress}
#'     \item{temp}{The launch temperature (degrees F)}
#'     \item{psi}{The leak-check pressure (psi)}
#'     \item{flight}{The temporal order of flight}
#'    }
#'
#' @source \url{https://archive.ics.uci.edu/ml/datasets/Challenger+USA+Space+Shuttle+O-Ring}
#'
#' Original dataset from: Draper,D. (1993). Assessment and propagation of model uncertainty. In Proceedings of the Fourth International Workshop on Artificial Intelligence and Statistics (pp. 497--509). Ft. Lauderdale, FL: Unpublished.
NULL
