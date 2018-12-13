;; 加载主题
(add-to-list 'sk/packages 'spacemacs-theme)
(load-theme 'spacemacs-dark t)

;; 关闭启动提示
(setq inhibit-startup-screen t)

;; 启动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 显式行号
(global-linum-mode t)

;; 显式列号
(column-number-mode t)

;; 去掉工具栏
(tool-bar-mode -1)

;; 去掉侧滑栏
(scroll-bar-mode -1)

;; 高亮当前行
(global-hl-line-mode 1)

(setq-default fill-column 80)

;; 文档语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 光标形状
(setq-default cursor-type 'bar)


(provide 'init-ui)
