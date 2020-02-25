;; 软件源
(setq package-archives '(("gnu" . "https://elpa.emacs-china.org/gnu/")
			 ("melpa" . "https://elpa.emacs-china.org/melpa/")))

;; 自动安装缺失的插件
(setq use-package-always-ensure t)

;; 开启全局 Company 补全
(use-package company
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
	 ("M-n" . nil)
	 ("M-p" . nil)
	 ("C-n" . #'company-select-next)
	 ("C-p" . #'company-select-previous)
	 ))

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
  :bind ("C-s" . #'swiper-isearch)
  :config (setq search-default-mode #'char-fold-to-regexp))

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
  :mode "\\.js\\'"
  :defer t)
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
	            web-mode-code-indent-offset 4)))
  :defer t)

;; window-numbering 配置
(use-package window-numbering
  :after evil-leader
  :config
  (progn
    (window-numbering-mode 1)
    ;; 将数字0-9绑定到对应的 select-window-x 函数上
    (apply #'evil-leader/set-key
	   (cl-loop for i below 10
		    for s = (number-to-string i)
		    collect s
		    collect (intern (concat "select-window-" s))))))

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
  :commands (evilnc-default-hotkeys)
  :config (progn
	    (define-key evil-normal-state-map
	      (kbd (concat evil-leader/leader " ;"))
	      'evilnc-comment-or-uncomment-lines)
	    (define-key evil-visual-state-map
	      (kbd (concat evil-leader/leader " ;"))
	      'evilnc-comment-or-uncomment-lines)))

;; Which-key 配置
(use-package which-key
  :config (which-key-mode 1))

(provide 'init-packages)
