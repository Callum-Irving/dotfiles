(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq gc-cons-threshold 33554432) ;; 32mb
(setq lsp-use-plists t)
(setq comp-deferred-compilation t)
(setq inhibit-eol-conversion t)

;; Set fonts
(set-face-attribute 'default nil :font "Cascadia Code" :height 120 :weight 'normal)
(set-face-attribute 'fixed-pitch nil :font "Cascadia Code" :height 120 :weight 'normal)
;; (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 120 :weight 'normal)

;; Disable auto-save and backup files
(setq auto-save-default nil)
(setq make-backup-files nil)

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

(column-number-mode 1)
(global-display-line-numbers-mode t) ;; TODO: Disable for term
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1) (show-paren-mode 1)

;; LSP configuration
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-l"
         lsp-log-io t
         lsp-signature-render-documentation nil
         lsp-lens-enable nil)
  :bind (:map lsp-mode-map
	      ("C-c C-c r" . lsp-rename))
  :commands lsp)

(use-package lsp-ui
  :init (setq lsp-ui-sideline-update-mode 'line
         lsp-ui-sideline-enable t
         lsp-ui-sideline-show-code-actions t
         lsp-ui-sideline-show-hover nil
         lsp-ui-sideline-ignore-duplicate t))

(use-package rustic
  :config
  (setq rustic-format-on-save t))

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

(use-package haskell-mode)

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
  (crompany-selection-wrap-around t)
  :bind (("C-SPC" . company-complete)
	 :map company-active-map
 	 ("C-c C-c C-n" . company-select-next)
 	 ("C-c C-c C-p" . company-select-previous)))

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
   "m" 'evil-window-vsplit
   "n" 'evil-window-split
   ;; "m" (lambda () (interactive) (evil-window-vsplit) (call-interactively 'switch-to-buffer))
   ;; "n" (lambda () (interactive) (evil-window-split) (call-interactively 'switch-to-buffer))
   "h" 'windmove-left
   "j" 'windmove-down
   "k" 'windmove-up
   "l" 'windmove-right)
  (general-define-key
   :states 'insert
   :keymaps 'company-active-map
   "C-j" 'company-select-next
   "C-k" 'company-select-previous)
  (general-define-key
   :states 'normal
   "K" 'lsp-describe-thing-at-point
   "C-p" 'projectile-find-file
   :keymaps 'org-mode-map
   "C-j" 'org-next-visible-heading
   "C-k" 'org-previous-visible-heading
   "M-h" 'org-metaleft
   "M-j" 'org-metadown
   "M-k" 'org-metaup
   "M-l" 'org-metaright
   "M-H" 'org-shiftmetaleft
   "M-J" 'org-shiftmetadown
   "M-K" 'org-shiftmetaup
   "M-L" 'org-shiftmetaright
   "<tab>" 'org-cycle)
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

(defun org-mode-setup ()
  ;; (variable-pitch-mode 1)
  (visual-line-mode 1)
  (display-line-numbers-mode -1)
  (setq evil-auto-indent nil
        org-hide-emphasis-markers nil)
  (org-indent-mode))

(use-package org
  :pin org
  :hook (org-mode . org-mode-setup))
  ;; :config
  ;; (setq org-hide-emphasis-markers t)
  ;; ;; (set-face-attribute 'org-document-title nil :font "Cantarell" :weight 'bold :height 1.3)
  ;; ;; (dolist (face '((org-level-1 . 1.2)
  ;; ;;                 (org-level-2 . 1.1)
  ;; ;;                 (org-level-3 . 1.05)
  ;; ;;                 (org-level-4 . 1.0)
  ;; ;;                 (org-level-5 . 1.1)
  ;; ;;                 (org-level-6 . 1.1)
  ;; ;;                 (org-level-7 . 1.1)
  ;; ;;                 (org-level-8 . 1.1)))
  ;; ;;   (set-face-attribute (car face) nil :font "Cantarell" :weight 'medium :height (cdr face)))
  ;; (require 'org-indent)
  ;; (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  ;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  ;; (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  ;; (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  ;; (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  ;; (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-column nil :background nil)
  ;; (set-face-attribute 'org-column-title nil :background nil))



;; DON'T TOUCH
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(with-editor haskell-mode magit
      ("use-package")
      "use-package" "use-package")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
