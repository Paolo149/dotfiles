
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)


;; Fix evil scroll up bug
(setq evil-want-C-u-scroll t)

;; Prettify Lambda to be symbol
(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'scheme-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)

; Disable UI tools
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Disable Code Wrapping
(toggle-truncate-lines 1)

;;Load font
(set-frame-font "DejaVu Sans Mono Nerd Font 22" nil t)

;; Enable Electric mode 
(electric-pair-mode 1)

;Smart Parens Mode
;(require 'smartparens-config)
;;; Always start smartparens mode in scheme-mode.
;(add-hook 'scheme-mode-hook #'smartparens-mode)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Enable rainbow-delimeters
(require 'rainbow-delimiters)
;; Start rainbow-delimeters in some modes
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

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

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

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
   '(aggressive-indent doom-themes tree-sitter-langs tree-sitter darcula-theme paredit rainbow-delimiters smartparens vertico gruvbox-theme evil)))
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
;(load-theme 'gruvbox)
;(load-theme 'darcula)


