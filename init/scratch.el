;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with SPC f and enter text in its buffer.

(let* ((init-cons (cl-loop for file in `(,user-init-file
					 ,custom-file
					 ,@(directory-files
					    "~/.emacs.d/init" t
					    "^init-\\w+\\.el$"))
			   for nondir = (file-name-nondirectory file)
			   collect (cons nondir file) into cons-map
			   finally return cons-map)))
  (defun open-init-files (init-files)
  "快速打开配置文件"
  (interactive
   (list (completing-read
	  "Which initialize file do you wanna (re)write: "
	  (cl-loop for map in init-cons collect (car map)))))
  (if ())
  (find-file init-files)))

(cl-loop for file in `(,user-init-file
		       ,custom-file
		       ,@(directory-files "~/.emacs.d/init" t
					  "^init-\\w+\\.el$"))
	 for nondir = (file-name-nondirectory file)
	 collect (cons nondir file) into cons-map
	 finally return cons-map)

