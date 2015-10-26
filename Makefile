rmd_files=$(wildcard *.Rmd)
output_format=NULL

.PHONY: default
default: $(rmd_files:.Rmd=.md)

$(rmd_files:.Rmd=.html): %.html: %.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format=$(output_format))'

$(rmd_files:.Rmd=.md): %.md: %.Rmd
	Rscript -e 'knitr::knit("$<")'
