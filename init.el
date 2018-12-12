; 宋坤的配置

;;(setq url-proxy-services
;;   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;     ("http" . "127.0.0.1:3132")
;;     ("https" . "127.0.0.1:3132")))

;; C-x C-f 目录
;;(setq default-directory "D:/")

;; 解决 windows 卡顿
(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect)
  (setq garbage-collection-messages t))

(setq inhibit-compacting-font-caches t)

;; 包管理器
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 1)))
(package-initialize)

;; cl - Common Lisp Extension
(require 'cl)

;; 添加包
(defvar my/packages '(
                ensime
                evil
                undo-tree
                company
                hungry-delete
                swiper
                counsel
                smartparens
                exec-path-from-shell
                spacemacs-theme	      
                magit
                ace-window
                markdown-mode
                ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 开启 Evili
(require 'evil)
(evil-mode 1)

;; swiper 配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; ace 分屏跳转
(global-set-key (kbd "M-o") 'ace-window)

;; 启动加载主题
(add-to-list 'my/packages 'spacemacs-theme)
(load-theme 'spacemacs-dark t)

;; 括号补全
(require 'smartparens-config)
(smartparens-global-mode t)

;; 关闭默认启动提示
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

;; 全局自动补全
(global-company-mode t)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 光标
(setq-default cursor-type 'bar)
(setq evil-insert-state-cursor 'bar)

;; 禁止备份文件（xx~），备份文件不利于版本管理
(setq make-backup-files nil)

;; 文档语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 自动匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮当前行
(global-hl-line-mode 1)

;; 最近打开文件
(require 'recentf)
(recentf-mode 1)  ;; 1 == t
(setq recentf-max-menu-items 25)

;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; F1 打开 init.el 配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f1>") 'open-init-file)

;; 选中编辑删除
(delete-selection-mode t)

;; 源码查找函数，绑定到快捷键，通过 counsel 实现，此处注释掉
;;(global-set-key (kbd "C-c C-f") 'find-function)
;;(global-set-key (kbd "C-c C-v") 'find-variable)
;;(global-set-key (kbd "C-c C-k") 'find-function-on-key)

;; global variables
(setq
 create-lockfiles nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; global keybindings
(global-unset-key (kbd "C-z"))

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package ensime
  :ensure t
  :pin melpa-stable)

(add-to-list 'exec-path "/usr/local/bin")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 2)
 '(package-selected-packages
   (quote
    (ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum livid-mode linum-relative link-hint json-mode js2-refactor js-doc intero info+ indent-guide hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-hoogle helm-flx helm-descbinds helm-ag haskell-snippets google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ensime elisp-slime-nav dumb-jump diminish define-word company-ghci company-ghc column-enforce-mode coffee-mode cmm-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(solarized-height-plus-1 1.2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
