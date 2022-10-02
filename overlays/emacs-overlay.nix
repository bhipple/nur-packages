let
  rev = "70787f42dbf53b8a57c4b9181fd98da1d710ac5b"; # updated 2022-10-02
  sha256 = "03nqdk4j0grbjchqaxrxx5mxgvzrfg4wryw4iq6xzqmxliyk3liq";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
