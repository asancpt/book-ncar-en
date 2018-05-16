all: clean gitbook pdf magick epub

magick:
	magick docs/book-ncar-en.pdf[0] docs/cover.png

gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"


pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

epub:
	Rscript --quiet _render.R "bookdown::epub_book"

clean:
	rm book-ncar-en.* ;\
	Rscript -e "options(bookdown.clean_book = TRUE);bookdown::clean_book()"


