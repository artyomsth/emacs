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

;; Disable backup/autosave files
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

;; Line wrapping
(setq word-wrap          t)
(global-visual-line-mode t)

(global-set-key [f4] 'next-error)
(global-set-key [f3] 'previous-error)
(global-set-key [f6] 'shell)
(global-set-key [f9] 'compile)
(global-set-key "\M-g" 'goto-line)

;; C
(require 'cc-mode)

(global-font-lock-mode 1)

(setq tab-width 4)
(define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
(define-key c-mode-map "\C-ce" 'c-comment-edit)
(setq c-auto-hungry-initial-state 'none)
(setq c-delete-function 'backward-delete-char)
(setq c-tab-always-indent t)

;; compilation-window-height
(setq compilation-window-height 8)

;; Hide compilation buffer if no compilation errors
(setq compilation-finish-function
      (lambda (buf str)
        (if (string-match "exited abnormally" str)
            ;;there were errors
            (message "compilation errors, press C-x ` to visit")
          ;;no errors, make the compilation window go away in 0.5 seconds
          (run-at-time 0.5 nil 'delete-windows-on buf)
          (message "NO COMPILATION ERRORS!"))))

(add-hook 'c-mode-hook        
          '(lambda ( ) 
             (c-set-style "k&r")))

;; Autodetect highlight
(defvar font-lock-auto-mode-list 
        (list 'c-mode 'c++-mode 'c++-c-mode 'emacs-lisp-mode 'lisp-mode 'perl-mode 'scheme-mode)
         "List of modes to always start in font-lock-mode")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso))))
