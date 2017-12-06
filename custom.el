(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(package-selected-packages
   (quote
    (tabbar-ruler highlight-symbol popup-complete auto-yasnippet yasnippet auto-complete-c-headers auto-complete-clang auto-complete uptimes crontab-mode yagist whole-line-or-region whitespace-cleanup-mode wgrep-ag vc-darcs unfill undo-tree symbol-overlay switch-window smex session scratch rainbow-delimiters projectile project-local-variables page-break-lines nlinum multiple-cursors move-dup mmm-mode magit-gh-pulls list-unicode-display ivy-historian indent-guide ibuffer-vc highlight-escape-sequences guide-key gitignore-mode github-issues github-clone gitconfig-mode git-timemachine git-messenger git-blamed fullframe flycheck-color-mode-line fill-column-indicator expand-region exec-path-from-shell disable-mouse dired-sort dired+ diminish diff-hl default-text-scale darcsum counsel company-quickhelp command-log-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmd-to-echo bug-reference-github browse-kill-ring browse-at-remote avy anzu alert ag)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-linum-mode t)
(column-number-mode t)

(require 'auto-complete-config)(ac-config-default)
(require 'yasnippet)(yas/global-mode 1)
(require 'auto-complete-clang)
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
(define-key ac-mode-map [(control tab)] 'auto-complete)
(defun my-ac-config () (setq ac-clang-flags (mapcar(lambda (item)(concat "-I" item))
                                                   (split-string "
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
/usr/local/include
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/8.0.0/include
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
/usr/include
/System/Library/Frameworks
/Library/Frameworks
")))
       (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
       (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
       ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
       (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
       (add-hook 'css-mode-hook 'ac-css-mode-setup)
       (add-hook 'auto-complete-mode-hook 'ac-common-setup)
       (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
;; setting highlight-symbol
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; setting tabbar-ruler
(setq tabbar-ruler-global-tabbar t)    ; get tabbar
(setq tabbar-ruler-global-ruler t)     ; get global ruler
(setq tabbar-ruler-popup-menu t)       ; get popup menu.
(setq tabbar-ruler-popup-toolbar t)    ; get popup toolbar
(setq tabbar-ruler-popup-scrollbar t)  ; show scroll-bar on mouse-move
(require 'tabbar-ruler)
