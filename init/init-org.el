;; Org-mode 语法高亮
(use-package org
  :config (setq org-src-fontify-natively t)
  :defer t
  :ensure nil)

(use-package org-agenda
  :bind ("C-c a" . org-agenda)
  :config
  (setq org-agenda-files '("~/org")) ; 设置默认 Org Agenda 文件目录
  :ensure nil)

(provide 'init-org)
