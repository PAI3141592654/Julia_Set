mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))

mkfile_dir := $(dir $(mkfile_path))

all:install report slide

install:
	ln -s $(mkfile_dir)  ~/Julia_SetAAA
	cp ~/Julia_SetAAA/src/* ~/Julia_SetAAA
	gcc -o JULIASET juliaset.c
	rm juliaset.c
	rm svpng.h
	mv ~/Julia_SetAAA/JULIASET ~/Julia_SetAAA/bin/JULIASET
	rm ~/Julia_SetAAA
	echo "<<<可执行文件已生成于bin中>>"

report:
	ln -s $(mkfile_dir)  ~/Julia_SetAAA
	cp ~/Julia_SetAAA/doc/* ~/Julia_SetAAA
	xelatex ~/Julia_SetAAA/julia.tex
	bibtex julia.aux
	xelatex ~/Julia_SetAAA/julia.tex
	xelatex ~/Julia_SetAAA/julia.tex
	rm ~/Julia_SetAAA/julia.aux
	rm ~/Julia_SetAAA/julia.log
	rm ~/Julia_SetAAA/12.png
	rm ~/Julia_SetAAA/2.png
	rm ~/Julia_SetAAA/3.png
	rm ~/Julia_SetAAA/4.png
	rm ~/Julia_SetAAA/5.png
	rm ~/Julia_SetAAA/6.png
	rm ~/Julia_SetAAA/7.jpg
	rm ~/Julia_SetAAA/8.jpg
	rm ~/Julia_SetAAA/9.jpg
	rm ~/Julia_SetAAA/julia.tex
	rm ~/Julia_SetAAA/beamer.tex
	rm ~/Julia_SetAAA/ref.bib
	rm ~/Julia_SetAAA/julia.blg
	rm ~/Julia_SetAAA/julia.bbl
	mv ~/Julia_SetAAA/julia.pdf ~/Julia_SetAAA/report.pdf
	cp ~/Julia_SetAAA/report.pdf ~/Julia_SetAAA/doc/report.pdf
	rm ~/Julia_SetAAA
	echo "<<<文档已生成于项目目录及doc中>>>"

slide:
	ln -s $(mkfile_dir)  ~/Julia_SetAAA
	cp ~/Julia_SetAAA/doc/* ~/Julia_SetAAA
	xelatex ~/Julia_SetAAA/beamer.tex
	bibtex beamer.aux
	xelatex ~/Julia_SetAAA/beamer.tex
	xelatex ~/Julia_SetAAA/beamer.tex
	mv ~/Julia_SetAAA/beamer.pdf ~/Julia_SetAAA/slide.pdf
	cp ~/Julia_SetAAA/slide.pdf ~/Julia_SetAAA/doc/slide.pdf
	rm ~/Julia_SetAAA/12.png
	rm ~/Julia_SetAAA/2.png
	rm ~/Julia_SetAAA/3.png
	rm ~/Julia_SetAAA/4.png
	rm ~/Julia_SetAAA/5.png
	rm ~/Julia_SetAAA/6.png
	rm ~/Julia_SetAAA/7.jpg
	rm ~/Julia_SetAAA/8.jpg
	rm ~/Julia_SetAAA/9.jpg
	rm ~/Julia_SetAAA/julia.tex
	rm ~/Julia_SetAAA/beamer.tex
	rm ~/Julia_SetAAA/ref.bib
	rm ~/Julia_SetAAA/beamer.blg
	rm ~/Julia_SetAAA/beamer.bbl
	rm ~/Julia_SetAAA/beamer.aux
	rm ~/Julia_SetAAA/beamer.log
	rm ~/Julia_SetAAA/beamer.nav
	rm ~/Julia_SetAAA/beamer.out
	rm ~/Julia_SetAAA/beamer.snm
	rm ~/Julia_SetAAA/beamer.toc
	rm ~/Julia_SetAAA
	echo "<<<文档已生成于项目目录及doc中>>"

clean:
	ln -s $(mkfile_dir) ~/Julia_SetAAA
	rm ~/Julia_SetAAA/report.pdf
	rm ~/Julia_SetAAA/slide.pdf
	rm ~/Julia_SetAAA/doc/report.pdf
	rm ~/Julia_SetAAA/doc/slide.pdf
	rm ~/Julia_SetAAA
