;; 自定义行为

;; F1 打开 init.el 配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f1>") 'open-init-file)


(provide 'init-custom)
