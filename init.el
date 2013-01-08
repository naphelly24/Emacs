(defconst my-emacs-path "~/.emacs.d/")

(defconst mylisps-path  (concat my-emacs-path "mylisps/") "Path for self lisps")
(defconst lisps-path (concat my-emacs-path "lisps/") "Path for other lisps")
;(add-to-list 'load-path my-lisps-path)

;;add all sub dirs to 'load-path'
(load (concat mylisps-path "my-subdirs"))
(my-add-subdirs-to-load-path mylisps-path)
(my-add-subdirs-to-load-path lisps-path)

(require 'util)

(if is-after-emacs-24
  (load-theme 'wombat)
  ((require 'color-theme)
  (color-theme-gnome2)))

(require 'basic-setting)
(require 'keybind-setting)
(require 'font-setting)

;;show choices when use M-x to execute commands
(require 'icomplete-settings)

;; minibuffer中输入部分命令就可以使用补全
(unless is-after-emacs-23
  (partial-completion-mode 1))

;;go to recent location
(require 'recent-jump-settings)

;;weather report
(require 'weather-settings)

