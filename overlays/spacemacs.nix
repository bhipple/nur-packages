self: super:
let
  # Many emacs packages may pull in dependencies on things they need
  # automatically, but for those that don't, here are the requisite NixPkgs. Nix
  # will wrap these into a buildEnv dir, and then add it to the wrapped emacs'
  # `exec-path` variable so that they're accessible inside emacs.
  myEmacsDeps = [
    # General tools
    self.direnv # For direnv-mode
    self.ripgrep # For vertico

    # C/C++ Tools
    self.clang-tools

    # Python Tools
    self.autoflake
    self.python3Packages.pyflakes

    # LSP Tools
    self.nodePackages.bash-language-server
    self.nodePackages.vscode-json-languageserver
  ];

  spacemacs = self.emacs.pkgs.withPackages (epkgs: myEmacsDeps);
in
{
  inherit spacemacs;
}
