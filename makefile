.PHONY: clean

clear:
	rm -f *.log *.xmpi *.xmpdata *.abs *.aux main.pdf *.out *.text.bbl main.*.blg *.blg *.bbl *.fls *.fdb_latexmk main.log *.synctex.gz section/*.aux *.bcf *-blx.bib *.run.xml

main.pdf: main.tex section/*.tex
	pdflatex main && bibtex main && pdflatex main && pdflatex main
