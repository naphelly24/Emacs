(setq user-mail-address "naphelly24@gmail.com")
(setq user-full-name "naphelly")
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq inhibit-splash-screen t)	; no splash screen
(tool-bar-mode -1)	; no tool bar with icons
(scroll-bar-mode -1)	; no scroll bars
(line-number-mode 1)	; have line numbers and
(column-number-mode 1)	; column numbers in the mode line
(global-linum-mode 1)	; add line numbers on the left
(global-visual-line-mode 1)
;; (global-hl-line-mode)	; highlight current line
(show-paren-mode t)	; show match parentheses

(setq-default kill-whole-line t)   ;Delete the CR and CL when C-k at beginning of the line
(setq kill-do-not-dave-duplicates t) ;if kill content are the same, ignore them
(setq x-select-enable-clipboard t) ; Use the clipboard, pretty please, so that copy/paste "works"
(size-indication-mode t) ; show file size
(delete-selection-mode t) 		; Delete selected contents before inserting
(fset 'yes-or-no-p 'y-or-n-p)   ; Changes all yes/no questions to y/n type
(mouse-avoidance-mode 'exile)		; move mouse to top-right

(global-auto-revert-mode 1) ;show updated contents if it is edited outside emacs

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)	;use space instead of tab

(setq suggest-key-bindings 1)		;show key binding after using command

;; scroll one line at a time (less "jumpy" than defaults)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(setq mouse-wheel-scroll-amount '(5 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; use ido for minibuffer completion
;(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

;; recentf.el setting
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(global-set-key (kbd "C-x f") 'recentf-open-files)

(provide 'basic-settings)
