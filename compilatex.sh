#!/bin/bash

# Script que compila automáticamente un archivo de LaTex cada vez que se guarda un cambio.
# Para usarlo, ejecutar en la Terminal "sh compilatex.sh"

# Para terminar de ejecutar el script, tipear en la Terminal "Ctrl + Shift + c".
# Si el archivo no compila, arreglar el error y escribir "quit" (o "x") en la Terminal. 
# El compilador va a tratar de compilarlo de nuevo. Si compila, el pdf se va a seguir actualizando!


read -p "Ingrese el nombre del archivo .TeX a compilar: " archivo


pdflatex  $archivo.tex
hash=$(openssl md5 $archivo.tex)


while true 
    do
       if [ "$hash" != "$(openssl md5 $archivo.tex)" ]; then    
       		pdflatex  $archivo.tex
       		hash=$(openssl md5 $archivo.tex)
       fi 
       sleep 1
    done
