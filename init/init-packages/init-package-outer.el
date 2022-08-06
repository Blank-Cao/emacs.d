;;; -*- lexical-binding: t; -*-

;; minibuffer 补全：Vertico 和 Orderless
(leaf vertico
  :config (vertico-mode 1)
  :custom
  (vertico-resize . t)
  (vertico-cycle . t))
(leaf orderless
  :custom (completion-styles . '(basic orderless)))

;; Marginalia：增强 minubuffer 的 annotation
(leaf marginalia
  :config (marginalia-mode 1))

;; minibuffer action 和自适应的 context menu：Embark
(leaf embark
  :bind ("C-;" . embark-act)
  :setq (prefix-help-command . #'embark-prefix-help-command))

;; 文件内搜索和跳转函数定义：Consult
(leaf consult
  :bind ("C-s" . consult-line))

;; 使用 Hungry-delete
(leaf hungry-delete
  :config (global-hungry-delete-mode 1))

;; 为 Expand-region 绑定快捷键
(leaf expand-region
  :bind ("S-SPC" . er/expand-region))

;; Popwin 设置
(leaf popwin
  :config (popwin-mode 1))

;; Smartparens 配置
(leaf smartparens
  :config
  (smartparens-global-mode 1)
  ;; 避免 Smartparens 在 (Emacs) Lisp 模式中补全“'”和“`”
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
  (sp-local-pair 'lisp-interaction-mode "`" nil :actions nil)
  (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil))

;; Ace-window 设置
(leaf ace-window
  :bind ([remap other-window] . ace-window))

;; Ace-jump-mode 设置
(leaf ace-jump-mode
  :bind (("C-c SPC" . ace-jump-mode)
         ("C-x SPC" . ace-jump-mode-pop-mark)))

;; Which-key 配置
(leaf which-key
  :config (which-key-mode 1))

(provide 'init-package-outer)
