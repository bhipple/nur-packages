self: super:
let

  brh-python = self.python3.withPackages (ps: with ps; [
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
    selenium
    yapf
  ]);

  # nvim ships with these three parsers by default, and gets angry if we desync them from the vendored versions.
  nvim-grammars = self.lib.attrNames (removeAttrs self.vimPlugins.nvim-treesitter.grammarPlugins [ "c" "lua" "query" ]);
  brh-neovim = super.neovim.override {
    configure.customRC = "source $HOME/.config/nvim/init.lua";
    configure.packages.myPlugins.start = [
      (self.vimPlugins.nvim-treesitter.withPlugins (p: map (n: p."${n}") nvim-grammars))
    ];
  };

  lsp-tools = [
    self.clang-tools
    self.lua-language-server
    self.nodePackages.bash-language-server
    self.nodePackages.vscode-json-languageserver
    self.pyright
    self.yaml-language-server

    self.ruff
  ];

in
{

  # FIXME: The newer version of ledger has floating point balance issues?
  # If this ever stops working, just pull it from the NixOS 24.05 channel.
  ledger = (super.ledger.override { usePython = true; }).overrideAttrs (_: rec {
    pname = "ledger";
    version = "3.2.1";

    src = super.fetchFromGitHub {
      owner = "ledger";
      repo = "ledger";
      rev = "v${version}";
      hash = "sha256-xp1MGDQPi0/OCo64yJXjyaEpv0eL28rpX5/zoTXv0nQ";
    };

    patches = [
      # Add support for $XDG_CONFIG_HOME. Remove with the next release
      (super.fetchpatch {
        url = "https://github.com/ledger/ledger/commit/c79674649dee7577d6061e3d0776922257520fd0.patch";
        sha256 = "sha256-vwVQnY9EUCXPzhDJ4PSOmQStb9eF6H0yAOiEmL6sAlk=";
        excludes = [ "doc/NEWS.md" ];
      })

      # Fix included bug with boost >= 1.76. Remove with the next release
      (super.fetchpatch {
        url = "https://github.com/ledger/ledger/commit/1cb9b84fdecc5604bd1172cdd781859ff3871a52.patch";
        sha256 = "sha256-ipVkRcTmnEvpfyPgMzLVJ9Sz8QxHeCURQI5dX8xh758=";
        excludes = [ "test/regress/*" ];
      })
    ];
  });

  # Minimal set of packages to install everywhere
  minEnv = super.hiPrio (
    super.buildEnv {
      name = "minEnv";
      paths = [
        brh-neovim
        brh-python
        self.alacritty
        self.bat
        self.bc
        self.comma
        self.coreutils
        self.curl
        self.fd
        self.feh
        self.file
        self.fzf
        self.git-crypt
        self.gitui
        self.gnutar
        self.google-chrome
        self.htop
        self.hwinfo
        self.jq
        self.killall # used by i3
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
        self.xorg.xev
        self.xorg.xeyes
        self.xorg.xmodmap
        self.zellij
        self.zoxide
        self.zsh
      ] ++ builtins.filter self.lib.attrsets.isDerivation (builtins.attrValues self.nerd-fonts);
    }
  );

  # For "permanent" systems
  bigEnv = super.hiPrio (
    super.buildEnv {
      name = "bigEnv";
      paths = lsp-tools ++ [
        self.alsa-utils
        self.anki-bin
        self.aspell
        self.autoflake
        self.bind
        self.black
        self.chromedriver
        self.direnv
        self.discord
        self.dunst
        self.emacs
        self.ffmpeg
        self.gcc
        self.gitAndTools.git-lfs
        self.gitAndTools.gitFull
        self.gitAndTools.hub
        self.gnome-keyring
        self.gnumake
        self.gnutls
        self.graphviz
        self.icu
        self.imagemagick
        self.libheif
        self.libnotify # for nofify-send
        self.mupdf
        self.nixos-option
        self.nixpkgs-fmt
        self.nixpkgs-review
        self.nload
        self.nodejs
        self.ollama
        self.pavucontrol
        self.pdsh
        self.pulseaudioFull
        self.remmina
        self.shellcheck
        self.signal-desktop
        self.snixembed
        self.sshfs
        self.vlc
        self.xclip
        self.xdotool
        self.xsel
        self.zlib
        self.zoom-us
      ];
    }
  );
}
