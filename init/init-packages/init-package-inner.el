;;; -*- lexical-binding: t; -*-

;; 在图形界面的菜单中打开最近编辑过的文件。
(leaf recentf
  ;; :hook ("C-x C-r" . recentf-open-files)
  :config (recentf-mode 1)
  :setq (recentf-max-menu-item . 10))

;; 编程模式下打开代码块折叠功能
(leaf hideshow
  :hook (prog-mode-hook . hs-minor-mode))

;; 设置 Hippie Expand
(leaf hippie-exp
  :bind ("<backtab>" . hippie-expand)
  :setq (hippie-expand-try-functions-list
         . '(try-expand-debbrev
             try-expand-debbrev-all-buffers
             try-expand-debbrev-from-kill
             try-complete-file-name-partially
             try-complete-file-name
             try-expand-all-abbrevs
             try-expand-list
             try-expand-line
             try-complete-lisp-symbol-partially
             try-complete-lisp-symbol)))

;; 设置 ibuffer
(leaf ibuffer
  :bind ([remap list-buffers] . ibuffer))

;; 配置 dired
(leaf dired
  :setq (dired-kill-when-opening-new-dired-buffer . t)
  :ensure nil)

;; 启用 dired-x
(leaf dired-x
  :after dired
  :ensure nil)

(leaf project)

(provide 'init-package-inner)
