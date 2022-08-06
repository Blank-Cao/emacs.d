;;; -*- lexical-binding: t; -*-

;; Org-mode 设置
(leaf org
  :custom (org-src-fontify-natively . t) ; Org-mode 语法高亮
  )

(leaf org-agenda
  :bind ("C-c a" . org-agenda)
  :custom (org-agenda-files . '("~/org")) ; 设置默认 Org Agenda 文件目录
  :ensure nil)

(provide 'init-org)
