#!/bin/bash

# Script que compila automáticamente un archivo de LaTeX cada vez que se guarda.
# Para usarlo, ejecutar en la Terminal "sh compilatex.sh" (el script y el archivo de LaTeX tienen que estar en la misma carpeta).

# Para terminar de ejecutar el script, tipear en la Terminal "Ctrl + Shift + c".


read -p "Ingrese el nombre del archivo .TeX a compilar: " archivo


pdflatex -interaction=nonstopmode -halt-on-error "$archivo.tex"
fecha=$(date -r "$archivo.tex" +%T)


while true 
    do
       if [ "$fecha" != "$(date -r "$archivo.tex" +%T)" ]; then    
       		pdflatex -interaction=nonstopmode -halt-on-error "$archivo.tex"
       		fecha=$(date -r "$archivo.tex" +%T)
       fi 
       sleep 1
    done
