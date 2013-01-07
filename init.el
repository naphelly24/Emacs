(defconst my-emacs-path "~/.emacs.d/")

(defconst mylisps-path  (concat my-emacs-path "mylisps/") "Path for self lisps")
(defconst lisps-path (concat my-emacs-path "lisps/") "Path for other lisps")
;(add-to-list 'load-path my-lisps-path)

;;add all sub dirs to 'load-path'
(load (concat mylisps-path "my-subdirs"))
(my-add-subdirs-to-load-path mylisps-path)
(my-add-subdirs-to-load-path lisps-path)

(require 'color-theme)
(color-theme-gnome2)

(require 'basic-setting)
(require 'keybind-setting)
(require 'font-setting)
