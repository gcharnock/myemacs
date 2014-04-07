
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;;(global-linum-mode 1) ; always show line numbers

;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
;;(load "ess.el" nil t t)

(setq indent-tabs-mode nil) 

(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))

(setq-default c-basic-offset 4)
(setq tab-width 4)

(setq c-mode-hook
    (function (lambda ()
		(setq tab-width 4)
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq c++-mode-hook
    (function (lambda ()
		(setq tab-width 4)
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))

(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

;disable backup
(setq make-backup-files nil)
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 81 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(haskell-literate-default (quote bird)))
(put 'erase-buffer 'disabled nil)
