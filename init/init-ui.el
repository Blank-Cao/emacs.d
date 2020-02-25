;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
;; (tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-display-line-numbers-mode 1)

;; 在底下显示列号
(setq column-number-mode t)

;; 更改光标的样式
;; (setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 在标题栏显示当前 bufffer 名字
(setq frame-title-format "%b@emacs")

;; 使用 spacemacs-dar 主题
(load-theme 'spacemacs-dark 1)

;; 设置 emacs 使用系统字体
(setq font-use-system-font t)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;; (set-face-attribute 'default nil :height 160)

(provide 'init-ui)
