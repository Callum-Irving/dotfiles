(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq gc-cons-threshold 33554432) ;; 32mb
(setq lsp-use-plists t)
(setq comp-deferred-compilation t)

;; Enable mode diminishing
(use-package diminish)

(use-package undo-fu)

;; Vim keybinds
(use-package evil
  :config
  (evil-mode 1)
  :custom
  (evil-split-window-below t)
  (evil-vsplit-window-right t)
  (evil-undo-system 'undo-fu))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Themes
(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

(set-frame-font "Cascadia Code 12" nil t)
(column-number-mode 1)
(global-display-line-numbers-mode t) ;; TODO: Disable for term
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1) (show-paren-mode 1)

;; LSP configuration
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-l"
         lsp-prefer-flymake nil
         lsp-signature-render-documentation nil
         lsp-lens-enable nil)
  :bind (:map lsp-mode-map
	      ("C-c C-c r" . lsp-rename))
  :commands lsp lsp-deferred)

(use-package lsp-ui
  :init (setq lsp-ui-sideline-update-mode 'line
         lsp-ui-sideline-enable t
         lsp-ui-sideline-show-code-actions t
         lsp-ui-sideline-show-hover nil
         lsp-ui-sideline-ignore-duplicate t))

(use-package flycheck)

(use-package rustic
  :config
  (setq rustic-format-on-save t))

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

;; Ivy
(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

;; Completion
(use-package company
  :diminish
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 3)
  (company-selection-wrap-around t)
  :bind (("C-SPC" . company-complete)
	 :map company-active-map
 	 ("C-c C-c C-n" . company-select-next)
 	 ("C-c C-c C-p" . company-select-previous)))

;; Disable auto-save and backup files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Better scrolling
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Keybinds
(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer my-leader-def :prefix "SPC")
  (my-leader-def
   :states '(normal)
   "m" 'evil-window-vnew
   "n" 'evil-window-new
   "h" 'windmove-left
   "j" 'windmove-down
   "k" 'windmove-up
   "l" 'windmove-right)
  (general-define-key
   :states 'insert
   "C-j" 'company-select-next
   "C-k" 'company-select-previous)
  (general-define-key
   :states 'normal
   "K" 'lsp-describe-thing-at-point
   "C-p" 'projectile-find-file)
  (general-define-key
   :states 'emacs
   "<escape>" 'evil-normal-state))

(use-package projectile
  :config
  (projectile-mode 1)
  :init (setq projectile-project-search-path '("~/Projects/"))
  :bind ("C-S-p" . projectile-switch-project))

(use-package vterm
  :commands vterm
  :config
  ;; (setq term-prompt-regexp "^[a-z_][a-z0-9_-]{0,31}@[a-z_][a-z0-9_-]{0,31}:\[[a-zA-Z0-9_\.-~]+\]>")  ;; Set this to match your custom shell prompt
  (setq vterm-max-scrollback 500)
  (set-face-attribute 'vterm-color-black nil   :foreground "#000000" :background "#002b36")
  (set-face-attribute 'vterm-color-red nil     :foreground "#f43841" :background "#cb4b16")
  (set-face-attribute 'vterm-color-green nil   :foreground "#73c936" :background "#586e75")
  (set-face-attribute 'vterm-color-yellow nil  :foreground "#ffdd33" :background "#657b83")
  (set-face-attribute 'vterm-color-blue nil    :foreground "#96a6c8" :background "#839496")
  (set-face-attribute 'vterm-color-magenta nil :foreground "#d33682" :background "#6c71c4")
  (set-face-attribute 'vterm-color-cyan nil    :foreground "#52abde" :background "#93a1a1")
  (set-face-attribute 'vterm-color-white nil   :foreground "#ffffff" :background "#fdf6e3"))

(use-package magit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit vterm
	   ("use-package")
	   "use-package" "use-package" undo-fu rustic projectile lsp-ui lsp-pyright ivy gruber-darker-theme general flycheck evil diminish company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
