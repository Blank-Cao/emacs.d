;;; -*- lexical-binding: t; -*-

;; 引入 init-packsges 文件夹
(add-to-list 'load-path "~/.emacs.d/init/init-packages/")

;; 引入内置包配置
(require 'init-package-inner)

;; 引入外置包配置
(require 'init-package-outer)

(provide 'init-packages)
