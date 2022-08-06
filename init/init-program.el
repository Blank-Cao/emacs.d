;;; -*- lexical-binding: t; -*-

;; 设置 Emacs 缩进
(setq-default tab-width 4 ; Emacs 缩进长度
              indent-tabs-mode nil) ; 是否使用真实的 tab（即\t)

(leaf corfu
  :require kind-all-the-icons
  :custom
  (corfu-cycle . t)
  (corfu-auto . t)
  (corfu-auto-delay . 0)
  (corfu-preselect-first . nil)
  :config
  (global-corfu-mode 1)
  (add-to-list 'corfu-margin-formatters #'kind-all-the-icons-margin-formatter))

(leaf cape
  :after corfu
  :config
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (dolist (backend (list #'cape-dabbrev #'cape-file #'cape-history
                         #'cape-keyword #'cape-tex #'cape-sgml
                         #'cape-rfc1345 #'cape-abbrev #'cape-ispell
                         #'cape-dict #'cape-symbol))
    (add-to-list 'completion-at-point-functions backend)))

;; symbol-overlay 变量/函数跳转配置
(leaf symbol-overlay
  :bind
  ("M-i" . symbol-overlay-put)
  ("M-n" . symbol-overlay-switch-forward)
  ("M-p" . symbol-overlay-switch-backward)
  ;; "<f7>" #'symbol-overlay-mode
  ("<f8>" . symbol-overlay-remove-all))

;;; C-like 语言配置
;; C-like 语言缩进配置
;; Java 和 Awk 保持默认，其余情况下使用 k&r 风格
(add-hook 'c-initialization-hook ; 必须挂在该 hook 下，否则设置无效
          (lambda ()
            (when-let ((style (assq 'other c-default-style)))
              (setcdr style "k&r"))))

;; js2-mode & js2-refactor 配置
(leaf js2-mode
  :mode "\\.js\\'")
(leaf js2-refactor
  :hook js2-mode-hook
  :config (js2r-add-keybindings-with-prefix "C-c C-m"))

;; web-mode 配置 
(leaf web-mode
  :mode ("\\.html?\\'" "\\.phtml\\'" "\\.tpl\\.php\\'"
	     "\\.[agj]sp\\'" "\\.as[cp]x\\'" "\\.erb\\'"
	     "\\.mustache\\'" "\\.djhtml\\'")
  :hook (web-mode-hook . (lambda ()
                           (setq web-mode-markup-indent-offset 4
                                 web-mode-css-indent-offset 4 
                                 web-mode-code-indent-offset 4))))

;; Powershell 设置
(leaf powershell)

;; tjs-mode 引入
(add-to-list 'load-path "~/.emacs.d/tjs-mode")
(when (require 'tjs-mode)
  )

(provide 'init-program)
