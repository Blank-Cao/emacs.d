;;; -*- lexical-binding: t; -*-

;; 设置 custom-file 文件位置
(setq custom-file
      (expand-file-name "custom.el" init-directory))
;; 载入 custom-file
(when (file-exists-p custom-file)
  (load-file custom-file))

;; 载入 init-def
;; 使用 `when' 而不是 `with-eval-after-load' 以避免可能的GC
(when (require 'init-pkg-configuration)
  (require 'init-enrich)
  (require 'init-mode-edit)
  (require 'init-packages)
  (require 'init-ui)
  (require 'init-program)
  (require 'init-org)
  (require 'init-keybindings))
