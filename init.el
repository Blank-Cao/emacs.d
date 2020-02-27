;;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 50 1024 1024))

(add-to-list 'load-path "~/.emacs.d/init/")

(when (load "~/.emacs.d/benchmark-init/benchmark-init-autoloads.el")
  (benchmark-init/activate))

(with-eval-after-load (require 'init-usepackage)
  (with-eval-after-load (require 'init-def)
    (require 'init-enrich)
    (require 'init-packages)
    (require 'init-ui)
    (require 'init-org)
    (require 'init-keybindings)))

(setq custom-file (expand-file-name "init/custom.el" user-emacs-directory))
(load-file custom-file)

(setq gc-cons-threshold 800000)


