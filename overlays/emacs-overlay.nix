let
  rev = "fa451069340a5fdac9b6497ce78989d4b73114a4";
  sha256 = "19v6w6bmw7mjbpnyjjhjw0lx5icz3d8llfpnb5118g7f9p5005cc";
  emacs-overlay = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
    inherit sha256;
  });
in
  emacs-overlay
