let
  rev = "0f0f5d2bb1355507630f58f9db4bc6897ee12687";
  sha256 = "1a5cg0b86vp41iadzybn5wdqjlzzixamig71wmhry3grdamqj6i6";
  emacs-overlay = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
    inherit sha256;
  });
in
  emacs-overlay
