pdflatex main
for i in `ls *.aux`; do bibtex $i; done
pdflatex main
pdflatex main
# rm *.aux *.bbl *.blg *.out
# rm main.{brf,idx,lof,log,lot,toc}

open ./main.pdf -a Preview