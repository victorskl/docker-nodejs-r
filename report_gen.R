#!/usr/bin/env RScript

suppressPackageStartupMessages(require(markdown))
suppressPackageStartupMessages(require(rmarkdown))
suppressPackageStartupMessages(require(tinytex))

render("report.Rmd", "pdf_document")
