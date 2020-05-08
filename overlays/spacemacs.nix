self: super: let

  myEmacsPkgs = ep: with ep.melpaPackages; [
    # There's a bug in the current source of evil-escape that causes it to
    # fail to build. We'll patch it out for now and hope it gets fixed in a
    # future version.
    (
      ep.evil-escape.overrideAttrs (
        o: {
          patches = (o.patches or []) ++ [
            (
              super.fetchpatch {
                url = https://github.com/BrianHicks/evil-escape/commit/b548e8450570a0c8dea47b47221b728c047a9baf.patch;
                sha256 = "1a2qrf4bpj7wm84qa3haqdg3pd9d8nh5vrj8v1sc0j1a9jifsbf6";
              }
            )
          ];
        }
      )
    )


    emacsql
    closql
    emacsql-sqlite
    flycheck-elsa
    forge
    gh
    ghub
    gist
    github-clone
    github-search
    logito
    marshal
    names
    terminal-here
    tmux-pane

    # Marked as broken
    # company-rtags
    # flycheck-rtags
    # helm-rtags

    # Not packaged
    # evil-unimpaired
    # hybrid-mode

    # Disable until we bump to a version w/ https://github.com/immerrr/lua-mode/pull/166 fixed
    # lua-mode
    # company-lua

    # The owner deleted this off of their github!
    # company-tern

    ep.elpaPackages.xclip

    ac-ispell
    ace-jump-helm-line
    ace-jump-mode
    ace-link
    ace-window
    adoc-mode
    aggressive-indent
    alert
    all-the-icons
    alsamixer
    anaconda-mode
    ansible
    ansible-doc
    anzu
    async
    attrap
    auto-compile
    auto-complete
    auto-dictionary
    auto-highlight-symbol
    auto-yasnippet
    autothemer
    avy
    bind-key
    bind-map
    blacken
    browse-at-remote
    bundler
    cargo
    ccls
    centered-cursor-mode
    chruby
    clang-format
    clean-aindent-mode
    cmm-mode
    column-enforce-mode
    company
    company-anaconda
    company-ansible
    company-c-headers
    company-cabal
    company-emacs-eclim
    company-ghc
    company-ghci
    company-go
    company-lsp
    company-nixos-options
    company-php
    company-plsense
    company-quickhelp
    company-restclient
    company-shell
    company-statistics
    company-terraform
    company-web
    concurrent
    confluence
    copy-as-format
    counsel
    counsel-gtags
    counsel-projectile
    cpp-auto-include
    cquery
    ctable
    cython-mode
    dactyl-mode
    dante
    dap-mode
    dash
    dash-functional
    deferred
    define-word
    devdocs
    diff-hl
    diminish
    direnv
    disaster
    docker
    docker-tramp
    dockerfile-mode
    doom-modeline
    dotenv-mode
    eclim
    editorconfig
    eldoc-eval
    elfeed
    elfeed-goodies
    elfeed-org
    elfeed-web
    elisp-slime-nav
    emmet-mode
    emms
    engine-mode
    ep.csv-mode
    ep.font-lock-plus
    ep.mmm-mode
    ep.orgPackages.org
    ep.orgPackages.org-plus-contrib
    ep.rtags
    ep.sql-indent
    ep.undo-tree
    epc
    epl
    esh-help
    eshell-prompt-extras
    eshell-z
    eval-sexp-fu
    evil
    evil-anzu
    evil-args
    evil-cleverparens
    evil-ediff
    evil-exchange
    evil-goggles
    evil-iedit-state
    evil-indent-plus
    evil-ledger
    evil-lion
    evil-lisp-state
    evil-magit
    evil-matchit
    evil-mc
    evil-nerd-commenter
    evil-numbers
    evil-org
    evil-surround
    evil-textobj-line
    evil-tutor
    evil-visual-mark-mode
    evil-visualstar
    expand-region
    eyebrowse
    f
    fancy-battery
    fill-column-indicator
    fish-mode
    flx
    flx-ido
    flycheck
    flycheck-bashate
    flycheck-haskell
    flycheck-ledger
    flycheck-package
    flycheck-pos-tip
    flycheck-rust
    flyspell-correct
    flyspell-correct-helm
    fringe-helper
    fuzzy
    gcmh
    ggtags
    gh-md
    ghc
    git-commit
    git-gutter
    git-gutter-fringe
    git-gutter-fringe-plus
    git-gutter-plus
    git-link
    git-messenger
    git-timemachine
    gitattributes-mode
    gitconfig-mode
    gitignore-mode
    gitignore-templates
    gntp
    gnuplot-mode
    go-eldoc
    go-fill-struct
    go-gen-test
    go-guru
    go-impl
    go-mode
    go-rename
    go-tag
    godoctor
    golden-ratio
    google-c-style
    google-translate
    goto-chg
    gradle-mode
    graphviz-dot-mode
    groovy-imports
    groovy-mode
    gruvbox-theme
    haml-mode
    haskell-mode
    haskell-snippets
    hcl-mode
    helm
    helm-ag
    helm-c-yasnippet
    helm-company
    helm-core
    helm-css-scss
    helm-dash
    helm-descbinds
    helm-flx
    helm-git-grep
    helm-gitignore
    helm-gtags
    helm-hoogle
    helm-ls-git
    helm-lsp
    helm-make
    helm-mode-manager
    helm-nixos-options
    helm-notmuch
    helm-org
    helm-org-rifle
    helm-projectile
    helm-purpose
    helm-pydoc
    helm-swoop
    helm-themes
    helm-xref
    hierarchy
    highlight
    highlight-indentation
    highlight-numbers
    highlight-parentheses
    hl-todo
    hlint-refactor
    ht
    htmlize
    hungry-delete
    hydra
    ibuffer-projectile
    iedit
    imenu-list
    impatient-mode
    importmagic
    indent-guide
    inf-ruby
    insert-shebang
    intero
    ivy
    jenkins
    jinja2-mode
    js-doc
    js2-mode
    js2-refactor
    json-mode
    json-navigator
    json-reformat
    json-snatcher
    know-your-http-well
    language-detection
    lcr
    ledger-mode
    link-hint
    live-py-mode
    livid-mode
    log4e
    lorem-ipsum
    lsp-haskell
    lsp-java
    lsp-mode
    lsp-python-ms
    lsp-treemacs
    lsp-ui
    macrostep
    magit
    magit-gitflow
    magit-popup
    magit-section
    magit-svn
    markdown-mode
    markdown-toc
    markup-faces
    maven-test-mode
    meghanada
    memoize
    minitest
    mmm-jinja2
    move-text
    multi-term
    multiple-cursors
    mvn
    mwim
    nameless
    nginx-mode
    nix-mode
    nix-update
    nixos-options
    nodejs-repl
    noflet
    notmuch
    ob-http
    ob-restclient
    open-junk-file
    org-bookmark-heading
    org-brain
    org-bullets
    org-category-capture
    org-cliplink
    org-download
    org-jira
    org-journal
    org-mime
    org-mru-clock
    org-pomodoro
    org-present
    org-projectile
    org-re-reveal
    org-super-agenda
    orgit
    overseer
    ox-gfm
    ox-jira
    ox-pandoc
    ox-twbs
    p4
    package-lint
    packed
    pandoc-mode
    paradox
    paredit
    parent-mode
    password-generator
    pcache
    pcre2el
    pdf-tools
    persp-mode
    pfuture
    pip-requirements
    pipenv
    pippel
    pkg-info
    popup
    popwin
    pos-tip
    powerline
    prettier-js
    projectile
    pug-mode
    py-isort
    pyenv-mode
    pytest
    pythonic
    pyvenv
    racer
    rainbow-delimiters
    rake
    rbenv
    request
    request-deferred
    restart-emacs
    restclient
    restclient-helm
    ripgrep
    robe
    rpm-spec-mode
    rspec-mode
    rubocop
    rubocopfmt
    ruby-hash-syntax
    ruby-refactor
    ruby-test-mode
    ruby-tools
    rvm
    s
    salt-mode
    sass-mode
    sbt-mode
    scala-mode
    scss-mode
    seeing-is-believing
    shell-pop
    shrink-path
    simple-httpd
    skewer-mode
    slim-mode
    smartparens
    smeargle
    solarized-theme
    spaceline
    spaceline-all-the-icons
    string-inflection
    swiper
    symbol-overlay
    symon
    systemd
    tablist
    tagedit
    tern
    terraform-mode
    toc-org
    toml-mode
    treemacs
    treemacs-evil
    treemacs-magit
    treemacs-projectile
    treepy
    unfill
    use-package
    uuidgen
    vi-tilde-fringe
    vimrc-mode
    visual-fill-column
    volatile-highlights
    vterm
    web-beautify
    web-completion-data
    web-mode
    which-key
    window-purpose
    winum
    with-editor
    writeroom-mode
    ws-butler
    xcscope
    xml-rpc
    xterm-color
    yaml-mode
    yapfify
    yasnippet
    yasnippet-snippets
    zeal-at-point
  ];

  # Many emacs packages may pull in dependencies on things they need
  # automatically, but for those that don't, here are the requisite NixPkgs. Nix
  # will wrap these into a buildEnv dir, and then add it to the wrapped emacs'
  # `exec-path` variable so that they're accessible inside emacs.
  myEmacsDeps = [
    # General tools
    self.direnv # For direnv-mode
    self.ripgrep # For helm
    self.sqlite # For dash-docsets

    # Python Tools
    self.autoflake
    self.python3Packages.pyflakes
    self.python3Packages.pyls-black
    self.python3Packages.pyls-isort
    self.python3Packages.pyls-mypy

    # Rust Tools
    self.cargo
    self.rustc
    self.rustfmt
  ];

in
{

  # Build a spacemacs with the pinned overlay import
  spacemacs = self.emacsWithPackagesFromUsePackage {
    config = "";
    package = self.gccemacs;
    extraEmacsPackages = ep: ((myEmacsPkgs ep) ++ myEmacsDeps);
  };

}
