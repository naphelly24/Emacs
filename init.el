(require 'cl)               ; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)))))

(setq el-get-user-package-directory "~/.emacs.d")

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

;; set local recipes
(setq
 el-get-sources
 '((:name buffer-move	; have to add your own keys
	  :after (progn
		   (global-set-key (kbd "<C-S-up>") 'buf-move-up)
		   (global-set-key (kbd "<C-S-down>") 'buf-move-down)
		   (global-set-key (kbd "<C-S-left>") 'buf-move-left)
		   (global-set-key (kbd "<C-S-right>") 'buf-move-right)))

   (:name smex	; a better (ido like) M-x
	  :after (progn
		   (setq smex-save-file "~/.emacs.d/.smex-items")
		   (global-set-key (kbd "M-x") 'smex)
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit	; git meet emacs, and a binding
	  :after (progn
		   (global-set-key (kbd "C-x C-z") 'magit-status)))

   (:name goto-last-change	; move pointer back to last change
	  :after (progn
		   ;; when using AZERTY keyboard, consider C-x C-_
		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))
   ))

;; now set our own packages
(setq
 my:el-get-packages
 '(el-get	; el-get is self-hosting
   escreen ; screen for emacs, C-\ C-h
   switch-window	; takes over C-x o
   auto-complete	; complete as you type with overlays
   color-theme
   zencoding-mode	; http://www.emacswiki.org/emacs/ZenCoding
   ))


;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
					;(when (el-get-executable-find "cvs")
					;(add-to-list 'my:el-get-packages 'emacs-goodies-el)) ; the debian addons for emacs

					;(when (el-get-executable-find "svn")
					;(loop for p in '(psvn ; M-x svn-status
					;yasnippet	; powerful snippet mode
					;)
					;do (add-to-list 'my:el-get-packages p)))

(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

(el-get 'sync my:el-get-packages)       ; install new packages and init already installed packages





;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;; font settings
(set-face-attribute 'default nil :font "Consolas-12")
;(set-face-font 'default "Monospace-15")
;(set-frame-font "Consolas-12")


;----------------------------------------------------------------------
;basic setting
;----------------------------------------------------------------------
(setq user-mail-address "naphelly24@gmail.com")
(setq user-full-name "naphelly")
(setq inhibit-splash-screen t)	; no splash screen, thanks
(tool-bar-mode -1)	; no tool bar with icons
(scroll-bar-mode -1)	; no scroll bars
(line-number-mode 1)	; have line numbers and
(column-number-mode 1)	; column numbers in the mode line

(global-linum-mode 1)	; add line numbers on the left
(global-hl-line-mode)	; highlight current line
(show-paren-mode t)	; show match parentheses

(setq-default kill-whole-line t)   ;Delete the CR and CL when C-k at beginning of the line
(setq kill-do-not-dave-duplicates t) ;if kill content are the same, ignore them
(winner-mode 1)	; winner-mode provides C-<left> to get back to previous window layout
(setq x-select-enable-clipboard t) ; Use the clipboard, pretty please, so that copy/paste "works"
(size-indication-mode t) ; show file size
(delete-selection-mode t) 		; Delete selected contents before inserting
(fset 'yes-or-no-p 'y-or-n-p)
(mouse-avoidance-mode 'exile)		; move mouse to top-right

(global-auto-revert-mode 1) ;show updated contents if it is edited outside emacs

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)	;use space instead of tab

(setq suggest-key-bindings 1)		;show key binding after using command


;; M-x shell is a nice shell interface to use, let's make it colorful. If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; If you do use M-x term, you will notice there's line mode that acts like
;; emacs buffers, and there's the default char mode that will send your
;; input char-by-char, so that curses application see each of your key
;; strokes.
;;
;; The default way to toggle between them is C-c C-j and C-c C-k, let's
;; better use just one key to do the same.
;; (require 'term)
;; (define-key term-raw-map (kbd "C-'") 'term-line-mode)
;; (define-key term-mode-map (kbd "C-'") 'term-char-mode)

;; ;; Have C-y act as usual in term-mode, to avoid C-' C-y C-'
;; ;; Well the real default would be C-c C-j C-y C-c C-k.
;; (define-key term-raw-map (kbd "C-y") 'term-paste)


(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1) ; move smoothly
;;----------------------------------------------------------------------
;; recentf.el setting
;;----------------------------------------------------------------------
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x f") 'recentf-open-files)

;;----------------------------------------------------------------------
;; Smart comment codes
;;----------------------------------------------------------------------
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line) 

