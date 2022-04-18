(setq startup/gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(defun startup/reset-gc () (setq gc-cons-threshold startup/gc-cons-threshold))
(add-hook 'emacs-startup-hook 'startup/reset-gc)

(use-package package
  :init
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
  (package-refresh-contents))

;; Disable Code Wrapping
(set-default 'truncate-lines t)


;; Prettify Lambda to be symbol
(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'scheme-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)

;; Disable UI tools
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;(load "preview-latex.el" nil t t)

;; inferior lisp program
(setq inferior-lisp-program "sbcl")

;; ido mode!
(setq ido-separator "\n")

;; Change horizontal orientation to vertical

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

;;Load font
(set-frame-font "DejaVu Sans Mono Nerd Font 18" nil t)

;; Enable Electric mode 
(electric-pair-mode 1)
(indent-relative nil)
(set-default 'electric-indent-just-newline nil)

;; Aggressive indent mode
(use-package aggressive-indent
  :init
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'scheme-mode-hook #'aggressive-indent-mode))


;; Smart Parens Mode
;; (require 'smartparens-config)
;; Always start smartparens mode in scheme-mode.
;; (add-hook 'scheme-mode-hook #'smartparens-mode)

;; Org mode keybindings
(use-package org
  :bind (("C-c a" . org-agenda)
	 ("C-c c"  . org-capture)
	 ("C-c l" . org-store-link)))

;; Org mode bullets!
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; doom-modeline! make it more cool :)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; This is a collection of Evil bindings for the parts of Emacs that Evil does not cover properly by default, such as help-mode, M-x calendar, Eshell and more.
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t) ;; Fix evil scroll up bug
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Evil leader key! for more straigth forward shortcutkeys
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>bb") 'ido-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>ww") 'other-window)


;; Enable rainbow-delimeters
;;(require 'rainbow-delimiters)
;; Start rainbow-delimeters in some modes
;;(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

;; Enable rainbow-identifiers in most programming modes
;;(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;; highlight numbers
(use-package highlight-numbers
  :init
  '(highlight-numbers-number ((t (:foreground "#d3869b"))))
  (add-hook 'scheme-mode-hook 'highlight-numbers-mode))

;; Enable TreeSitter
(use-package tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Enable Doom Themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)
	      ("C-f" . vertico-exit))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  

;; marginalia
(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; Updating packages automatically
(use-package auto-package-update
  :custom
  (auto-package-update-interval7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "9:00"))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Add hook to modes ParEdit
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(package-selected-packages
   '(pdf-tools auctex auto-package-update marginalia highlight-numbers rainbow-identifiers doom-modeline all-the-icons evil-leader evil-collection slime org-bullets orgit vterm aggressive-indent doom-themes tree-sitter-langs tree-sitter darcula-theme paredit rainbow-delimiters smartparens vertico gruvbox-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "dim gray"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "dim gray")))))

;; Load theme
;;(load-theme 'gruvbox)
;;(load-theme 'darcula)





















