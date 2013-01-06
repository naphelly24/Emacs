(provide 'font-setting)

(when (string-equal system-type "windows-nt")
  "if you want to use Song, you have to use SimSun instead of Yahei"
  (set-face-attribute
   'default nil :font "Consolas 12") 
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
              charset
              (font-spec :family "Microsoft Yahei" :size 16)))
  )

(when (string-equal system-type (or "darwin" "gnu/linux"))
  (set-face-attribute
   'default nil :font "Courier New 12")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
              charset
              (font-spec :family "»ªÎÄËÎÌå" :size 16)))
  )
