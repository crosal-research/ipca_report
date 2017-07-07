(TeX-add-style-hook
 "ipca"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("ulem" "normalem") ("xcolor" "table") ("standalone" "subpreambles=true") ("hyperref" "linktocpage=true") ("babel" "portuguese" "english") ("inputenc" "latin1" "utf8")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "report"
    "rep10"
    "inputenc"
    "fontenc"
    "fixltx2e"
    "graphicx"
    "longtable"
    "float"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "marvosym"
    "wasysym"
    "amssymb"
    "hyperref"
    "paralist"
    "tcolorbox"
    "xcolor"
    "lipsum"
    "caption"
    "tabu"
    "standalone"
    "import"
    "setspace"
    "graphics"
    "tocloft"
    "minitoc"
    "babel"
    "subfig")
   (LaTeX-add-labels
    "sec-1"
    "sec-2"))
 :latex)

