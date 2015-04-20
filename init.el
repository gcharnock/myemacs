
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

;;Haskell bits

(add-hook 'haskell-cabal-mode-hook
 (lambda () (setq indent-tabs-mode nil)))

(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(add-hook 'haskell-mode-hook 'ghc-init)

;;This mode is a bad idea
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

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
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
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


(require 'cl)
;;(require 'eclim)
;;(require 'eclimd)
;;(global-eclim-mode)

(require 'company)
;;(require 'company-emacs-eclim)
;;(company-emacs-eclim-setup)
(global-company-mode t)

;;(setq eclimd-executable "/home/gareth/usr/eclipse/eclimd")

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default indent-tabs-mode nil)


(put 'erase-buffer 'disabled nil)

(custom-set-variables '(coffee-tab-width 2))

(set-default 'truncate-lines t)
(setq truncate-partial-width-windows t)

;;(setq dired-recursive-copies 'always')

;; (global-set-key (kbd "C-i") 'eclim-java-show-documentation-for-current-element)
;; (global-set-key (kbd "C-o") 'company-complete)
;; (global-set-key (kbd "C-;") 'eclim-java-find-declaration)
;; (global-set-key (kbd "C-'") 'eclim-java-find-references)
;; (global-set-key (kbd "C-#") 'eclim-java-refactor-rename-symbol-at-point)
;; (global-set-key (kbd "C-x C-i") 'eclim-java-import-organize)

(global-set-key (kbd "TAB") 'indent-for-tab-command)

(setq tab-width 4)
(standard-display-ascii ?\t "!TAB")

(defun show-tabs () "" (interactive)
  (standard-display-ascii ?\t "!TAB")
)

(defun hide-tabs () "" (interactive)
  (standard-display-ascii ?\t "\t")
)


(defun string-replace (from to string &optional re)
  "Replace all occurrences of FROM with TO in STRING.
  All arguments are strings.
  When optional fourth argument is non-nil, treat the from as a regular expression."
  (let ((pos 0)
        (res "")
        (from (if re from (regexp-quote from))))
    (while (< pos (length string))
      (if (setq beg (string-match from string pos))
          (progn
            (setq res (concat res
                              (substring string pos (match-beginning 0))
                              to))
            (setq pos (match-end 0)))
        (progn
          (setq res (concat res (substring string pos (length string))))
          (setq pos (length string)))))
    res))

(defun toggle-test () "" (interactive)
  (setq target
      (if (string-match "/main/" buffer-file-name)
          (replace-regexp-in-string "/main/" "/test/" buffer-file-name)
          (replace-regexp-in-string "/test/" "/main/" buffer-file-name))
  (find-file target)))

(defun espeak-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command
     (concat "espeak \"" (buffer-substring-no-properties start end) "\"")))


;;(standard-display-ascii ?\t "    ")

(global-set-key (kbd "C-c C-s") 'espeak-region)
(global-set-key "\C-cy" '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

