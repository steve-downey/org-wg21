(require 'org-special-block-extras)

;; We can use variable values when defining new blocks
(setq angry-red '(:foreground "red" :weight bold :strike-through "red"))
(setq angry-green '(:foreground "green" :weight bold :underline "green"))

(o-defblock delete
            (label "" :face angry-red) (color "red")
            "Top level (HTML & LaTeX) editorial delete; in Emacs they're angry red."
            (format (if (equal backend 'html)
                        "<del style=\"color: %s;\">%s</del>"
                      "{\\color{%s}\\bfseries  %s}")
                    color contents))

(o-defblock insert
            (label "" :face angry-green) (color "green")
            "Top level (HTML & LaTeX) editorial insert; in Emacs they're angry green."
            (format (if (equal backend 'html)
                        "<ins style=\"color: %s;\">%s</ins>"
                      "{\\color{%s}\\bfseries  %s}")
                    color contents))

(o-defblock cmptblcell
            (label "") ()
            "Comparison Table Cell"
            (format (if (equal backend 'html)
                        "<td>%s</td>"
                      "%s")
                    contents))


(o-defblock cmptbl
            (label "") (before "Before" after "After")
            "Comparison, or before/after table"
            (format (if (equal backend 'html)
                        "<table><thead><tr class=\"header\"><th><div style=\"text-align:center\"><strong>%s</strong></div></th><th><div style=\"text-align:center\"><strong>%s</strong></div></th></tr></thead><tbody><tr class=\"odd\">%s</tr></tbody></table>"
                      "%s")
                    before after contents))
