let
  rev = "a3abd804a0f05d3d388a6efced4f7bf50792deb6"; # updated 2023-03-18
  sha256 = "0bli9syc909d8r5rm1ayrpk3lw6c5lkgq0wr2hmcp87rlxbzhhm3";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
