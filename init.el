;; -*- coding: utf-8 -n*-
(push "/home/hachen/env/bin" exec-path) ; my python virtualenv
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

; package management and initialisation
(require 'init-packages)
(require 'basic-settings)
(require 'init-fonts)
(require 'key-binding)
(require 'init-org)
(require 'init-misc)

;; mode line settings
;; (set-face-attribute 'mode-line nil :box nil) ;disable 3D-style highlighting of mode line
;; (set-face-background 'mode-line "snow4")
