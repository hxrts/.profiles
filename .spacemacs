;; -*- mode: emacs-lisp -*-

;~~~~~~~
; LAYERS
;~~~~~~~

(defun dotspacemacs/layers ()
  (setq-default

   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t

   ;; additional paths for configuration layers
   dotspacemacs-configuration-layer-path '() ; must have a trailing slash (i.e. `~/.mycontribs/')

   ;; load configuration layers
   dotspacemacs-configuration-layers
   '((
      javascript
      javascriptshell :variables
            shell-default-shell 'multi-term
            shell-default-term-shell "/usr/local/bin/zsh")    ; shell
     osx better-defaults helm emacs-lisp                      ; system
     git version-control                                      ; version-control
     markdown html python ess clojure                         ; languages
     semantic auto-completion spell-checking syntax-checking  ; correction
     evil-cleverparens evil-snipe                             ; evil
     typography emoji pdf-tools                               ; typography
     slack                                                    ; messaging
     search-engine)

   ;; additional unwrapped packages configuration in `dotspacemacs/user-config'
   dotspacemacs-additional-packages '(all-the-icons
                                      all-the-icons-dired
                                      evil-vimish-fold
                                      highlight-indent-guides)

   ;; packages that cannot be updated
   dotspacemacs-frozen-packages '()

   ;; packages that will not be installed & loaded
   dotspacemacs-excluded-packages '()

   ;; how to treat unused dependencies
   dotspacemacs-install-packages 'used-only))


;~~~~~~~~~~~~~~~
; SPACEMACS INIT
;~~~~~~~~~~~~~~~

(defun dotspacemacs/init ()
  "initialization function, called at spacemacs initialization before layers config"

  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   dotspacemacs-default-font '("Iosevka"
                               ;"Input"
                                :size 13.5
                                :weight normal
                                :width normal
                                :powerline-scale 1.5)
   ;; The leader key
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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
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
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
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
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
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
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))


;;----------
;; FUNCTIONS
;;----------

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )


;~~~~~~~~~~
; USER INIT
;~~~~~~~~~~


(defun dotspacemacs/user-init ()
  (my-setup-indent 2)
)


;~~~~~~~~~~~~
; USER CONFIG
;~~~~~~~~~~~~

(defun dotspacemacs/user-config ()
  "user configuration function called at end of Spacemacs initialization after layers configuration"

  (setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
 (require 'tramp)

  ;--------
  ; DISPLAY
  ;--------


  (menu-bar-mode -1)
  ;(tool-bar-mode 0)
  ;(spacemacs/toggle-fringe-off)
  (toggle-frame-fullscreen)


   ;(with-eval-after-load 'org "~/.emacs_config.org")

  ;----------
  ; EVIL MODE
  ;----------

  (setq-default indent-tabs-mode t)
  (setq-default tab-width 3)

  (setq evil-want-fine-undo 'fine)
  (setq powerline-default-separator 'slant)
  (spacemacs/toggle-highlight-current-line-globally-off)

  (spacemacs/toggle-evil-cleverparens-on)
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)


   ;; make whitespace-mode use just basic coloring
 (setq whitespace-line-column fill-column)
  (setq whitespace-style
   '(face lines-tail trailing tabs empty))
   (global-whitespace-mode +1)
   (add-hook 'before-save-hook 'delete-trailing-whitespace)

   (setq whitespace-display-mappings
 ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
   (space-mark 32 [183] [46])   ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
   (newline-mark 10 [182 10])   ; 10 LINE FEED
   (tab-mark 9 [9655 9] [92 9]) ; 9  TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
   ))

  ;; vim-style code folding
  (evil-vimish-fold-mode 1)

  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character)

  (add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines t)))


  ;;------
  ;; THEME
  ;;------

  (use-package nlinum-relative
    :config
    ;; something else you want
    (nlinum-relative-setup-evil)
    (add-hook 'prog-mode-hook 'nlinum-relative-mode))

  (spaceline-compile)

  (use-package all-the-icons)
  (use-package all-the-icons-dired)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  (require 'doom-themes)
  (load-theme 'doom-one t)

  (setq doom-enable-bold t
        doom-enable-italic t

        ;; doom-one specific settings
        doom-one-brighter-modeline nil
        doom-one-brighter-comments nil)
  ; brighter source buffers (that represent files)
  (add-hook 'find-file-hook 'doom-buffer-mode-maybe)
  ; if you use auto-revert-mode
  (add-hook 'after-revert-hook 'doom-buffer-mode-maybe)
  ; you can brighten other buffers (unconditionally) with:
  (add-hook 'ediff-prepare-buffer-hook 'doom-buffer-mode)
  ; brighter minibuffer when active
  (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)

  ; use ls-lisp
  (when (eq system-type 'darwin)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil))

  (require 'doom-neotree)    ; requires all-the-icons fonts
  (require 'doom-nlinum)     ; requires nlinum & hl-line-mode

  ;;; DOOM neotree
  (setq org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t)

  (require 'doom-neotree)

  (defun neotree-project-dir-toggle ()
  "Open NeoTree in project root with find-file-in-project,
   or the current buffer directory."
    (interactive)
    (let ((project-dir
           (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
         ; (projectile-project-root)
             (ffip-project-root)
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


  ;;------
  ;; SLACK
  ;;------

;;  (slack-register-team
;;   :name "emacs-daemon"
;;   :default t
;;   :client-id "3429687138.160486799190"
;;   :client-secret "45dfffa979b17789bb7bb90233f9b9e1"
;;   :token ""
;;   :subscribed-channels '(random))


  ;;---
  ;; SX
  ;;---

  (require 'use-package)

  (use-package sx
    :config
    (bind-keys :prefix "C-c s"
               :prefix-map my-sx-map
               :prefix-docstring "Global keymap for SX."
               ("q" . sx-tab-all-questions)
               ("i" . sx-inbox)
               ("o" . sx-open-link)
               ("u" . sx-tab-unanswered-my-tags)
               ("a" . sx-ask)
               ("s" . sx-search)))

  (define-prefix-command 'launcher-map)
  (global-set-key (kbd "s-l") 'launcher-map)
  (define-key launcher-map "qq" #'sx-tab-all-questions)
  (define-key launcher-map "qi" #'sx-inbox)
  (define-key launcher-map "qo" #'sx-open-link)
  (define-key launcher-map "qu" #'sx-tab-unanswered-my-tags)
  (define-key launcher-map "qa" #'sx-ask)
  (define-key launcher-map "qs" #'sx-search)

  ;;---------
  ;; ORG MODE
  ;;---------

  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


  ;;----------
  ;; DASHBOARD
  ;;----------

  (switch-to-buffer "*scratch*")
   (neotree-show)


  ;;----------------
  ;; file navigation
  ;;----------------

  (setq vc-follow-symlinks t)


  ;;------
  ;; SHELL
  ;;------

  (defadvice multi-term (after advise-multi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))

  (ad-activate 'multi-term)
  (prefer-coding-system 'utf-8)
  (setq system-uses-terminfo nil)

  (setq explicit-shell-file-name "/usr/local/bin/zsh")
  (setq multi-term-program "/usr/local/bin/zsh")


  ;;------
  ;; MELPA
  ;;------

  (require 'package)
  (add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/") t)
    (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)

  ;;----------
  ;; PDF TOOLS
  ;;----------

;  (use-package pdf-tools
;    :ensure t
;    :config
;    (custom-set-variables
;     '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
;    (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
;  (pdf-tools-install)

) ; /user-config


;;;~~~~~~~~~~~~~~~~~~~~~
;;; auto-generated below
;;;~~~~~~~~~~~~~~~~~~~~~

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (doom-themes font-lock+ web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode highlight-indent-guides vimish-fold evil-vimish-fold engine-mode sx stickyfunc-enhance srefactor evil-snipe evil-cleverparens diredful hl-line+ nlinum all-the-icons ox-gfm org-pdfview seq smooth-scrolling typo pdf-tools tablist emoji-cheat-sheet-plus company-emoji reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl shell-current-directory fish-mode stylus-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data dashboard yapfify slack emojify circe oauth2 websocket ht pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode cython-mode company-anaconda clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider queue clojure-mode anaconda-mode pythonic doom xterm-color smeargle shell-pop orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary all-the-icons-dired ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(pdf-tools-handle-upgrades nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ; init file should contain only one such instance
