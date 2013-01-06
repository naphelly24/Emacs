(defconst my-emacs-path "~/.emacs.d/")

(defconst my-lisps-path  (concat my-emacs-path "mylisps/") "Path for self lisps")
(add-to-list 'load-path my-lisps-path)

(require 'basic-setting)
(require 'keybind-setting)
;(require 'helpfunc-setting)
;(require 'plugin-setting)
;(require 'orgmode-setting)
;(require 'ibuffer-setting)
;(require 'path-setting)
(require 'font-setting)




