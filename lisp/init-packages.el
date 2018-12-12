;; 插件管理

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
(defvar sk/packages '(
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

(setq package-selected-packages sk/packages)

(defun sk/packages-installed-p ()
     (loop for pkg in sk/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

(unless (sk/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg sk/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq package-selected-packages sk/packages)

(provide 'init-packages)
