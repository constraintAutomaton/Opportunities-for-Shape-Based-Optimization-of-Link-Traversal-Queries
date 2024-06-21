SOURCE = main.tex reviewing.tex references.bib section/*.tex figure/*

main.pdf: $(SOURCE)
	pdflatex --shell-escape main && bibtex main && pdflatex --shell-escape main && pdflatex --shell-escape main
	
.PHONY: clean

clean:
	rm -f *.log *.xmpi *.xmpdata *.abs *.aux main.pdf *.out *.text.bbl main.*.blg *.blg *.bbl *.fls *.fdb_latexmk main.log *.synctex.gz section/*.aux *.bcf *-blx.bib *.run.xml
	rm -r svg-inkscape

