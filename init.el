; 宋坤的配置

;; 配置文件路径
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-custom)


;; ace 分屏跳转
(global-set-key (kbd "M-o") 'ace-window)

;; 全局自动补全
(global-company-mode t)

;; 文档语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 自动匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 选中编辑删除
(delete-selection-mode t)

(add-to-list 'exec-path "/usr/local/bin")

