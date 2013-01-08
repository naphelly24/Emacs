;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 22:37:19 Saturday by ahei>

(require 'cn-weather)

(defalias 'weather 'cn-weather-today)
(defalias 'weather-tomorrow 'cn-weather-forecast)
(setq cn-weather-city "…œ∫£")
;(display-cn-weather-mode t)
(provide 'weather-settings)
