#!/bin/bash

# Script que compila automáticamente un archivo de LaTex cada vez que se guarda.
# Para usarlo, ejecutar en la Terminal "sh compilatex.sh"

# Para terminar de ejecutar el script, tipear en la Terminal "Ctrl + Shift + c".
# Si el archivo no compila, arreglar el error y escribir "quit" (o "q") en la Terminal. 
# El compilador va a tratar de compilarlo de nuevo. Si compila, el pdf se va a seguir actualizando cada vez que se guarde!


read -p "Ingrese el nombre del archivo .TeX a compilar: " archivo


pdflatex  $archivo.tex
fecha=$(date -r $archivo.tex)


while true 
    do
       if [ "$fecha" != "$(date -r $archivo.tex)" ]; then    
       		pdflatex  $archivo.tex
       		fecha=$(date -r $archivo.tex)
       fi 
       sleep 1
    done
