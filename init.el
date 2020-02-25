;; 初始化软件包管理器
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/init/")

(require 'init-def)
(require 'init-packages)
(require 'init-ui)
(require 'init-enrich)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "init/custom.el" user-emacs-directory))

(load-file custom-file)
