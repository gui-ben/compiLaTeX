#!/bin/bash

# Script que compila automáticamente un archivo de LaTeX cada vez que se guarda.
# Para usarlo, ejecutar en la Terminal "sh compilatex.sh" (el script y el archivo de LaTeX tienen que estar en la misma carpeta).

# Para terminar de ejecutar el script, tipear en la Terminal "Ctrl + Shift + c".



# BetterPDFLaTeX colors pdflatex warnings in orange, errors in red and the "Output written ..." message in green. 
# Duplicate lines (which appear right after each other) are skipped as well as those annoying only-bracket-lines, which pdflatex generates a lot. 
# The --line-buffered parameter makes sure that the output is still "smooth" and not "laggy" due to buffering of grep. 
# The --color=always (in contrast to --color=auto) preserves the colors of previous grep calls when piping them together like this.

# You can put the script in your PATH with filename pdflatex, such that all Makefiles which call pdflatex use this colored version. 

# Fuente: fw42.blogspot.com.ar/2012/08/colored-pdflatex-console-output.html

BetterPDFLaTeX(){
GREP="grep --color=always --line-buffered"
(/usr/bin/pdflatex -file-line-error $* 2>&1) \
 | $GREP -vP "^\s*((\[|\]|\(|\))\s*)+$" \
 | GREP_COLOR="01;31" $GREP -P "(^[^:]*:\d+: )|(^l\.\d+ )|(^! LaTeX Error: )|$" \
 | GREP_COLOR="00;33" $GREP -P "(LaTeX Warning(:|))|(Package [^\s]+ Warning(:|))|$" \
 | GREP_COLOR="00;32" $GREP -P "^Output written on .*\.pdf \(.*\)\.$|$" \
 | uniq
} 


read -p "Ingrese el nombre del archivo .TeX a compilar: " archivo

BetterPDFLaTeX "$archivo.tex" -interaction=nonstopmode -halt-on-error
fecha=$(date -r "$archivo.tex" +%T)


while true 
    do
       if [ "$fecha" != "$(date -r "$archivo.tex" +%T)" ]; then    
       		BetterPDFLaTeX "$archivo.tex" -interaction=nonstopmode -halt-on-error
       		fecha=$(date -r "$archivo.tex" +%T)
       fi 
    done
