;; (setq org-startup-indented t)
;; (setq org-hide-leading-stars t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)
(setq org-log-done 'note)

(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "D:/SkyDrive/Documents/memo"
         :base-extension "org"
         :publishing-directory "D:/SkyDrive/Documents/memo/html"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         )
        ("org-static"
         :base-directory "D:/SkyDrive/Documents/memo"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "D:/SkyDrive/Documents/memo/html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("memo" :components ("org-notes" "org-static"))
        ))

(provide 'init-org)
