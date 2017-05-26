;; -*- mode: emacs-lisp -*-

;;~~~~~~~
;; LAYERS
;;~~~~~~~

(defun dotspacemacs/layers ()
  (setq-default

   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '() ; additional paths must have a trailing slash (i.e. `~/.mycontribs/')

   dotspacemacs-configuration-layers '(javascript
                                       (shell :variables
                                              shell-default-shell 'multi-term)
                                       osx
                                       better-defaults
                                       helm
                                       (ranger :variables
                                               ranger-show-preview t)
                                       emacs-lisp
                                       git
                                       markdown
                                       html
                                       python
                                       ess
                                       clojure
                                       semantic
                                       auto-completion
                                       (spell-checking :variables
                                                       spell-checking-enable-by-default nil)
                                       syntax-checking
                                       evil-cleverparens
                                       evil-snipe
                                       typography
                                       emoji
                                       colors
                                       pdf-tools
                                       slack
                                       emms
                                       search-engine
                                       theming
                                       )

   ;; put additional unwrapped packages configuration in `dotspacemacs/user-config'
   dotspacemacs-additional-packages '(all-the-icons
                                      all-the-icons-dired
                                      evil-vimish-fold
                                      indent-guide
                                      evil-multiedit
                                      counsel
                                      wgrep
                                      git-gutter-fringe
                                      org-bullets
                                      dired-hacks-utils
                                      dired-filter
                                      )

   ;; packages prevented update
   dotspacemacs-frozen-packages '()

   ;; packages to install & load
   dotspacemacs-excluded-packages '()

   ;; unused dependency treatment
   dotspacemacs-install-packages 'used-only))


;;~~~~~~~~~~~~~~~
;; SPACEMACS INIT
;;~~~~~~~~~~~~~~~

(defun dotspacemacs/init ()
  "initialization function, called at spacemacs initialization before layers config"
  (setq-default
   dotspacemacs-elpa-https nil
   ;; maximum allowed time in seconds to contact an ELPA repository
   dotspacemacs-elpa-timeout 10
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; `vim', `emacs' or `hybrid'
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   ;; `recents' `bookmarks' `projects' `agenda' `todos'
   dotspacemacs-startup-lists '((agenda . 10)
                                (todos . 10)
                                (recents . 10)
                                (bookmarks . 10)
                                (projects . 10))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-themes '(doom-one)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '(
                               "Iosevka"
                               :size 13.5
                               :weight light
                               :width normal
                               :powerline-scale 1.5
                               )
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; whether separate commands are bound in the GUI.
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state.
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; if non nil the default layout name is displayed in the mode-line
   dotspacemacs-display-default-layout nil
   ;; if non nil, last auto saved layouts resume automatically
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native t
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; `evil' and `origami'.
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; default package repo if no explicit repository specified
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))


;;~~~~~~~~~~
;; USER INIT
;;~~~~~~~~~~


(defun dotspacemacs/user-init ()
  ;;-----------
  ;; THEME MODS
  ;;-----------

  (setq theming-modifications
        '((doom-one
           (font-lock-function-name-face :slant italic)
           ))
        )
  )

