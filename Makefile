magick:
	magick docs/book-ncar-en.pdf[0] docs/cover.png

publish:
	git pull ;\
	rm -rf docs ;\
	Rscript --quiet _render.R "bookdown::gitbook" ;\
	Rscript --quiet _render.R "bookdown::pdf_book" ;\
	Rscript --quiet _render.R "bookdown::epub_book" ;\
	magick docs/book-ncar-en.pdf[0] docs/cover.png
	git add .; git commit -m 'publish: gitbook'; git push

gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"

html2:
	Rscript --quiet _render.R "bookdown::html_document2"


pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

all:
	Rscript --quiet _render.R

clean:
	Rscript -e "options(bookdown.clean_book = TRUE);bookdown::clean_book()"

rmd:
	Rscript -e "rmarkdown::render('keynote.Rmd', output_format = 'html_document', encoding = 'UTF-8')"

go:
	make gitbook ; open docs/index.html


