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
  ];

  # Build a spacemacs with the pinned overlay import
  spacemacs = self.emacsWithPackagesFromUsePackage {
    config = "";
    package = self.emacs-git;
    extraEmacsPackages = _: myEmacsDeps;
  };

in
{
  inherit spacemacs;
}
