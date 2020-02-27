;;; -*- lexical-binding: t; -*-

;; 软件源
(setq package-archives '(("gnu" . "https://elpa.emacs-china.org/gnu/")
			 ("melpa" . "https://elpa.emacs-china.org/melpa/")))

;; 初始化软件包管理器
(package-initialize)

;; 若 use-package 没有安装，安装之
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; 设置 use-package-always-ensure 为真，让 use-package 自动下载缺失的软件包
(when (fboundp 'use-package)
  (setq use-package-always-ensure t))

(provide 'init-usepackage)
