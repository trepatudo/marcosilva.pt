(require 'package)
(package-initialize)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)
(package-install 'org-plus-contrib)
(package-install 'htmlize)

(require 'org)
(require 'ox-publish)

(setq user-full-name nil)

;; configure
(setq org-publish-project-alist
      '(
        ("org-marcosilva" ; Export my blog to the Jekyll format for ~jekyll build~
         ;; Path to your org files.
         :base-directory "~/src/personal/marcosilva.pt/org"
         :base-extension "org"

         ;; Exclude README.org
         :exclude "README\.org"

         ;; Path to your Jekyll project.
         :publishing-directory "~/src/personal/marcosilva.pt/jekyll"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>

         :section-numbers nil
         :with-toc nil
         :auto-index nil
         :auto-preamble nil
         :body-only t
         :auto-postamble nil
         :preserve-breaks t
         )

        ("org-static-marcosilva"
         :base-directory "~/src/personal/marcosilva.pt/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|svg"
         :publishing-directory "~/src/personal/marcosilva.pt/jekyll/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("marcosilva.pt" :components (
                                      "org-marcosilva"
                                      "org-static-marcosilva"
                                      )
         )
        ))
