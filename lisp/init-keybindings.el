
;; 源码查找
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 去掉 C-z 绑定
(global-unset-key (kbd "C-z"))

(provide 'init-keybindings)
