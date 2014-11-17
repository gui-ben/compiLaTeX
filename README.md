                               .-.       ___    .'-.\ :\_'/  `-'`
                              _L o|_.-'``   '-. ;\_'/  `-`
                            _f o\-'          /_. `-`
                        ,-'` '-'              /
                       /                    .'
                      |                   .'                .--.
                       \              _.-'                  `-' | 
                        |        __.-'                     .- '`
                       ,-.     "`|                        |
                      /  |       |                         '-.
                      \_ |       |              _  .-.      _ "
                       /`|       |             ' . ' |  _.-"7P`
                      |  |       ;              \ \| |-' _.-"`
                      \_ |        ;           _,-'`| |.-'
                       /`|        |          ()_,.-j f.-.
                      |  |        |           .'`) (_.-.j
                      \_ ;        ;          (  <   (__.'
                       / '        ;           \  '    /
                      |   |        \          /      ;
                       \_ |         `'--.___.'       |

                               
                               
# CompiLaTeX
Script que compila un archivo de LaTeX automáticamente cada vez que se guarda.

Para usarlo, ejecutar en la Terminal `sh compilatex nombreDelArchivo.tex` (el script y el archivo de LaTeX tienen que estar en la misma carpeta).

Para terminar de ejecutar el script, tipear en la Terminal `Ctrl + Shift + c`.



Si lo usan mucho, se lo pueden instalar para directarmente hacer desde cualquier lugar ` compilatex ubicación/del/archivo/nombreDelArchivo.tex`:

 1. Crear un directorio donde vamos a guardar nuestros scripts. Ejemplo: ~/bin (~ es un shortcut para /home/usuario).
    Poner el script en esa carpeta. Editamos las propiedades del archivo y marcamos "Permitir ejecutar como programa".
 2. Agregar esa carpeta al PATH (el lugar donde se indica dónde están los programas ejecutables). En el caso de Ubuntu, abrimos el archivo ~/.bashrc y agregamos las líneas:
      `export PATH=$PATH:~/bin `



El script en vez de usar pdflatex directamente, llama a BetterPDFLaTeX, que modifica el output de pdflatex para hacerlo más legible:

BetterPDFLaTeX colors pdflatex warnings in orange, errors in red and the "Output written ..." message in green.
Duplicate lines (which appear right after each other) are skipped as well as those annoying only-bracket-lines, which pdflatex generates a lot.
The --line-buffered parameter makes sure that the output is still "smooth" and not "laggy" due to buffering of grep.
The --color=always (in contrast to --color=auto) preserves the colors of previous grep calls when piping them together like this.

You can put the script in your PATH with filename pdflatex, such that all Makefiles which call pdflatex use this colored version.

Fuente de BetterPDFLaTeX: fw42.blogspot.com.ar/2012/08/colored-pdflatex-console-output.html

