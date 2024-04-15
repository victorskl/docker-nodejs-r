# https://cran.r-project.org/web/packages/pacman/index.html
# https://github.com/trinker/pacman

# Load Required Libraries -------------------------------------------------

if (!require(pacman)) {
 install.packages("pacman", repos = "https://cran.r-project.org")
}

#pacman::p_load(
#  jsonlite,
#  tidyverse, tidyr, purrr,
#  rlang,
#  MAd, meta, metafor, netmeta,
#  RCurl, urltools, docopt,
#  knitr, kableExtra, rmarkdown, tinytex,
#  htmltools
#  )

# for example
#pacman::p_load(readxl, jsonlite, mongolite, tidyverse, magrittr)

#pacman::p_load(dplyr)
# also installing the dependencies
# ‘utf8’, ‘bindr’, ‘cli’, ‘crayon’, ‘pillar’, ‘assertthat’, ‘bindrcpp’,
# ‘glue’, ‘pkgconfig’, ‘rlang’, ‘R6’, ‘Rcpp’, ‘tibble’, ‘BH’, ‘plogr’
#pacman::p_load(utf8, bindr, cli, crayon, pillar, assertthat, bindrcpp, glue, pkgconfig, rlang, R6, Rcpp, tibble, BH, plogr)

pacman::p_load(tinytex, rmarkdown)
#install.packages("tinytex", repos = "https://cran.r-project.org")
#tinytex::install_tinytex(repository = "http://mirrors.rit.edu/CTAN/systems/texlive/tlnet/")

# Sys.getenv('PATH')
# Sys.which('pdflatex')