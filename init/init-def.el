;;; -*- lexical-binding: t; -*-

;; (defvar init-directory (locate-user-emacs-file "init/")
;;   "The directory where the init files are.")

(let* ((init-files (obarray-make))
       (find-init-files (lambda ()
                          (dolist (file (nconc (directory-files-recursively
                                                init-directory "^init-.+\\.el$")
                                               (list early-init-file
                                                     user-init-file
                                                     custom-file))
                                        init-files)
                            (set (intern (file-name-nondirectory file)
                                         init-files) file)))))
  ;; 快速打开配置文件
  (defun open-init-files (init-file)
    "Open init file quickly."
    (interactive
     (list (completing-read
	        "Which initialize file do you wanna (re)write: "
            (funcall find-init-files))))
    (unless (called-interactively-p 'interactive)
      (funcall find-init-files))
    (find-file (let ((file (intern-soft init-file init-files)))
                 (if file
                     (symbol-value file)
                   (expand-file-name init-file init-directory))))
    (setq init-files (obarray-make))))

;; 隐藏 DOS / Windows 下的^M换行符
(defun hidden-dos-eol ()
  "Hide ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(provide 'init-def)
