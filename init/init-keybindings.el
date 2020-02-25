;;; -*- lexical-binding: t; -*-

;; 为 open-init-files 函数设置快捷键
(global-set-key (kbd "<f12>") #'open-init-files)

;; 配置快捷键
(evil-leader/set-key 
  "f" #'find-file ; 打开文件
  "b" #'switch-to-buffer ; 打开缓冲区
  "xb" #'list-buffers ; 列出缓冲区
  "d" #'dired ; 打开 dired
  "i" #'insert-file ; 在当前 buffer 插入文件内容
  "s" #'save-buffer ; 保存文件
  "w" #'write-file ; 文件另存为
  "xc" #'save-buffers-kill-terminal ; 关闭emacs
  "o3" #'split-window-right ; 在右边新建窗口 
  "o2" #'split-window-below ; 在下边新建窗口
  "o1" #'delete-other-windows ; 关闭其他窗口
  "o0" #'delete-window ; 关闭本窗口
  )
(evil-leader/set-key-for-mode #'emacs-lisp-mode
  "xe" #'eval-last-sexp ; 执行当前语句
  )
(evil-leader/set-key-for-mode #'lisp-interaction-mode
  "xe" #'eval-last-sexp ; 执行当前语句
  "j" #'eval-print-last-sexp ; 执行当前语句并在当前 buffer 输出
  )

(provide 'init-keybindings)
