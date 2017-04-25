pdflatex main
for i in `ls *.aux`; do bibtex $i; done
for i in `ls Body/*.aux`; do bibtex $i; done
pdflatex main
pdflatex main
open ./main.pdf -a Preview