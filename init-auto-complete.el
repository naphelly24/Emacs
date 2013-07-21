; seems el-get already set ac-dictionary-directories
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") 
(require 'auto-complete-config)
(ac-config-default)
(setq ac-quick-help-delay 0.5)      ; quick help show up after 0.5 seconds
;(setq ac-auto-start nil)                ; do not auto auto-complete
;(ac-set-trigger-key "TAB")              ; use TAB to trigger auto-complete
(define-key ac-mode-map (kbd "TAB") 'auto-complete) ; use TAB to trigger auto-complete (fuzzy complete)
