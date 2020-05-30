{ stdenv
, lib
, emacsGit
, fetchFromGitHub
, libgccjit
}:

(emacsGit.override { srcRepo = true; }).overrideAttrs (
  o: rec {
    pname = "gccemacs";
    version = "28";
    src = fetchFromGitHub {
      owner = "emacs-mirror";
      repo = "emacs";
      # Fetching off the feature/native-comp git branch here:
      # https://github.com/emacs-mirror/emacs/commits/feature/native-comp
      rev = "eeebbd5fcbdf2827689311b3751437670bfc2e22";
      sha256 = "056ywm93v4wdk639nj41c9c6rfk21jp69k9ld6rzjjlygvb8lv1b";
    };
    patches = [];

    # When this is enabled, emacs does native compilation lazily after starting
    # up, resulting in quicker package builds up-front, at the cost of slower
    # running emacs until everything has been compiled. Since the elpa files in
    # the nix store are read-only and we have binary caches, we prefer the
    # longer AOT compilation instead of this flag.
    # makeFlags = [ "NATIVE_FAST_BOOT=1" ];

    LIBRARY_PATH = "${lib.getLib stdenv.cc.libc}/lib";

    configureFlags = o.configureFlags ++ [ "--with-nativecomp" ];

    buildInputs = o.buildInputs ++ [ libgccjit ];
  }
)
