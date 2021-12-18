let
  rev = "f7d0bac97f2fb5b56aa0db1511bf1c813f42856f";  # updated 2021-12-17
  sha256 = "0lk9kfirab0jq0i5z9giqsjdbrarskqwq0vbijhrii1j36d81dhy";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
