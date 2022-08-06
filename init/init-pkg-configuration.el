;;; -*- lexical-binding: t; -*-

;; 软件源
(setq package-archives
      '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;; 若 leaf 没有安装，安装之
(unless (package-installed-p 'leaf)
  (package-refresh-contents)
  (package-install 'leaf))

(with-eval-after-load 'leaf
  ;; 设置 `leaf-defaults' 中 `:ensure' 为真，让 leaf 自动下载缺失的软件包
  (setq leaf-defaults '(:ensure t))
  (let ((alias (assoc-default :ensure leaf-alias-keyword-alist #'eq :ensure)))
    (plist-put leaf-keywords alias
               `(let (value)
                  (setq leaf--value
                        (dolist (elm leaf--value value)
                          (unless (package-built-in-p (car elm))
                            (push elm value))))
                  ,(plist-get leaf-keywords alias)))))

(provide 'init-pkg-configuration)
