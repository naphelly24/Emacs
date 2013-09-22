;; setting up el-get plugin
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)))))

(setq el-get-user-package-directory "~/.emacs.d/el-get-inits/")

;; now either el-get is `require'd already, or have been `load'ed by the el-get installer.

;; set local recipes
(setq
 el-get-sources
 '(   (:name smex	; a better (ido like) M-x
	  :after (progn
		   (setq smex-save-file "~/.emacs.d/.smex-items")
		   (global-set-key (kbd "M-x") 'smex)
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
      (:name goto-last-change	; move pointer back to last change
	  :after (progn
		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))
   ))

;; now set our own packages
(setq my-packages
      (append
       '(el-get auto-complete color-theme)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)       ; install new packages and init already installed packages

(provide 'init-packages)
