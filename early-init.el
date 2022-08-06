;;; -*- lexical-binding: t; -*-

;; 临时增大 Emacs 使用内存
(setq gc-cons-threshold (* 100 1024 1024)
      gc-cons-percentage 0.6
      ;; 保存 `file-name-handler-alist' 变量，在 Emacs 加载后重新赋值
      temporary--file-name-handler-alist file-name-handler-alist
      ;; 设置为 nil, 加快启动速度
      file-name-handler-alist nil)

;; (setq package-enable-at-startup nil)

(defvar init-directory (locate-user-emacs-file "init/")
  "The directory where the init files are.")

(when debug-on-error
  (add-to-list 'load-path (locate-user-emacs-file "benchmark-init/"))
  (require 'benchmark-init)
  (require 'benchmark-init-modes)
  (benchmark-init/activate))

;; 将 init 文件夹加入 `load-path'
(add-to-list 'load-path init-directory)

(require 'init-def)

;; 加载完毕后还原设置的变量
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1
                  file-name-handler-alist temporary--file-name-handler-alist)))
