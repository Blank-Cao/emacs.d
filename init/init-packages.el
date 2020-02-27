;;; -*- lexical-binding: t; -*-

;; 开启全局 Company 补全
(use-package company
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
	 ("M-n" . nil)
	 ("M-p" . nil)
	 ("C-n" . #'company-select-next)
	 ("C-p" . #'company-select-previous)
	 ("ESC" . #'company-abort)))

;; 开启 fcitx 插件，以便配置 fcitx 在 emacs 下的行为
(use-package fcitx
  :after (evil evil-leader)
  :config (progn
	    (fcitx-aggressive-setup)
	    (setq fcitx-use-dbus t)
	    ;; 在 fcitx 开启的时候屏蔽以下列为开头的按键
	    (fcitx-prefix-keys-add
	     "C-x" "C-c" "C-h" "M-s" "M-o" "M-g" evil-leader/leader)
	    (fcitx-prefix-keys-turn-on) ; 启用上面配置
	    ))

;; 启用 Ivy 并配置
(use-package ivy
  :config (progn
	    (ivy-mode 1)
	    (setq ivy-use-virtual-buffers t
		  enable-recursive-minibuffers t)))

;; 启用 counsel 并配置
(use-package counsel
  :config (counsel-mode 1))

;; 启用 swiper 并配置
(use-package swiper
  :bind ("C-s" . #'swiper-isearch))

;; 使用 Hungry-delete
(use-package hungry-delete
  :config (global-hungry-delete-mode 1))

;; 为 expand-region 绑定快捷键
(use-package expand-region
  :bind ("S-SPC" . #'er/expand-region))

;; popwin 设置
(use-package popwin
  :config (popwin-mode 1))

;; Smartparens 配置
(use-package smartparens
  :config
  (progn
    (smartparens-global-mode 1)
    ;; 避免 Smartparens 在 (Emacs) Lisp 模式中补全“'”和“`”
    (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
    (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
    (sp-local-pair 'lisp-interaction-mode "`" nil :actions nil)
    (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)))

;; js2-mode & js2-refactor 配置
(use-package js2-mode
  :mode "\\.js\\'")
(use-package js2-refactor
  :hook js2-mode
  :config (js2r-add-keybindings-with-prefix "C-c C-m"))

;; web-mode 配置 
(use-package web-mode
  :mode ("\\.html?\\'" "\\.phtml\\'" "\\.tpl\\.php\\'"
	 "\\.[agj]sp\\'" "\\.as[cp]x\\'" "\\.erb\\'"
	 "\\.mustache\\'" "\\.djhtml\\'")
  :config
  (add-hook 'web-mode-hook
	    (lambda ()
	      (setq web-mode-markup-indent-offset 4
	            web-mode-css-indent-offset 4 
	            web-mode-code-indent-offset 4))))

;; ace-window 设置
(use-package ace-window
  :after evil-leader
  :config (progn
	    (bind-key (vector 'remap 'other-window) #'ace-window)
	    (evil-leader/set-key "xo" #'ace-window))
  :defer t)

;; ace-jump-mode 设置
(use-package ace-jump-mode
  :bind (("C-c SPC" . #'ace-jump-mode)
	 ("C-x SPC" . #'ace-jump-mode-pop-mark))
  :config (evil-leader/set-key
	    "jc" #'ace-jump-mode
	    "jx" #'ace-jump-mode-pop-mark))

;; evil leader 配置
(use-package evil-leader
  :config (progn
	    (global-evil-leader-mode 1)
	    ;; 设置 leader key
	    (evil-leader/set-leader "<SPC>")))

;; evil 配置
(use-package evil
  :after evil-leader
  :config (progn
	    (evil-mode 1)
	    ;; insert-state 仅设置 ESC 为 evil-normal-state-with-company 
	    (setq evil-insert-state-map
		  (let ((map (make-sparse-keymap)))
		    (define-key map (kbd "<escape>")
		      #'evil-normal-state-with-company)
		    map))))

(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode 1))

(use-package evil-nerd-commenter
  :after (evil evil-leader)
  :bind (("M-;" . #'evilnc-comment-or-uncomment-lines)
	 ("C-c l" . #'evilnc-quick-comment-or-uncomment-to-the-line)
	 ("C-c c" . #'evilnc-copy-and-comment-lines)
	 ("C-c p" . #'evilnc-comment-or-uncomment-paragraphs))
  :config (evil-leader/set-key
	    "cl" 'evilnc-comment-or-uncomment-lines
	    "ci" 'evilnc-quick-comment-or-uncomment-to-the-line
	    "cc" 'evilnc-copy-and-comment-lines
	    "cp" 'evilnc-comment-or-uncomment-paragraphs
	    "cr" 'comment-or-uncomment-region
	    "cv" 'evilnc-toggle-invert-comment-line-by-line
	    "c." 'evilnc-copy-and-comment-operator
	    "c," 'evilnc-comment-operator))

;; Which-key 配置
(use-package which-key
  :config (which-key-mode 1))

(provide 'init-packages)
