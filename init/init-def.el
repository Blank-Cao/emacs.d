(defun open-init-files (init-files)
  "快速打开配置文件"
  (interactive
   (list (completing-read
	  "Which initialize file do you wanna (re)write: "
	  `(,user-init-file
	    ,custom-file
	    ,@(directory-files "~/.emacs.d/init" t "^init-\\w+\\.el$")))))
  (find-file init-files))

(defun evil-normal-state-with-company ()
  "company 和 evil 共存时让 company 能用 <escape> 退出而不影响 evil"
  (interactive)
  (if (eq (company--active-p) nil)
      (evil-normal-state)
    (company-abort)))

(provide 'init-def)
