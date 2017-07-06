(TeX-add-style-hook
 "report"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("xcolor" "table") ("titlesec" "explicit") ("hyperref" "colorlinks=true" "urlcolor=blue") ("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "article"
    "art12"
    "fancyhdr"
    "fancybox"
    "multicol"
    "xcolor"
    "titlesec"
    "titletoc"
    "geometry"
    "hyperref"
    "inputenc")
   (TeX-add-symbols
    '("NewsItem" 1)
    '("NewsEmail" 1)
    '("NewsAuthor" 1)
    '("IssueTitle" 1)
    '("HorRule" 1)
    "SepRule"
    "headlinecolor"
    "JournalIssue"
    "Headsep")
   (LaTeX-add-lengths
    "tocsep")
   (LaTeX-add-xcolor-definecolors
    "slcolor"
    "color1"
    "color2"))
 :latex)

