; 宋坤的配置

;; 配置文件路径
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-better-defaults)
(require 'init-swiper)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-custom)

;; 开启 Evil
(require 'evil)
(evil-mode 1)

;; ace 分屏跳转
(global-set-key (kbd "M-o") 'ace-window)

;; 括号补全
(require 'smartparens-config)
(smartparens-global-mode t)

;; 全局自动补全
(global-company-mode t)

(setq evil-insert-state-cursor 'bar)

;; 文档语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 自动匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 选中编辑删除
(delete-selection-mode t)

(add-to-list 'exec-path "/usr/local/bin")

