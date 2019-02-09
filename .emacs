;; Display the name of the current buffer in the title bar

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "SF Mono" :foundry "APPL" :slant normal :weight normal :height 113 :width normal)))))

(setq frame-title-format "GNU Emacs: %b")

;; Inhbit startup/splash screen
(setq inhibit-splash-screen   t)
(setq inhibit-startup-message t) ;; can be shown using C-h C-a

;; Disable GUI components
(tooltip-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq use-dialog-box nil)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)
 
;; Electric-modes settings
(electric-pair-mode    1) ;; auto {},[],()

;; Linum plugin
(require 'linum)
(line-number-mode   t) ;; show string number in mode-line
(global-linum-mode  t) ;; show line numbers in all buffers
(column-number-mode t) ;; show column number in mode-line
(setq linum-format "%4d \u2502 ") ;; set the format of row numbers

;; Display time in mode-line
(display-time-mode t)


;; Buffer Selection and ibuffer settings
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "<f2>") 'bs-show)

;; Scrolling settings
(setq scroll-step               1)
(setq scroll-margin            10)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; Clipboard settings
(setq x-select-enable-clipboard t)

;; Highlight search results
(setq search-highlight        t)
(setq query-replace-highlight t)

(desktop-save-mode t)

(windmove-default-keybindings 'meta)

(global-set-key(kbd "<f6>") 'shell)

(show-paren-mode 1)
(setq show-paren-style 'mixed)

;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.milkbox.net/packages/"))
(package-initialize)
