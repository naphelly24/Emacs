(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
;;smart indentation on new line
(define-key global-map (kbd "RET") 'newline-and-indent)
;;; useful commands
(global-set-key "\M- " 'just-one-space)
(global-set-key "\C-c\C-j" 'join-line)

(provide 'key-binding)
