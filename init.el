;;; My emacs init File

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(tool-bar-mode nil)
 '(auctex-latexmk-inherit-TeX-PDF-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(display-battery-mode t)
 '(doc-view-continuous t)
 '(doc-view-scale-internally t)
 '(menu-bar-mode t)
 '(org-agenda-files (quote ("~/life.org")))
 '(pdf-view-midnight-colors (quote ("white" . "black")))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(timesheet-invoice-number 102)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(ansi-term-color-vector
   [unspecified "#FAFAFA" "#FF1744" "#66BB6A" "#F57F17" "#42A5F5" "#7E57C2" "#0097A7" "#546E7A"])
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(button ((t (:inherit default)))))

(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("melpa_mb" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))
(require 'package)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/setup-linum/")

;; My Shortcuts
(global-set-key (kbd "C-c C-x c") 'comment-region)
(global-set-key (kbd "C-c C-x u") 'uncomment-region)
(global-set-key (kbd "M-s M-s") 'shell-script-mode)
(global-set-key (kbd "M-s RET") 'ansi-term)
(global-set-key (kbd "C-x C-a") 'global-auto-complete-mode)
(global-set-key (kbd "C-x t") 'transpose-frame)
(global-set-key (kbd "C-x c") 'compile)
(global-set-key (kbd "C-x p") (kbd "C-u -1 C-x o"))
(global-set-key (kbd "C-c C-x k") 'kill-emacs)

(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-b") 'eval-buffer)

;; Org-Mode
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
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
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
			      (TeX-fold-paragraph)))))
		      t t)))
(add-hook 'TeX-mode-hook #'auto-fill-mode)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; latexmk support for auctex
(require 'auctex-latexmk)
(auctex-latexmk-setup)

;; pdf-tools
(pdf-tools-install)

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

;; company
;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (setq company-backends (delete 'company-cmake company-backends))
;; (add-to-list 'company-backends 'company-gtags)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-backends 'company-clang)

;; setup-linum
(load "setup-linum")
(require 'setup-linum)

;; Octave-mode
(eval-after-load 'octave-mode
  '(define-key octave-mode-map (kbd "C-c C-c") 'octave-send-buffer))

;; display time
(display-time-mode t)

;; .emacs
(find-file "~/.emacs.d/init.el")
(org-agenda nil "a")
(require 'preview)

;; imaxima
(add-to-list 'load-path "/usr/share/maxima/5.37.2/emacs")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))
(setq imaxima-fnt-size "Large")

;; (define-key maxima-mode-map [C-tab] 'maxima-complete)
;; (define-key inferior-maxima-mode-map [(tab)] 'maxima-complete)
(setq emaxima-abbreviations-allowed t)

;; emms
(add-to-list 'load-path "/home/nidish_ubuntu1604/.emacs.d/elpa/emms-20160801.1349")
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
(require 'rtags-helm)
(setq rtags-use-helm t)

;; flycheck
(require 'flycheck)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(global-flycheck-mode t)
(require 'flycheck-pyflakes)
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
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
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
(setq company-backends (delete 'company-semantic
			       company-backends))
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
;; tab-completion with no delay
(setq company-idle-delay 0)
(define-key c-mode-map [C-tab] 'company-complete)
(define-key c++-mode-map [C-tab] 'company-complete)

;; Setup cmake-ide
(require 'cmake-ide)
(cmake-ide-setup)
(setq cmake-ide-flags-c++ (append '("std-c++11")))
(global-set-key (kbd "C-c m") 'cmake-ide-compile)

(defun maybe-cmake-project-hook ()
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
  (ispell-word)
  )
(add-hook 'c++-mode-hook  'flyspell-prog-mode)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(if (fboundp 'prog-mode)
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (dolist (hook '(lisp-mode-hook emacs-lisp-mode-hook scheme-mode-hook
				 clojure-mode-hook ruby-mode-hook yaml-mode
				 python-mode-hook shell-mode-hook php-mode-hook
				 css-mode-hook haskell-mode-hook caml-mode-hook
				 nxml-mode-hook crontab-mode-hook perl-mode-hook
				 tcl-mode-hook javascript-mode-hook))
    (add-hook hook 'flyspell-prog-mode)))

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(require 'cmake-mode)

;; Auto-hide compilation buffer upon success
(defun bury-compile-buffer-if-successful (buffer string)
 "Bury a compilation buffer if succeeded without warnings "
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

(provide 'init)
;;; init.el ends here
