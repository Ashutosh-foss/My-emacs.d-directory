;;; init --- My init file for emacs
;;; Commentary:

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex")
 '(LaTeX-section-label
   (quote
    (("part" . "part:")
     ("chapter" . "chap:")
     ("section" . "sec:")
     ("subsection" . "ssec:")
     ("subsubsection" . "sssec:"))))
 '(ansi-color-names-vector
   ["#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("4fc7f95b03416aa4270cdeefecc45f3153b8ceadef2e8d5722dce63d1bf83400" "aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "5e2dc1360a92bb73dafa11c46ba0f30fa5f49df887a8ede4e3533c3ab6270e08" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#192028")
 '(global-font-lock-mode t)
 '(menu-bar-mode t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (djvu matlab-mode helm-w3m ztree zenburn-theme xwidgete wxwidgets-help writegood-mode window-numbering wget websocket w3 volatile-highlights vlf use-package undo-tree typit typing-practice typing-game twilight-anti-bright-theme transpose-frame timesheet swiper sr-speedbar sokoban smex smartparens slideview sl shut-up screenshot rudel request pacmacs org2blog org-themis org-pdfview org-ac nyan-mode multiple-cursors multifiles math-symbol-lists markdown-mode+ magit levenshtein latex-preview-pane latex-pretty-symbols langtool julia-shell irony-eldoc ipython iedit ido-vertical-mode ido-hacks hungry-delete highlight-tail helm-ls-hg helm-ls-git helm-flyspell helm-flycheck helm-ctest helm-company google-c-style golden-ratio gnuplot gnugo ggtags flymake-checkers flycheck-tip flycheck-pyflakes flycheck-irony flx-ido fish-mode expand-region eshell-manual eshell-git-prompt esh-help ereader epresent emstar emms duplicate-thing ducpel doctags distinguished-theme discover-my-major dired+ darkroom company-shell company-quickhelp company-irony-c-headers company-irony company-c-headers company-bibtex company-auctex cmake-project cmake-mode clean-aindent-mode clang-format chess cff blank-mode bash-completion auctex-latexmk arduino-mode annoying-arrows-mode anaphora ace-window 2048-game)))
 '(pdf-view-midnight-colors (quote ("white" . "black")))
 '(safe-local-variable-values
   (quote
    ((cmake-ide-cmake-command-flags "-DCMAKE_INSTALL_PREFIX=~/mysw" "-DCMAKE_BUILD_TYPE=Release")
     (cmake-ide-cmake-command-flags "-DCMAKE_INSTALL_PREFIX=~/mysw" "-DCMAKE_BUILD_TYPE=Debug"))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ;; ("melpa" . "https://melpa.org/packages/")
			 ("melpa_mb" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))
(prefer-coding-system 'utf-8)
(require 'package)
;; (defvar package-check-signature)
;; (setq package-check-signature nil)

(package-initialize)
(setq load-prefer-newer t)

(add-to-list 'load-path "/home/nidish_ubuntu1604/.emacs.d/cmake-ide")
(add-to-list 'load-path "/home/nidish_ubuntu1604/.emacs.d/irony-mode")
(add-to-list 'load-path "/home/nidish_ubuntu1604/.emacs.d/sow")
(add-to-list 'load-path "/home/nidish_ubuntu1604/.emacs.d/workgroups2/src")
(add-to-list 'load-path "/home/nidish_ubuntu1604/Software_Tools/rtags/src")
(add-to-list 'load-path "~/.emacs.d/setup-linum/")

;; My Shortcuts
(global-set-key (kbd "C-c C-x c") 'comment-region)
(global-set-key (kbd "C-c C-x u") 'uncomment-region)
(global-set-key (kbd "M-s M-s") 'shell-script-mode)
(global-set-key (kbd "M-s RET") 'ansi-term)
(global-set-key (kbd "C-x t") 'transpose-frame)
(global-set-key (kbd "C-x c") 'compile)
(global-set-key (kbd "C-x p") (kbd "C-u -1 C-x o"))
(global-set-key (kbd "C-c C-x k") 'kill-emacs)

(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-b") 'eval-buffer)

;; Org-Mode
(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-co" 'org-indent-mode)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-log-done 'time)
(setq org-log-done 'note)

;; multiple-cursors
(require 'multiple-cursors)

;; multifiles
(require 'multifiles)
(global-set-key (kbd "C-x m") 'mc/edit-lines)

;; AucTeX
(require 'tex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(require 'tex-fold)
(add-hook 'TeX-mode-hook
	  (lambda ()
	    (TeX-fold-mode 1)
	    (add-hook 'find-file-hook 'TeX-fold-buffer t t)
	    (add-hook 'after-change-functions
		      (lambda (start end oldlen)
			(when (= (- end start) 1)
			  (let ((char-point
				 (buffer-substring-no-properties
				  start end)))
			    (when (or (string= char-point "}")
			    	      (string= char-point "$"))
			      (TeX-fold-paragraph))
			    )))
		      t t)))
(add-hook 'TeX-mode-hook #'auto-fill-mode)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; latexmk support for auctex
(require 'auctex-latexmk)
(auctex-latexmk-setup)

;; pdf-tools
(pdf-tools-install)
(require 'sow)
(sow-mode t)

;; pdf-info-synctex-forward-search
;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools")) TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook #'TeX-revert-document-buffer)

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
(add-hook 'TeX-mode 'pdf-sync-minor-mode)
(define-key TeX-mode-map (kbd "C-c M-v") 'pdf-sync-display-pdf)
(define-key TeX-mode-map (kbd "C-c v") 'pdf-sync-forward-search)

(add-hook 'TeX-mode 'auto-fill-mode)

;; langtool
(require 'langtool)
(setq langtool-language-tool-jar "/home/nidish_ubuntu1604/Software_Tools/LanguageTool/LanguageTool-3.6/languagetool-commandline.jar")

(global-set-key "\C-x4w" 'langtool-check)
(global-set-key "\C-x4W" 'langtool-check-done)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
(global-set-key "\C-x44" 'langtool-show-message-at-point)
(global-set-key "\C-x4c" 'langtool-correct-buffer)

(setq langtool-default-language "en-US")

;; ggtags mode
;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
;;	  (lambda ()
;;	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;	      (ggtags-mode 1))))

;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)

;; (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
;; (add-hook 'dired-mode-hook 'ggtags-mode)

;; speedbar
(setq speedbar-show-unknown-files t)

;; sr-speedbar
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

;; setup-linum
(require 'setup-linum)

;; Octave-mode
;; (defvar octave-mode-map)
(require 'octave)
(define-key octave-mode-map (kbd "C-c C-c") 'octave-mode-buffer)

;; display time
(display-time-mode t)

;; emacs init file
(find-file "~/.emacs.d/init.el")
(require 'preview)

;; imaxima
(add-to-list 'load-path "/home/nidish_ubuntu1604/mysw/share/maxima/branch_5_39_base_170_ga91c576/emacs")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))
(setq imaxima-fnt-size "Large")

;; (define-key maxima-mode-map [C-tab] 'maxima-complete)
;; (define-key inferior-maxima-mode-map [(tab)] 'maxima-complete)
(autoload 'emaxima-mode "emaxima" "Emaxima" t)
(add-hook 'emaxima-mode-hook 'emaxima-mark-file-as-emaxima)
(setq emaxima-abbreviations-allowed t)

;; emms
(require 'emms-setup)
(emms-all)
(emms-default-players)

;; Reftex
(add-hook 'LaTeX-mode-hook 'reftex-mode)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))

;; Ido-mode
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)
;; (require 'ido-hacks nil t)
;; (if (commandp 'ido-vertical-mode)
;;     (progn
;;       (ido-vertical-mode 1)
;;       (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)))
;; (if (commandp 'smex)
;;     (global-set-key (kbd "M-x") 'smex))
;; (if (commandp 'flx-ido-mode)
;;     (flx-ido-mode 1))

;; y-or-n instead of yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; helm
(require 'helm-config)
(require 'helm)
(require 'helm-ls-git)
(require 'helm-ctest)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c t") 'helm-ctest)
(define-key helm-find-files-map "\t" 'helm-execute-persistent-action)
(setq
 helm-split-window-in-side-p           t
   ; open helm buffer inside current window,
   ; not occupy whole other window
 helm-move-to-line-cycle-in-source     t
   ; move to end or beginning of source when
   ; reaching top or bottom of source.
 helm-ff-search-library-in-sexp        t
   ; search for library in `require' and `declare-function' sexp.
 helm-scroll-amount                    8
   ; scroll 8 lines other window using M-<next>/M-<prior>
 helm-ff-file-name-history-use-recentf t
 ;; Allow fuzzy matches in helm semantic
 helm-semantic-fuzzy-match             t
 helm-imenu-fuzzy-match                t
 helm-echo-input-in-header-line        t )

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
		   (let ((bg-color (face-background 'default nil)))
		     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
	  'spacemacs//helm-hide-minibuffer-maybe)

;; Have helm automaticaly resize the window
(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

;; rtags
(require 'rtags)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(rtags-enable-standard-keybindings)

;; (require 'rtags-helm)
;; (setq rtags-use-helm t)
(setq rtags-use-helm 0)
(eval-after-load 'cc-mode
  '(progn
     (require 'rtags)
     (mapc (lambda (x)
             (define-key c-mode-base-map
               (kbd (concat "C-c r " (car x))) (cdr x)))
           '(("." . rtags-find-symbol-at-point)
             ("," . rtags-find-references-at-point)
             ("v" . rtags-find-virtuals-at-point)
             ("V" . rtags-print-enum-value-at-point)
             ("/" . rtags-find-all-references-at-point)
             ("Y" . rtags-cycle-overlays-on-screen)
             (">" . rtags-find-symbol)
             ("<" . rtags-find-references)
             ("-" . rtags-location-stack-back)
             ("+" . rtags-location-stack-forward)
             ("D" . rtags-diagnostics)
             ("G" . rtags-guess-function-at-point)
             ("p" . rtags-set-current-project)
             ("P" . rtags-print-dependencies)
             ("e" . rtags-reparse-file)
             ("E" . rtags-preprocess-file)
             ("R" . rtags-rename-symbol)
             ("M" . rtags-symbol-info)
             ("S" . rtags-display-summary)
             ("O" . rtags-goto-offset)
             (";" . rtags-find-file)
             ("F" . rtags-fixit)
             ("X" . rtags-fix-fixit-at-point)
             ("B" . rtags-show-rtags-buffer)
             ("I" . rtags-imenu)
             ("T" . rtags-taglist)
	     ("q" . rtags-quit-rdm) ))))

;; flycheck
(require 'flycheck)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(global-flycheck-mode t)
;; (require 'flycheck-pyflakes)
(require 'helm-flycheck) ;; Not necessary if using ELPA package
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(require 'flycheck-rtags)
(defun my-flycheck-rtags-setup ()
  "Configure flycheck-rtags for better experience."
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-check-syntax-automatically nil)
  (setq-local flycheck-highlighting-mode nil))
;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

;; irony-mode
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  "."
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; yasnippet
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippet-snippets/")
(yas-global-mode 1)
(yas-reload-all)

;; company-irony completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-rtags)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; (setq company-backends (delete 'company-semantic
;; 			       company-backends))
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
;; tab-completion with no delay
(setq company-idle-delay 0)
(define-key c-mode-map [C-tab] 'company-complete)
(define-key c++-mode-map [C-tab] 'company-complete)

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))
(define-key company-active-map (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
(define-key company-active-map (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1)))

(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))
(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;; company-auctex
(company-auctex-init)

;; company-quickhelp
(require 'company-quickhelp)
(company-quickhelp-mode 1)

;; Setup cmake-ide
;; (load "~/.emacs.d/cmake-ide")
(require 'cmake-ide)
(cmake-ide-setup)
(setq cmake-ide-flags-c++ (append '("std-c++11")))
(global-set-key (kbd "C-c m") 'cmake-ide-compile)

(defun maybe-cmake-project-hook ()
  "Enable cmake project mode if CMakeLists.txt exists."
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

;; clang-format
(require 'clang-format)
(global-set-key (kbd "C-M-TAB") 'clang-format-region)

;; Flyspell-mode
(require 'flyspell)
(setq flyspell-issue-welcome-flag nil)

(define-key flyspell-mode-map (kbd "<f8>") 'helm-flyspell-correct)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word."
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))
;; (add-hook 'c++-mode-hook  'flyspell-prog-mode)
;; (add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; (if (fboundp 'prog-mode)
;;     (add-hook 'prog-mode-hook 'flyspell-prog-mode)
;;   (dolist (hook '(lisp-mode-hook emacs-lisp-mode-hook scheme-mode-hook
;; 				 clojure-mode-hook ruby-mode-hook yaml-mode
;; 				 python-mode-hook shell-mode-hook php-mode-hook
;; 				 css-mode-hook haskell-mode-hook caml-mode-hook
;; 				 nxml-mode-hook crontab-mode-hook perl-mode-hook
;; 				 tcl-mode-hook javascript-mode-hook))
;;     (add-hook hook 'flyspell-prog-mode)))

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(require 'cmake-mode)

;; Auto-hide compilation buffer upon success
(defun bury-compile-buffer-if-successful (buffer string)
 "Bury a compilation BUFFER if succeeded without warnings (STRING has finished)."
 (when (and
	(buffer-live-p buffer)
	(string-match "compilation" (buffer-name buffer))
	(string-match "finished" string)
	(not
	 (with-current-buffer buffer
	   (goto-char (point-min))
	   (search-forward "warning" nil t))))
    (run-with-timer 1 nil
		    (lambda (buf)
		      (bury-buffer buf)
		      (switch-to-prev-buffer (get-buffer-window buf) 'kill))
		    buffer)))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
(define-key c++-mode-map (kbd "C-c RET") 'compile)
(define-key c-mode-map (kbd "C-c RET") 'compile)

;; MAGIT
(require 'magit)
(global-set-key (kbd "M-g M-s") 'magit-status)
(global-set-key (kbd "M-g M-c") 'magit-checkout)

;; undo-tree
(require 'undo-tree)
(add-hook 'after-init-hook 'undo-tree-mode)

;; workgroups2
(require 'workgroups2)
(workgroups-mode 1)

;; duplicate-thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode 1)

;; golden-ratio
(require 'golden-ratio)
(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "gud-mode"
                                   "gdb-locals-mode"
                                   "gdb-registers-mode"
                                   "gdb-breakpoints-mode"
                                   "gdb-threads-mode"
                                   "gdb-frames-mode"
                                   "gdb-inferior-io-mode"
                                   "gud-mode"
                                   "gdb-inferior-io-mode"
                                   "gdb-disassembly-mode"
                                   "gdb-memory-mode"
                                   "magit-log-mode"
                                   "magit-reflog-mode"
                                   "magit-status-mode"
                                   "IELM"
                                   "eshell-mode"
				   "dired-mode"
				   "latex-mode"
				   "pdf-view-mode"
				   "emaxima-mode"
				   ))
(defun pl/helm-alive-p ()
  "Inhibit golden-ratio if helm is active."
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
(golden-ratio-mode 1)

;; nyan-mode
(require 'nyan-mode)
;; (case window-system
;;   ((x w32) (setq nyan-mode t) ) )
(setq nyan-mode t)
(setq nyan-animate-nyancat t)
(nyan-refresh)

;; dired+
(require 'dired+)
(setq diredp-hide-details-initially-flag nil)

;; visible bell
(setq visible-bell 1)

;; auto compile
;; (require 'auto-compile)
;; (add-hook 'emacs-lisp-mode-hook 'auto-compile-on-load-mode)

;; ace-window
;; (global-set-key (kbd "C-x o") 'ace-window)

(add-to-list 'auto-mode-alist '("\\.cfg\\'" . c-mode))

;; When large numbers of nontechnical workers are using a programmable editor, they will be tempted constantly to begin programming in the course of their day-to-day lives. This should contribute greatly to computer literacy, especially because many of the people thus exposed will be secretaries taught by society that they are incapable of doing mathematics, and unable to imagine for a moment that they can learn to program. But that won't stop them from learning it if they don't know that it is programming that they are learning!
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(require 'julia-mode)
(defun my-julia-mode-hooks ()
  (require 'julia-shell-mode))
(add-hook 'julia-mode-hook 'my-julia-mode-hooks)
(define-key julia-mode-map (kbd "C-c C-c") 'julia-shell-run-region-or-line)
(define-key julia-mode-map (kbd "C-c C-s") 'julia-shell-save-and-go)


(provide 'init)
;;; init.el ends here