(defun mac-toggle-max-window ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           nil
                           'fullboth)))


;;~~~~~~~~~~~~
;; USER CONFIG
;;~~~~~~~~~~~~

(defun dotspacemacs/user-config ()
  "user configuration function called at end of Spacemacs initialization after layers configuration"


  ;;-----------
  ;; NETWORKING
  ;;-----------

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (require 'tramp)


  ;;--------
  ;; DISPLAY
  ;;--------

  (menu-bar-mode -1)

  ;; UTF-8 as the default coding system
  (set-charset-priority                 'unicode)
  (prefer-coding-system                   'utf-8)
  (set-terminal-coding-system             'utf-8)
  (set-keyboard-coding-system             'utf-8)
  (set-selection-coding-system            'utf-8)
  (setq locale-coding-system              'utf-8)
  (setq-default buffer-file-coding-system 'utf-8)

  (global-set-key [double-wheel-down] nil)
  (global-set-key [triple-wheel-down] nil)
  (global-set-key [double-wheel-up] nil)
  (global-set-key [triple-wheel-up] nil)
  (spacemacs/set-leader-keys "w1" 'spacemacs/toggle-maximize-buffer)

  (bind-keys :map dired-mode-map
             :prefix "C-,"
             :prefix-map dired-subtree-map
             :prefix-docstring "Dired subtree map."
             ("C-i"     . dired-subtree-insert)
             ("C-/"     . dired-subtree-apply-filter)
             ("C-k"     . dired-subtree-remove)
             ("C-n"     . dired-subtree-next-sibling)
             ("C-p"     . dired-subtree-previous-sibling)
             ("C-u"     . dired-subtree-up)
             ("C-d"     . dired-subtree-down)
             ("C-a"     . dired-subtree-beginning)
             ("C-e"     . dired-subtree-end)
             ("m"       . dired-subtree-mark-subtree)
             ("u"       . dired-subtree-unmark-subtree)
             ("C-o C-f" . dired-subtree-only-this-file)
             ("C-o C-d" . dired-subtree-only-this-directory))


  (setq ns-pop-up-frames nil)


  ;;----------------
  ;; file navigation
  ;;----------------

  (setq vc-follow-symlinks t)
  ;; reopen the last killed buffer
  (require 'cl)
  (require 'recentf)
  (recentf-mode 1)
  (defun undo-kill-buffer ()
    (interactive)
    (let ((active-files (loop for buf in (buffer-list)
                              when (buffer-file-name buf) collect it)))
      (loop for file in recentf-list
            unless (member file active-files) return (find-file file))))


  ;;----------
  ;; EVIL MODE
  ;;----------

  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)

  (setq evil-want-fine-undo 'fine)
  (setq powerline-default-separator 'slant)
  (spacemacs/toggle-highlight-current-line-globally-off)

  (spacemacs/toggle-evil-cleverparens-on)
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)

  ;; vim-style code folding
  (evil-vimish-fold-mode 1)
  (add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines t)))



  ;; ;;------
  ;; ;; THEME
  ;; ;;------

  (use-package all-the-icons)
  (setq all-the-icons-color-icons nil)
  (use-package all-the-icons-dired)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  (require 'doom-themes)
  (load-theme 'doom-one t)

  ;; (setq doom-neotree-enable-type-colors nil)


  (setq doom-enable-bold t
        doom-enable-italic t
        doom-one-brighter-modeline nil
        doom-one-brighter-comments nil)
  ;; brighter source buffers (that represent files)
  (add-hook 'find-file-hook 'doom-buffer-mode-maybe)
  ;; if you use auto-revert-mode
  (add-hook 'after-revert-hook 'doom-buffer-mode-maybe)
  ;; you can brighten other buffers (unconditionally)
  (add-hook 'ediff-prepare-buffer-hook 'doom-buffer-mode)
  ;; brighter minibuffer when active
  (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)

  ;; ;; use ls-lisp
  ;; (when (eq system-type 'darwin)
  ;;   (require 'ls-lisp)
  ;;   (setq ls-lisp-use-insert-directory-program nil))

  ;;; DOOM neotree
  (setq org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t)

  (setq doom-neotree-enable-variable-pitch nil
        doom-neotree-file-icons 'simple
        doom-neotree-line-spacing 2)

  (setq neo-banner-message nil) ; turn off neo help message
  (setq-default neo-show-hidden-files nil)
  (require 'doom-neotree)       ; requires all-the-icons fonts
  (require 'doom-nlinum)        ; requires nlinum & hl-line-mode

  (defun neotree-project-dir-toggle ()
    "open NeoTree in project root with find-file-in-project or current buffer directory"
    (interactive)
    (let ((project-dir
           (ignore-errors
             ;; pick one: projectile or find-file-in-project
             (projectile-project-root)
             ;; (ffip-project-root)
             ))
          (file-name (buffer-file-name))
          (neo-smart-open t))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
        (progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-find file-name))))))


  (define-key global-map (kbd "M-e") 'neotree-project-dir-toggle)
  (ranger-override-dired-mode t)
  (setq ranger-cleanup-on-disable t)
  (setq ranger-cleanup-eagerly t)
  ;(setq ranger-width-parents 0.20)
  (setq ranger-parent-depth 0)
  ;(setq ranger-width-preview 0.50)
  (setq ranger-excluded-extensions '("mkv" "iso" "mp3" "mp4" "MP3" "MP4" "avi" "mpg" "flv" "ogg"))
  (setq ranger-dont-show-binary t)
  (setq neo-theme 'icons)

  ;;---
  ;; SX
  ;;---

  (setq stackexchange-packages
        '(sx))
  (defun stackexchange/init-sx ()
    (use-package sx
      :defer t))


  ;;---------
  ;; ORG MODE
  ;;---------

  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list
        '("☉" "◯" "◉" "-" "+" "◇"))


  ;;------
  ;; SHELL
  ;;------

  (setenv "TERMINFO" "~/.terminfo")
  (setenv "TERM" "xterm-256color")
  ;(setq system-uses-terminfo nil)
 
  (defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
  (ad-activate 'ansi-term)

  (setq multi-term-program "/usr/local/bin/zsh")
  (defadvice multi-term (after advise-multi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

  (add-hook 'term-mode-hook
            (lambda ()
              (define-key term-raw-map (kbd "C-y") 'term-paste)))

  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)))

  (setq shell-pop-full-span nil)


  ;;----
  ;; ESS
  ;;----

  (add-hook 'ess-mode-hook
            (lambda ()
              (ess-toggle-underscore nil)))
  (add-to-list 'auto-mode-alist '("\\.R$" . R-mode))


  ;;------
  ;; MELPA
  ;;------

  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("org" . "http://orgmode.org/elpa/") t)
  (when (< emacs-major-version 24)
    ;; for important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (package-initialize)


  ;;----------
  ;; PDF TOOLS
  ;;----------

  (use-package pdf-tools
    :ensure t
    :config
    (custom-set-variables
     '(pdf-tools-handle-upgrades nil))
    (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
  (pdf-tools-install)


  ;;----
  ;; GIT
  ;;----

;  (push (cons 'background-color (face-background 'default)) default-frame-alist)
;  (push (cons 'foreground-color (face-foreground 'default)) default-frame-alist)

  ;; More reliable inter-window border
  (setq window-divider-default-places t
        window-divider-default-bottom-width 1
        window-divider-default-right-width 1)
  (window-divider-mode +1)

  (setq git-gutter-fr:side 'right-fringe)
  ;; subtle diff indicators in the fringe
  ;; places the git gutter outside the margins.
  (setq-default fringes-outside-margins t)
  ;; thin fringe bitmaps
  ;; (define-fringe-bitmap 'git-gutter-fr:added
  ;;   [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
  ;;   nil nil 'center)
  ;; (define-fringe-bitmap 'git-gutter-fr:modified
  ;;   [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
  ;;   nil nil 'center)
  ;; (define-fringe-bitmap 'git-gutter-fr:deleted
  ;;   [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
  ;;   nil nil 'center)

  ;;-------
  ;; INDENT
  ;;-------

  (indent-guide-global-mode)
  (set-face-foreground 'indent-guide-face "#21242b")
  (setq indent-guide-delay nil)
  (setq indent-guide-char "│")

  (defun aj-toggle-fold ()
    "toggle fold all lines larger than indentation on current line"
    (interactive)
    (let ((col 1))
      (save-excursion
        (back-to-indentation)
        (setq col (+ 1 (current-column)))
        (set-selective-display
         (if selective-display nil (or col 1))))))
  (global-set-key [(M C i)] 'aj-toggle-fold)


  ;;----------
  ;; DASHBOARD
  ;;----------


  (spaceline-toggle-minor-modes)
  (setq-default cursor-in-non-selected-windows nil)
  ;(spacemacs/layout-double-columns)
  (switch-to-buffer "*scratch*")
  ;; (neotree-show)
  ;(select-window-0)
  (display-time-mode 1)
  (spacemacs/toggle-fullscreen-frame-on)
  (spaceline-compile)
  (setq redisplay-dont-pause t)
  (setq redisplay-dont-pause t
        scroll-margin 100
        scroll-step 1
        scroll-conservatively 10000
        scroll-preserve-screen-position 1)

  ) ;; /user-config


;;;~~~~~~~~~~~~~~~
;;; auto-generated
;;;~~~~~~~~~~~~~~~

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (dired-filter dired-hacks-utils fontawesome rainbow-mode rainbow-identifiers color-identifiers-mode mode-icons spaceline-all-the-icons wgrep evil-multiedit counsel swiper ivy ranger emms doom-themes font-lock+ web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode highlight-indent-guides vimish-fold evil-vimish-fold engine-mode sx stickyfunc-enhance srefactor evil-snipe evil-cleverparens diredful hl-line+ nlinum all-the-icons ox-gfm org-pdfview seq smooth-scrolling typo pdf-tools tablist emoji-cheat-sheet-plus company-emoji reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl shell-current-directory fish-mode stylus-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data dashboard yapfify slack emojify circe oauth2 websocket ht pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode cython-mode company-anaconda clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider queue clojure-mode anaconda-mode pythonic doom xterm-color smeargle shell-pop orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary all-the-icons-dired ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(pdf-tools-handle-upgrades nil)
 '(spaceline-all-the-icons-file-name-highlight nil)
 '(spaceline-all-the-icons-icon-set-flycheck-slim (quote outline))
 '(spaceline-all-the-icons-icon-set-git-ahead (quote commit))
 '(spaceline-all-the-icons-icon-set-modified (quote circle))
 '(spaceline-all-the-icons-icon-set-sun-time (quote sun/moon))
 '(spaceline-all-the-icons-slim-render t)
 '(spaceline-all-the-icons-window-number-always-visible t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:slant italic))))
 '(spaceline-all-the-icons-info-face ((t (:foreground "#63B2FF" :weight light :family "Iosevka")))))
