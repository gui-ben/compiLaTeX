#!/bin/bash

# Script que compila cada X segundos un archivo de LaTex.
# Para usarlo, ejecutar en la Terminal "sh compilatex.sh"

# Para terminar de ejecutar el script, tipear en la Terminal "Ctrl + Shift + c".
# Si el archivo no compila, arreglar el error y escribir "quit" en la Terminal.
# El compilador va a tratar de compilarlo de nuevo. Si compila, el pdf se va a seguir actualizando cada X segundos!


read -p "Ingrese el nombre del archivo .TeX a compilar: " archivo
read -p "Ingrese cada cúantos segundos compilar el archivo: " segundos

while true
do
       pdflatex $archivo.tex
       sleep $segundos
    done
