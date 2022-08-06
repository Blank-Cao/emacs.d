;;; -*- lexical-binding: t; -*-

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-display-line-numbers-mode 1)

;; 在底下显示列号
;; 被 doom-modeline 取代
;; (setq column-number-mode t)

;; 更改光标的样式
;; (setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 在标题栏显示当前 bufffer 名字
(setq frame-title-format "%b@emacs")

;; 使用 spacemacs-dark 主题
(leaf dracula-theme
  :config (load-theme 'dracula t))

;; modeline 设置
;; 安装 all-the-icons 支持
(leaf all-the-icons
  :if (display-graphic-p))
;; doom-modeline 设置
(leaf doom-modeline
  :hook (after-init-hook . doom-modeline-mode))
(leaf all-the-icons-completion
  :config (all-the-icons-completion-mode 1))

;; 设置 emacs 使用字体
;; (setq font-use-system-font t) ; 使用系统字体
(add-to-list 'default-frame-alist '(font . "Sarasa Mono SC-12")) ; 指定字体及字号

;; 设置 frame 默认大小，单位分别为一个英文字符宽度和高度
(add-to-list 'default-frame-alist '(width . 85))
(add-to-list 'default-frame-alist '(height . 37))

;; 避免因为字体大小改变而重新调整 Frame 大小
(setq frame-inhibit-implied-resize t)

(provide 'init-ui)
