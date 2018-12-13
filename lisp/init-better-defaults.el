;; 修改默认配置

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

;; 禁止备份文件（xx~），备份文件不利于版本管理
(setq make-backup-files nil)

;; 防止出现 auto-save-list 文件夹
(setq auto-save-default nil)

;; 光标形状
(setq-default cursor-type 'bar)

;; 最近打开文件
(require 'recentf)
(recentf-mode 1)  ;; 1 == t
(setq recentf-max-menu-items 25)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 关闭声音提示
(setq ring-bell-function 'ignore)

;; global variables
(setq
 create-lockfiles nil
 scroll-error-top-bottom t
 show-paren-delay 0.2
 use-package-always-ensure t
 sentence-end-double-space nil)

(provide 'init-better-defaults)
