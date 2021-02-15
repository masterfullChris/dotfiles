;;; Package --- Summary

;;; Commentary.


;;; Code:
(require 'package)

(package-initialize)


(add-to-list 'package-archives
	     '("melpa" . "https://www.melpa.org/packages/") t)



(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 5)
(setq visible-bell t)


(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'default-frame-alist '(fullscreen . maximized))




(unless (package-installed-p 'use-package)
  (package-install 'use-package)
  (package-refresh-contents))


(use-package doom-modeline
  :ensure t
  :config (doom-modeline-mode t))

(use-package doom-themes
  :ensure t)

(use-package all-the-icons
  :ensure  t)

(use-package company
  :ensure t
  :config (global-company-mode t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" default))
 '(org-agenda-files '("~/Documents/proj/org/myurlaub.org"))
 '(package-selected-packages
   '(mpdel undo-tree which-key projectile magit ivy-rich emmet-mode emmet flycheck helpful helpfull pdf-tools org-bullets counsel ivy use-package doom-themes doom-modeline company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package ivy-rich
  :ensure t
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

(use-package counsel
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda()(org-bullets-mode t))))



(org-babel-do-load-languages
 'org-babel-load-languages
 '(( python . t)
   (shell . t)))


(use-package pdf-tools
  :ensure t)

(use-package helpful
  :ensure t
  :config
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))


(use-package flycheck
  :ensure t
  :config (flycheck-mode t))


(global-set-key (kbd "C-x C-b") 'counsel-switch-buffer)
(global-set-key (kbd "C-x b") 'ibuffer-other-window)



(defun my/split-windows-horizontally()
  "Splits the current window horizontally."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))




(defun my/split-windows-vertically()
  "Splits the current window vertically."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))


(global-set-key (kbd "C-x 2") 'my/split-windows-horizontally)
(global-set-key (kbd "C-x 3") 'my/split-windows-vertically)

(pdf-tools-install)

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))


(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))


(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


(use-package undo-tree
  :ensure t
  :config
  (undo-tree-mode))



(global-set-key (kbd "C-x C-j") 'dired-jump)

(global-set-key (kbd "C-c a") 'org-agenda)



(load-theme 'doom-gruvbox t)
;;; init.el ends here.
