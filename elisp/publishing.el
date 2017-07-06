;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Publishing definitions for project Monthly Commentary
;; data: 26/04/2017
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-publish-project-alist
      '(("tex"
         :base-directory "./org"
         :base-extension "org"
         :publishing-directory "./latex"
         :with-toc nil
         :recursive nil
         :publishing-function org-latex-publish-to-latex
         )
        ("pdf"
         :base-directory "./"
         :base-extension "org"
         :publishing-directory "./public_pdf/"
         :recursive nil
         :publishing-function org-latex-publish-to-pdf
         )
        ("html"
         :base-directory "./"
         :base-extension "org"
         :publishing-directory "./public_html/"
         :publishing-function org-html-publish-to-html
         :preparation-function project-prepare-html
         :completion-function project-completion-html
         )
        ("pdf-output" :components ("tex" "pdf")
       ))
      )


(defun project-prepare-html (options)
  (setq org-export-exclude-tags '("noexport"))
  )

;; (defun project-completion-html (options)
;;   (setq org-export-with-section-numbers t)
;;   )
