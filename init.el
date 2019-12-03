;;https://melpa.org/#/getting-started
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;;https://github.com/jwiegley/use-package
(eval-when-compile
  (require 'use-package))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (treemacs helm-projectile projectile drag-stuff helm zenburn-theme use-package)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; https://www.emacswiki.org/emacs/LineNumbers
(use-package display-line-numbers
  :if (version<= "26.0.50" emacs-version) 
  :config
  (global-display-line-numbers-mode) )


;; https://github.com/bbatsov/zenburn-emacs
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))


;; https://github.com/emacs-helm/helm
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x r b" . helm-filtered-bookmarks)
	 ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1))


;; https://www.emacswiki.org/emacs/WindMove
(use-package windmove
  :bind (("S-<up>" . windmove-up)
	 ("S-<left>" . windmove-left)
	 ("S-<down>" . windmove-down)
	 ("S-<right>" . windmove-right)))


;; https://github.com/rejeep/drag-stuff.el
(use-package drag-stuff
  :ensure t
  :bind (("M-<up>" . drag-stuff-up)
	 ("M-<left>" . drag-stuff-left)
	 ("M-<down>" . drag-stuff-down)
	 ("M-<right>" . drag-stuff-right))
  :config
  (drag-stuff-global-mode 1))


;;https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map))


;;https://github.com/bbatsov/helm-projectile
(use-package helm-projectile
  :after (helm projectile)
  :ensure t
  :config
  (helm-projectile-on))


;;https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t
  :defer t)
