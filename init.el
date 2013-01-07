(defconst my-emacs-path "~/.emacs.d/")

(defconst my-lisps-path  (concat my-emacs-path "mylisps/") "Path for self lisps")
(add-to-list 'load-path my-lisps-path)

(add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme-solarized/")

(require 'basic-setting)
(require 'keybind-setting)
;(require 'helpfunc-setting)
;(require 'plugin-setting)
;(require 'orgmode-setting)
;(require 'ibuffer-setting)
;(require 'path-setting)
(require 'font-setting)

(load-theme 'wombat)
