;;; -*- lexical-binding: t; -*-

;; 设置 Emacs 文件编码格式为 UTF-8
;; (prefer-coding-system 'utf-8)

;; 关闭自动备份
(setq make-backup-files nil)

;; 将删除功能配置成与其他编辑器相同，即当你选中一段文字之后输入若干字符会替换掉你选中部分的文字
(delete-selection-mode 1)

;; 现 Emacs 下自动开启高亮括号
;; 光标在括号内时高亮包含内容的两个括号
;; 要挂在 emacs-startup-hook 下，否则更改无效
(add-hook 'emacs-startup-hook
	      (lambda () (define-advice show-paren-function
			             (:around (fn) fix-show-paren-function)
		               "Highlight enclosing parens."
                       (if (looking-at-p "\\s(")
                           (funcall fn)
                         (save-excursion
                           (ignore-errors (backward-up-list))
                           (funcall fn))))))

;; 高亮当前行
(global-hl-line-mode 1)

;; 让Emacs 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭自己生产的保存文件
(setq auto-save-default nil)

;; 用'y'和'n'代替输入'yes'和'no'
;; (fset 'yes-or-no-p 'y-or-n-p)
(setq use-short-answers t)

;; Windows / DOS 下配置
(when (memq system-type '(windows-nt ms-dos))
  ;; 自动隐藏^M换行符
  (hidden-dos-eol)
  ;; 设置 Emacs 打开目录
  (with-current-buffer "*scratch*"
    (setq-local default-directory "~/")))

(provide 'init-enrich)
