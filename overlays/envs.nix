self: super:
let

  brh-python = self.python3.withPackages (ps: with ps; [
    beancount
    ipdb
    ipython
    jupytext
    matplotlib
    notebook
    numpy
    pandas
    pyflakes
    pylint
    python-lsp-server
    scipy
    seaborn
    yapf
  ]);

in
{

  # Workaround for https://github.com/NixOS/nixpkgs/issues/203976
  freerdp = super.freerdp.override {
    openssl = self.openssl_1_1;
  };

  # Minimal set of packages to install everywhere
  minEnv = super.hiPrio (
    super.buildEnv {
      name = "minEnv";
      paths = [
        brh-python
        self.bat
        self.bc
        self.coreutils
        self.curl
        self.fd
        self.feh
        self.file
        self.fzf
        self.git-crypt
        self.gitui
        self.gnused
        self.gnutar
        self.htop
        self.hwinfo
        self.jq
        self.neovim
        self.par
        self.pass
        self.pinentry
        self.ripgrep
        self.rlwrap
        self.sqlite
        self.tmux
        self.tmuxPlugins.copycat
        self.tmuxPlugins.open
        self.tmuxPlugins.sensible
        self.tmuxPlugins.yank
        self.tree
        self.unzip
        self.wget
        self.xorg.xmodmap
        self.xterm
        self.zoxide
        self.zsh
      ];
    }
  );

  # For "permanent" systems
  bigEnv = super.hiPrio (
    super.buildEnv {
      name = "bigEnv";
      paths = [
        self.alsa-utils
        self.anki-bin
        self.aspell
        self.autoflake
        self.bind
        self.brave
        self.cachix
        self.chromium
        self.clang-tools
        self.direnv
        self.discord
        self.dunst
        self.gcc
        self.gitAndTools.gitFull
        self.gitAndTools.hub
        self.gnome.gnome-keyring
        self.gnumake
        self.gnupg
        self.gnutls
        self.graphviz
        self.icu
        self.imagemagick
        self.ledger
        self.libnotify # for nofify-send
        self.mupdf
        self.nixopsUnstable
        self.nixpkgs-fmt
        self.nixpkgs-review
        self.nload
        self.nodePackages.bash-language-server
        self.nodePackages.pyright
        self.nodePackages.vscode-json-languageserver
        self.nodejs
        self.pavucontrol
        self.pdsh
        self.remmina
        self.shellcheck
        self.signal-desktop
        self.source-code-pro
        self.vlc
        self.xclip
        self.xsel
        self.youtube-dl
        self.zlib
      ];
    }
  );
}
