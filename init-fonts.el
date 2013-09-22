;;encoding settings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(prefer-coding-system 'chinese-gbk)
(setq default-buffer-file-coding-system 'utf-8)
;; (set-language-environment-coding-systems "chinese-gb" nil)
(global-font-lock-mode t)
;; font settings
;; Setting English Font
(set-face-attribute 'default nil :font "Consolas 12")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 14)))

(provide 'init-fonts)
