#!/bin/bash

# Handle option flags
HELPER=false
VIEWER=false
CLEANER=false
while getopts ":hvc" opt; do
  case $opt in
    h) 
      HELPER=true;;
    v)
      VIEWER=true;;
    c)
      CLEANER=true;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

if $HELPER; then
	# Display help
  echo "Usage: ./compile.sh";
  echo "-h display help";
  echo "-v view output file";
  echo "-c clean directory";
else
  # Compile file
  pdflatex main
  for i in `ls *.aux`; do bibtex $i; done
  pdflatex main
  pdflatex main
  for i in `ls *.aux`; do bibtex $i; done
  pdflatex main

  if $VIEWER; then
    # View PDF file
    open ./main.pdf -a Preview;
  elif $CLEANER; then
    # Clean compilation files
    rm *.aux *.bbl *.blg *.out main.{brf,idx,lof,log,lot,toc};
  fi
fi