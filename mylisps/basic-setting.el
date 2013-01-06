(setq user-mail-address "naphelly24@126.com")
(setq user-full-name    "naphelly")

;;eliminate startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;(customize-set-variable 'scroll-bar-mode nil)
(tool-bar-mode -1)
;;(menu-bar-mode -1)

(setq ring-bell-function 'ignore)
(blink-cursor-mode -1)

(setq kill-ring-max 200)

;;display time in status bar
(display-time-mode 1)
;;time format
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;;display line number
(global-linum-mode t)
(setq column-number-mode t)

;;When on one parentheses, move to the other one
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;control+space is for input method
(global-set-key [(control space)] nil)

;;Delete the CR and the end of the line when Ctrl + K at beginning of the line
(setq-default kill-whole-line t)

;;if kill content are the same, ignore them
(setq kill-do-not-dave-duplicates t)

;;Stop scroll-bar, it's very important to make emacs looks move more smoothly
(setq scroll-step 0
      scroll-margin 0
      scroll-conservatively 10000)

;;Windows size
(setq default-frame-alist
      '((height . 30)(width . 100)(menubar-lines . 20)(tool-bar-lines . 0)))
;(run-with-idle-timer 1 nil 'w32-send-sys-command 61488)

;;set default directory
;(setq default-directory "~/work/")

;; color settings
(set-cursor-color "white")
(set-mouse-color "blue")
(set-foreground-color "lightblue")
(set-background-color "black")
(set-border-color "lightgreen")

(set-face-foreground 'highlight "red")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(provide 'basic-setting)
