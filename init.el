; 宋坤的配置

;; F1 打开 init.el 配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f1>") 'open-init-file)

;; 配置文件路径
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

;; ace 分屏跳转
(global-set-key (kbd "M-o") 'ace-window)

;; 全局自动补全
(global-company-mode t)

;; 自动匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 选中编辑删除
(delete-selection-mode t)

(add-to-list 'exec-path "/usr/local/bin")

