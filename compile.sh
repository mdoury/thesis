#!/bin/bash

# Compile file
pdflatex main
for i in `ls *.aux`; do bibtex $i; done
pdflatex main
pdflatex main

# Handle -v and -c flags
while getopts ":vc" opt; do
  case $opt in
    v)
    # View PDF file
      open ./main.pdf -a Preview >&2
      ;;
    c)
    # Clean compilation files
      rm *.aux *.bbl *.blg *.out main.{brf,idx,lof,log,lot,toc} >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
