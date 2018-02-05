# https://cran.r-project.org/web/packages/pacman/vignettes/Introduction_to_pacman.html

# Load Required Libraries -------------------------------------------------

if (!require(pacman)) {
    install.packages("pacman", repos = "http://cran.au.r-project.org")
}

# for example
pacman::p_load(readxl, jsonlite, mongolite, tidyverse, magrittr)

pacman::p_load(dplyr)
# also installing the dependencies
# ‘utf8’, ‘bindr’, ‘cli’, ‘crayon’, ‘pillar’, ‘assertthat’, ‘bindrcpp’,
# ‘glue’, ‘pkgconfig’, ‘rlang’, ‘R6’, ‘Rcpp’, ‘tibble’, ‘BH’, ‘plogr’
#pacman::p_load(utf8, bindr, cli, crayon, pillar, assertthat, bindrcpp, glue, pkgconfig, rlang, R6, Rcpp, tibble, BH, plogr)
