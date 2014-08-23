
;;Package management
(require 'package)
(add-to-list 'package-archives 
         '("melpa" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)


;;General Configuration
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(global-linum-mode 1) ; always show line numbers
(setq indent-tabs-mode nil)

;disable backup
(setq make-backup-files nil)
(setq backup-inhibited t)

;disable auto save
(setq auto-save-default nil)

;;Haskell bigs

(add-hook 'haskell-cabal-mode-hook
 (lambda () (setq indent-tabs-mode nil)))

(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(setq ghc-debug t)

;;C stuff
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




(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

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
 '(haskell-literate-default (quote bird))
 '(safe-local-variable-values (quote ((haskell-process-use-ghci . t) (haskell-indent-spaces . 4)))))
(put 'erase-buffer 'disabled nil)


(menu-bar-mode -1)
(tool-bar-mode -1) 
(toggle-scroll-bar -1) 
(global-linum-mode 1)
(put 'erase-buffer 'disabled nil)


