(setq user-mail-address "naphelly24@126.com")
(setq user-full-name    "naphelly")

;;eliminate startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;(customize-set-variable 'scroll-bar-mode nil)
(tool-bar-mode -1)
;;(menu-bar-mode -1)

(setq ring-bell-function 'ignore)
;(blink-cursor-mode -1)

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
;(set-cursor-color "white")
;(set-mouse-color "blue")
;(set-foreground-color "lightblue")
;(set-background-color "black")
;(set-border-color "lightgreen")

;(set-face-foreground 'highlight "red")
;(set-face-background 'highlight "blue")
;(set-face-foreground 'region "cyan")
;(set-face-background 'region "blue")
;(set-face-foreground 'secondary-selection "skyblue")
;(set-face-background 'secondary-selection "darkblue")

;;smart comment codes
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;;use f11 to toggle fullscreen
(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)



;; Smart copy
;; if no region active, M-w simply copy the current whole line
;; if no region active, C-w simply cut the current whole line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))
 
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))
 
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
 
;; use M-k to copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
                  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
 
(global-set-key (kbd "M-k") 'qiang-copy-line)

(provide 'basic-setting)
