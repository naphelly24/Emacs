(provide 'keybind-setting)

;(global-set-key (kbd "C-w")          'backward-kill-word)
;(global-set-key (kbd "C-x C-k")      'kill-region)
(global-set-key (kbd "C-o")          'other-window)
(global-set-key (kbd "<C-return>")   'delete-other-windows)
(global-set-key (kbd "C-h")          'backward-delete-char-untabify)
(global-set-key (kbd "C-,")          'set-mark-command)
;; 重新定义`help-command',因为C-h已经绑定为删除前面的字符
(global-set-key (kbd "C-x /") 'help-command)

