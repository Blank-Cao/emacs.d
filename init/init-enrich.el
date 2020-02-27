;;; -*- lexical-binding: t; -*-

;; 关闭自动备份
(setq make-backup-files nil)

;; 在图形界面的菜单中打开最近编辑过的文件。
(use-package recentf
  ;; :hook ("C-x C-r" . recentf-open-files)
  :config (progn
	    (recentf-mode 1)
	    (setq recentf-max-menu-item 10))
  :ensure nil)

;; 将删除功能配置成与其他编辑器相同，即当你选中一段文字之后输入若干字符会替换掉你选中部分的文字
(delete-selection-mode 1)

;; 在编程模式下开启括号自动匹配
(add-hook 'prog-mode-hook 'show-paren-mode)
;; 光标在括号内时高亮包含内容的两个括号
;; 要挂在 emacs-startup-hook 下，否则更改无效
(add-hook 'emacs-startup-hook
	  (lambda () (define-advice show-paren-function
			 (:around (fn) fix-show-paren-function)
		       "Highlight enclosing parens."
		       (cond ((looking-at-p "\\s(") (funcall fn))
			     (t (save-excursion
				  (ignore-errors (backward-up-list))
				  (funcall fn)))))))

;; 高亮当前行
(global-hl-line-mode 1)

;; 让Emacs 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭自己生产的保存文件
(setq auto-save-default nil)

;; 用'y'和'n'代替输入'yes'和'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; 设置 Hippie Expand
(use-package hippie-expand
  :bind ("<backtab>" . hippie-expand)
  :config (setq hippie-expand-try-functions-list
		'(try-expand-debbrev
		  try-expand-debbrev-all-buffers
		  try-expand-debbrev-from-kill
		  try-complete-file-name-partially
		  try-complete-file-name
		  try-expand-all-abbrevs
		  try-expand-list
		  try-expand-line
		  try-complete-lisp-symbol-partially
		  try-complete-lisp-symbol))
  :ensure nil)

;; 隐藏 DOS / Windows 下的^M换行符
(defun hidden-dos-eol ()
  "Hide ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))
;; (hidden-dos-eol)

;; 配置 dired
(use-package dired
  :init (put 'dired-find-alternate-file 'disabled nil)
  :bind (:map dired-mode-map
	 ("RET" . 'dired-find-alternate-file))
  :ensure nil)

;; 启用 dired-x
(use-package dired-x
  :after dired
  :config (setq dired-dwin-target 1)
  :defer t
  :ensure nil)

(provide 'init-enrich)
